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

        address initialOwner = vm.addr(deployerPrivateKey);
        uint256 initialTimelock = 0;
        string memory name = "OW_USDC Vault";
        string memory symbol = "OW_USDC";
        bytes32 salt = bytes32(0);

        MetaMorphoV1_1Factory factory = MetaMorphoV1_1Factory(Config.META_MORPHO_FACTORY);

        IMetaMorphoV1_1 vault =
            factory.createMetaMorpho(initialOwner, initialTimelock, Config.OWUSDC, name, symbol, salt);

        console.log("Vault deployed at:", address(vault));

        vm.stopBroadcast();
    }
}
