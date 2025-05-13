// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue/src/Morpho.sol";
// import "@metamorpho/MetaMorphoV1_1Factory.sol";

contract DeployMetaMorpho is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        address deployer = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);
        Morpho morpho = new Morpho(deployer);
        console.log("Factory deployed at:", address(morpho));

        vm.stopBroadcast();
    }
}
