// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue/src/Morpho.sol";
import "../Config.sol";

contract SetMorphoIrm is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        Morpho morpho = Morpho(Config.MORPHO_BLUE);

        morpho.enableIrm(Config.ADAPTIVE_CURVE_IRM);

        bool isIrmEnabled = morpho.isIrmEnabled(Config.ADAPTIVE_CURVE_IRM);

        console.log("IRM address:", Config.ADAPTIVE_CURVE_IRM);
        console.log("IRM enabled:", isIrmEnabled);

        // Verify the curator was set correctly

        vm.stopBroadcast();
    }
}
