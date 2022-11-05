// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Ownable {
    address private owner;
    event OwnershipTransferred(address indexed preOwner, address indexed newOwner);

    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(owner == msg.sender,"Caller is not owner!!");
        _;
    }
    function getOwner()public view returns(address) {
        return owner;
    }
    function transferOwnerShip(address newOwner) public onlyOwner{
        require(newOwner != address(0),"New owner must be different from zero address");
        address oldOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(oldOwner,newOwner);
    }
    function renounceOwnership() public virtual onlyOwner {
        owner = address(0);
    }
}
contract UserMapping is Ownable{
    mapping(address => bool) users;
    function addUser (address newUser) public onlyOwner{
        users[newUser] =true;
    }
}
contract User2 is Ownable {
    mapping (address => bool) users;
    function addUser(address newUSer) public onlyOwner{
        users[newUSer] = true;
    }
    function renounceOwnership() public pure override {
        revert('renounceOwnership disabled');
    }
}

