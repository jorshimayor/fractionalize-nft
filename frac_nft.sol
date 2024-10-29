// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@klaytn/contracts@1.0.6/KIP/token/KIP7/KIP7.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP17/IKIP17.sol";
import "@klaytn/contracts@1.0.6/access/Ownable.sol";
import "@klaytn/contracts@1.0.6/KIP/token/KIP7/extensions/draft-KIP7Permit.sol";

contract Chelsea is KIP7, Ownable, KIP7Permit {
    IKIP17 public collection;
    uint256 public tokenId;
    bool public initialized = false;
    bool public forSale = false;
    uint256 public salePrice;
    bool public canRedeem = false;

    constructor() KIP7("Chelsea", "CHE") KIP7Permit("Chelsea") {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return
            interfaceId == type(IKIP7Permit).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function initialize(address _collection, uint256 _tokenId) external onlyOwner {
        require(!initialized, "Already minted");
        collection = IKIP17(_collection);
        collection.safeTransferFrom(msg.sender, address(this), _tokenId);
        tokenId = _tokenId;
        initialized = true;
    }

    function sale(uint256 price) external onlyOwner {
        salePrice = price;
        forSale = true;
    }

    function purchase() external payable {
        require(forSale, "Not for sale");
        require(msg.value >= salePrice, "Not enough kaia sent");
        collection.transferFrom(address(this), msg.sender, tokenId);
        forSale = false;
        canRedeem = true;
    }

    function redeem(uint256 _amount) external {
        require(canRedeem, "You can't redeem this token");
        uint256 totalKei = address(this).balance;
        uint256 toRedeem = _amount * totalKei / totalSupply();

        _burn(msg.sender, _amount);
        payable(msg.sender).transfer(toRedeem);
    }
}
