// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Events {
    address owner;
    uint orderNumber;
    event addingOrder(uint orderNumber,address costumer);
    event switchingOrder(uint orderNumber,address customer,uint completingTime);
    struct Order {
        address customerAddress;
        string customerName;
        uint creatingTime;
        bool orderStatus;
    }
    Order internal order;
    Order[] public array;
    
    function addOrder(string memory customerName) public {        
        order = Order(msg.sender,customerName,block.timestamp,false);
        array.push(order);
        orderNumber++;
        emit addingOrder(orderNumber,msg.sender);
    }

    function switchStatus(uint indexOfArray) public{
        if(array[indexOfArray].orderStatus) revert('Order status is already completed');
        array[indexOfArray].orderStatus = true;
        emit switchingOrder(orderNumber,msg.sender,block.timestamp);
    }
}