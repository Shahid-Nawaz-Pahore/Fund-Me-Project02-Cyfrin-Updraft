// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/fundme.sol";
import {DeployFundMe} from "../script/fundme.s.sol";
contract FundMeTest is Test{
    FundMe  fundme;
    function setUp() external {
       // fundme= new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       DeployFundMe deployFundMe = new DeployFundMe();
       fundme =  deployFundMe.run();
    }

    function  testMINIMUM_USD() public view {
        assertEq(fundme.MINIMUM_USD(),5e18);
    }

    function test_i_owner() public {
        console.log(fundme.i_owner());
        console.log(msg.sender);
        console.log(address(this));
        assertEq(fundme.i_owner(), msg.sender);
    }

    function testgetVersion() public {
        uint256 version = fundme.getVersion() ;
        assertEq(version, 4); 
    }

}