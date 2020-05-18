pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.

    address payable employee_one;
    address payable employee_two;
    address payable employee_three;


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }


    function balance() public view returns(uint) {
        // function should also return zero after paying beneficiaries. 
        // function serves as a test of supports
        return address(this).balance;
    }

    function deposit() public payable {
        // only owner can call account
        // require(msg.sender == msg.owner);
        
        // @TODO: Split `msg.value` into three
        uint amount = msg.value/3 ; // Your code here!

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        // the amount can only be an integer, so even when fraction, will still return integer
        // for example, msg.sender = 10. amount is 3, return 1
        // calculated by 10 - 3 * 3 = 1
        // aother example, msg.sender = 101, amount = 33, return 2 
        // calculated by 101 - 33 * 3 = 2
        
        // this is not wokring
        msg.sender.transfer(msg.value - amount *3);
        
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        deposit();
        
        
    }
}