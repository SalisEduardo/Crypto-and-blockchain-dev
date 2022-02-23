// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

// code develvoped from "Ethereum Projects for Beginners Build blockchain based cryptocurrencies smart contracts and DApps "

// more optmized and complex version of the other

import "./ConvertLib.sol";

contract MetaCoin{
    
    mapping (address => uint) balances;
    address payable creator;
    uint creatorFee = 1;
    uint collectedFees = 0; //"pot" - used to collect creator fee

    uint conversionRate = 5;

    uint CURRENCY_MULTIPLIER = 10**18;

    event Transfer(address indexed _from, address indexed _to, uint _value); //event still confuse

    // initialize the creator as message.sender
    function metaCoin() public {
        creator = payable(msg.sender);
        
    }
    
    // the conde will only be executed when the message.sender is the creator or the transaction origin comes from the creator
    // The underscore does that
    
    modifier onlyCreator(){
        if (msg.sender == creator || tx.origin == creator){ 
            _;
        }
    } 

    function collectFees() public onlyCreator {
        creator.transfer(collectedFees);
        collectedFees = 0;
        
    }

    function depsoit() public payable{
        balances[msg.sender] += msg.value * conversionRate * CURRENCY_MULTIPLIER;
    }

    function withdraw(uint amount) public {
        amount = amount * CURRENCY_MULTIPLIER;

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount / conversionRate);
    }


    function sendCoin(address receiver , uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);
        return true;

    }

    function getBalanceInEth(address addr) public view returns(uint){
        return ConvertLib.convert(getBalance(addr),2);   
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    
    }
}