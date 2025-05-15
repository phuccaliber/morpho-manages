// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../src/OWBTC.sol";
import "../Config.sol";

contract MintOWBTC is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        OWBTC owbtc = OWBTC(Config.OWBTC);
        
        address owner = vm.addr(deployerPrivateKey);

        uint256 amount = 1e8;
        owbtc.mint(owner, amount);
        vm.stopBroadcast();
    }
}
