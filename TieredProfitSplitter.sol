pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;
        uint employee_one_rate = 60;  //CEO rate
        uint employee_two_rate = 25;  // CTO rate
        uint employee_three_rate = 15; // bob rate

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        // Step 2: Add the `amount` to `total` to keep a running total
        // Step 3: Transfer the `amount` to the employee
        amount = points;
        employee_one.transfer(points * employee_one_rate);
        total += amount;
        

        // employee_two transfer
        employee_two.transfer(points * employee_two_rate);
        total += amount;
        
        // employee three trsansfer
        employee_three.transfer(points * employee_three_rate);
        total += amount;
        
        // CEO gets paid first and also last. HA!
        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
