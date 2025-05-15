// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/metamorpho-v1.1/src/MetaMorphoV1_1.sol";
import "../Config.sol";

contract SubmitVaultCap is Script {
    using MarketParamsLib for MarketParams;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        MetaMorphoV1_1 vault = MetaMorphoV1_1(Config.OWUSDC_VAULT);

        MarketParams memory marketParams = MarketParams({
            loanToken: Config.OWUSDC,
            collateralToken: Config.OWBTC,
            oracle: Config.BTC_USDC_ORACLE,
            irm: Config.ADAPTIVE_CURVE_IRM,
            lltv: 86e16
        });
        Id[] memory supplyQueue = new Id[](1);
        supplyQueue[0] = marketParams.id();
        vault.setSupplyQueue(supplyQueue);
        console.log("Supply queue set");

        vm.stopBroadcast();
    }
}
