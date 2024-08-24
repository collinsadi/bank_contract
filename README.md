# Bank Smart Contract

Welcome to the **Bank** smart contract! This contract is written in Solidity and runs on the Ethereum blockchain. It allows users to create accounts, deposit funds, withdraw funds, and transfer funds to other users. Below, you'll find a simple explanation of how each part of this smart contract works and how you can interact with it.

## Overview

The **Bank** smart contract is a simple contract that enables users to:
- Create a bank account
- Deposit funds into their account
- Transfer funds to other users
- Withdraw funds from their account

The contract keeps track of each user's account using a struct that holds their name, account address, and balance. Users can interact with the contract by calling the functions provided.

## How it Works

### Admin

- When the contract is deployed, the person who deploys it becomes the admin.
- The admin address is stored in a public variable called `admin`.

### Creating an Account

- To create an account, a user calls the `create` function with their name as a parameter.
- The contract checks if the user already has an account. If not, it creates a new `Account` struct with the user's name, address, and a starting balance of 0.
- The account is then added to an array of accounts, and a mapping keeps track of the user's index in the accounts array.

### Depositing Funds

- Users can deposit funds into their account by calling the `deposit` function.
- The function checks if the user has an account. If they do, the deposited amount is added to their account balance.

### Transferring Funds

- Users can transfer funds to another user's account using the `transfer` function.
- The function takes two parameters: the recipient's address and the amount to transfer.
- It checks if both the sender and receiver have accounts and if the sender has enough balance to cover the transfer.
- If all checks pass, the amount is subtracted from the sender's balance and added to the receiver's balance. The Ethereum blockchain's transfer functionality is then used to send the amount to the recipient's address.

### Withdrawing Funds

- Users can withdraw funds from their account by calling the `withdraw` function with the amount they want to withdraw.
- The contract checks if the user has an account and if they have enough balance to cover the withdrawal.
- If all checks pass, the amount is subtracted from the user's balance, and the funds are transferred to their address using the `transfer` function.

## Functions

Here's a list of the main functions provided by the contract and what they do:

1. **create(string memory _name)**:  
   Creates a new account with the given name for the user calling this function. The user's account address is the Ethereum address that called the function. An initial balance of 0 is set.

2. **deposit() payable**:  
   Allows the user to deposit Ether into their account. The amount deposited is added to their account balance.

3. **transfer(address payable _address, uint256 _amount)**:  
   Allows the user to transfer a specified amount of Ether from their account to another user's account. The recipient's address must be specified, and both the sender and recipient must have accounts.

4. **withdraw(uint256 _amount)**:  
   Allows the user to withdraw a specified amount of Ether from their account. The amount is deducted from their balance, and the Ether is transferred to the user's address.
