// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public view {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        address deployer = vm.addr(deployerPrivateKey);
        console.log("Deployer:", deployer);
        
        uint256 balance = deployer.balance;
        console.log("Deployer balance:", balance);
        console.log("Deployer balance (ETH):", balance);
    }
}
