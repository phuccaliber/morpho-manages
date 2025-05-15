// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue/src/Morpho.sol";
import "../Config.sol";

contract SetMorphoLLTV is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        Morpho morpho = Morpho(Config.MORPHO_BLUE);

        uint256 lltv = 86e16;
        morpho.enableLltv(lltv);

        bool isLltvEnabled = morpho.isLltvEnabled(lltv);

        console.log("LLTV address:", lltv);
        console.log("LLTV enabled:", isLltvEnabled);

        // Verify the curator was set correctly

        vm.stopBroadcast();
    }
}
