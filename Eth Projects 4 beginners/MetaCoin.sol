// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

// code develvoped from "Ethereum Projects for Beginners Build blockchain based cryptocurrencies smart contracts and DApps "

import "./ConvertLib.sol";

contract MetaCoin{
    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint _value); //event still confuse

    function metaCoin() public {
        balances[tx.origin] = 1000;

        
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