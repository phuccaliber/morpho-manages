// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/metamorpho-v1.1/src/MetaMorphoV1_1Factory.sol";
import "../Config.sol";

contract SetVaultCurator is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        address owner = vm.addr(deployerPrivateKey);

        IMetaMorphoV1_1 vault = IMetaMorphoV1_1(Config.OWUSDC_VAULT);

        vault.setCurator(owner);

        // Verify the curator was set correctly
        address currentCurator = vault.curator();
        if (currentCurator != owner) {
            revert("Failed to set curator correctly");
        }

        console.log("Vault curator set to:", currentCurator);

        vm.stopBroadcast();
    }
}
