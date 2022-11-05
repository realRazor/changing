// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Custom {
    address private owner;
    mapping (address => bool) public users;
    
    constructor () {
        owner = msg.sender;
    }
    function addUser(address _newuser) public onlyOwner userCheck(_newuser){
        users[_newuser] = true;
    }
    function deleteUser(address _deletedAddress) public onlyOwner isUserExist(_deletedAddress){
        users[_deletedAddress] = false;
    }
    function changeOwner(address _newAddress) public onlyOwner {
        owner = _newAddress;
    }
    function getOwner() external view returns(address){
        return owner;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner!");
        _;
    }
    modifier userCheck(address _newuser) {
        require(!users[_newuser], "Already Exist!");
        require(_newuser == msg.sender, "You have not authority!");
        _;
    }
    modifier isUserExist(address _user) {
        require(users[_user], "User Not Found!");
        _;
    }
}
