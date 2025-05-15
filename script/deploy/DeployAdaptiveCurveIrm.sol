// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue-irm/src/adaptive-curve-irm/AdaptiveCurveIrm.sol";
import "../Config.sol";

contract DeployMetaMorpho is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        AdaptiveCurveIrm irm = new AdaptiveCurveIrm(Config.MORPHO_BLUE);

        console.log("AdaptiveCurveIrm deployed at", address(irm));

        vm.stopBroadcast();
    }
}
