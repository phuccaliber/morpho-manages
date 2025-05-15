// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../src/OWUSDC.sol";
import "../Config.sol";

contract MintOWUSDC is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        OWUSDC owusdc = OWUSDC(Config.OWUSDC);

        address owner = vm.addr(deployerPrivateKey);

        uint256 amount = 200000e6;
        owusdc.mint(owner, amount);
        vm.stopBroadcast();
    }
}
