// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Bank {
    struct Account {
        string name;
        address accountNumber;
        uint256 balance;
    }

    address public admin;

    Account[] public accounts;
    mapping(address => uint256) public accountsIndexes;

    constructor() {
        admin = msg.sender;
    }

    function create(string memory _name) public payable {
        require(accountsIndexes[msg.sender] == 0, "Account already exists");

        Account memory account;
        account.name = _name;
        account.accountNumber = msg.sender;
        account.balance = 0;

        accounts.push(account);
        accountsIndexes[msg.sender] = accounts.length;
    }

    function deposit() public payable {
        uint256 accountIndex = accountsIndexes[msg.sender];
        require(accountIndex > 0, "Account does not exist");

        accounts[accountIndex - 1].balance += msg.value;
    }

    function transfer(address payable _address, uint256 _amount) public {
        uint256 senderIndex = accountsIndexes[msg.sender];
        uint256 receiverIndex = accountsIndexes[_address];

        require(senderIndex > 0, "Sender account does not exist");
        require(receiverIndex > 0, "Receiver account does not exist");
        require(
            accounts[senderIndex - 1].balance >= _amount,
            "Insufficient Funds"
        );

        accounts[senderIndex - 1].balance -= _amount;
        accounts[receiverIndex - 1].balance += _amount;

        _address.transfer(_amount);
    }

    function withdraw(uint256 _amount) public {
        uint256 accountIndex = accountsIndexes[msg.sender];
        require(accountIndex > 0, "Account does not exist");

        Account storage userAccount = accounts[accountIndex - 1];
        require(userAccount.balance >= _amount, "Insufficient Funds");

        userAccount.balance -= _amount;

        payable(msg.sender).transfer(_amount);
    }
}
