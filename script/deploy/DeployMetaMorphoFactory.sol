// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/metamorpho-v1.1/src/MetaMorphoV1_1Factory.sol";
import "../Config.sol";
// import "@metamorpho/MetaMorphoV1_1Factory.sol";

contract DeployMetaMorpho is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        MetaMorphoV1_1Factory factory = new MetaMorphoV1_1Factory(Config.MORPHO_BLUE);
        console.log("Factory deployed at:", address(factory));

        vm.stopBroadcast();
    }
}
