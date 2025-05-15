// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../src/OWBTC.sol";
import "../Config.sol";

contract SetOWBTCWhitelist is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);
        OWBTC owbtc = OWBTC(Config.OWBTC);
        
        address owner = vm.addr(deployerPrivateKey);

        owbtc.addOrRemoveFromWhitelist(owner, true);
        owbtc.addOrRemoveFromWhitelist(Config.MORPHO_BLUE, true);

        vm.stopBroadcast();
    }
}
