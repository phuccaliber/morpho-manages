// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../src/OWBTC.sol";

contract DeployOWBTC is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        OWBTC owbtc = new OWBTC();
        console.log("OWBTC deployed at:", address(owbtc));

        vm.stopBroadcast();
    }
}
