// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    mapping (address => uint) public money;

    function setToken (address _adress, uint _amount) public {
        money[_adress] = _amount;
    }
    function sentToken(address _from,address _to,uint _amount) public{
        money[_from] -= _amount;
        money[_to] += _amount;
    }


}