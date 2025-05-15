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
        uint256 newSupplyCap = 1000000e6;
        vault.submitCap(marketParams, newSupplyCap);

        (uint184 cap,,) = vault.config(marketParams.id());
        console.log("Cap ", cap);

        vault.acceptCap(marketParams);
        (cap,,) = vault.config(marketParams.id());
        console.log("New cap after accepting ", cap);

        vm.stopBroadcast();
    }
}
