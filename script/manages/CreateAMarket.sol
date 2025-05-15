// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue/src/Morpho.sol";
import "../Config.sol";

contract CreateAMarket is Script {
    using MarketParamsLib for MarketParams;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        Morpho morpho = Morpho(Config.MORPHO_BLUE);

        MarketParams memory marketParams = MarketParams({
            loanToken: Config.OWUSDC,
            collateralToken: Config.OWBTC,
            oracle: Config.BTC_USDC_ORACLE,
            irm: Config.ADAPTIVE_CURVE_IRM,
            lltv: 86e16
        });

        Id marketId = marketParams.id();

        morpho.createMarket(marketParams);

        console.log("Market created successfully with Id:");
        console.logBytes32(Id.unwrap(marketId));

        // Verify the curator was set correctly

        vm.stopBroadcast();
    }
}
