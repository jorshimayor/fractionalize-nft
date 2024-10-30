# **NFT Fractionalization on Kaia – Chels & Chelsea Contracts**

This project demonstrates how to **fractionalize high-value NFTs** using Kaia's **KIP-17** (for NFTs) and **KIP-7** (for fungible tokens) standards. It involves two smart contracts:
1. **Chels Contract** – Mint and manage NFTs (KIP-17).
2. **Chelsea Contract** – Wrap NFTs, mint fractional tokens, and allow users to buy, trade, and redeem fractional ownership (KIP-7).

This project is **educational** and demonstrates how NFTs can be tokenized for fractional ownership, making them accessible, tradeable, and usable within DeFi ecosystems.

---

## **Project Overview**

### **Features**
- **Mint NFTs**: The `Chels` contract lets you create new NFTs.
- **Wrap NFTs**: The `Chelsea` contract holds an NFT and issues fractional ownership through KIP-7 tokens.
- **Enable Sales and Redemption**: Users can buy fractionalized NFTs, trade shares, or redeem them for KLAY.
- **DeFi Ready**: Fractional tokens can be traded on Kaia-compatible DEXes like **KaiaSwap**.

---

## **Installation and Setup**

### **Prerequisites**
1. **Remix IDE**: [Remix](https://remix.ethereum.org/) for contract compilation and deployment.
2. **MetaMask**: Install [MetaMask](https://metamask.io/) to connect to the Kaia Baobab testnet.
3. **Kaia Wallet**: Obtain some KLAY for gas fees using the **Kaia faucet** [here](https://baobab.wallet.Kaia.foundation/faucet).

## **How to Use This Project**

1. **Deploy the Contracts:**
   - Use Remix to deploy the `Chels.sol` and `Chelsea.sol` contracts.

2. **Mint an NFT:**
   - Mint an NFT using the `safeMint()` function in the `Chels` contract.

3. **Initialize Fractional Ownership:**
   - Call the `initialize()` function in the `Chelsea` contract with:
     - The address of the `Chels` contract.
     - The `tokenId` of the minted NFT.

4. **Set the NFT for Sale:**
   - Use the `putForSale()` function to set the price and put the NFT up for sale.

5. **Buy the NFT:**
   - Call `purchase()` from the buyer’s account, sending the required amount of KLAY.

6. **Redeem Tokens:**
   - Fractional token holders can redeem their share by calling the `redeem()` function.

---

## **Security Considerations**

1. **Audit**: This project is **for educational purposes only** and should not be used in production without a formal security audit.
2. **Gas Costs**: Ensure you have sufficient KLAY to cover gas fees during testing.
3. **Regulation**: Fractionalizing NFTs may involve regulatory concerns. Ensure compliance with relevant laws in your jurisdiction before using in production.

---

## **Possible Improvements**

1. **Staking Mechanism**: Implement a staking feature for fractional token holders.
2. **USDC Integration**: Allow redemptions in USDC instead of KLAY for stable-value payouts.
3. **DEX Integration**: Create liquidity pools for the fractional tokens on Kaia-compatible DEXes.

---

## **License**

This project is licensed under the **MIT License**. See `LICENSE` for details.

---

## **Contributing**

Contributions are welcome! If you find a bug or have suggestions for improvements, please open an issue or submit a pull request.

---

## **Acknowledgments**

- **Kaia** for providing blockchain infrastructure and tools.
- **OpenZeppelin** for secure, modular smart contract standards.
- **Shobhit (Web3 Club)** for the ERC tokens development.
