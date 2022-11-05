// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "./owner.sol";

contract DataTypes is Owner{
    bytes32 password;
    uint public loginCount;
    bool public isLogin;

    mapping (address => bool) public users;

    constructor (string memory _password){
        password = keccak256(abi.encodePacked((_password)));
    }

    function login(string memory _password) onlyOwner public returns(bool){
        require(!isLogin,"already logined in");
        require(loginCount<10,"login count is less than 10");
        require(password == keccak256(abi.encodePacked((_password))),"password doesnt match");

        loginCount++;
        isLogin=true;
        return true;
    }
    function logOut() public returns(bool){
        require (isLogin,"Already log out");
        isLogin = false;
        return true;
    }
    function addUser(address _newuser) onlyOwner loginCheck userCheck(_newuser) public{
        users[_newuser] = true;
    }
    
    modifier userCheck(address _newUser) {
        require(!users[_newUser],"user already added");
        _;
    }
    modifier loginCheck(){
        require(isLogin,"Please log in!");
        _;
    }
    
}