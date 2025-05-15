// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/metamorpho-v1.1/src/MetaMorphoV1_1Factory.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../Config.sol";

contract SupplyVault is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        address owner = vm.addr(deployerPrivateKey);

        IMetaMorphoV1_1 vault = IMetaMorphoV1_1(Config.OWUSDC_VAULT);
        ERC20 usdc = ERC20(Config.OWUSDC);

        // Verify the curator was set correctly
        uint256 assets = 150000e6;
        usdc.approve(address(vault), assets);

        vault.deposit(assets, owner);
        vm.stopBroadcast();
    }
}
