// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue-oracles/src/morpho-chainlink/MorphoChainlinkOracleV2Factory.sol";
import "../Config.sol";

contract DeployMetaMorpho is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        MorphoChainlinkOracleV2Factory factory = new MorphoChainlinkOracleV2Factory();
        console.log("Factory deployed at:", address(factory));

        vm.stopBroadcast();
    }
}
