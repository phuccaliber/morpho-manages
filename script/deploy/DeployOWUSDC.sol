// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../src/OWUSDC.sol";

contract DeployOWUSDC is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        OWUSDC owusdc = new OWUSDC();
        console.log("OWUSDC deployed at:", address(owusdc));

        vm.stopBroadcast();
    }
}
