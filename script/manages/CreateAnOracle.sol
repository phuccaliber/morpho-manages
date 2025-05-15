// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../../lib/morpho-blue-oracles/src/morpho-chainlink/MorphoChainlinkOracleV2Factory.sol";
import "../../lib/morpho-blue-oracles/src/morpho-chainlink/MorphoChainlinkOracleV2.sol";
import "../Config.sol";

contract CreateAnOracle is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_DEPLOYER");
        vm.startBroadcast(deployerPrivateKey);

        // base should be collateral
        AggregatorV3Interface baseFeed = AggregatorV3Interface(Config.BTC_ORACLE);
        // quote should be loan token
        AggregatorV3Interface quoteFeed = AggregatorV3Interface(Config.USDC_ORACLE);

        (, int256 basePrice,,,) = baseFeed.latestRoundData();
        (, int256 quotePrice,,,) = quoteFeed.latestRoundData();

        console.log("Base price:", basePrice);
        console.log("Quote price:", quotePrice);

        MorphoChainlinkOracleV2Factory factory = MorphoChainlinkOracleV2Factory(Config.MORPHO_CHAINLINK_ORACLE_FACTORY);

        MorphoChainlinkOracleV2 oracle = factory.createMorphoChainlinkOracleV2(
            IERC4626(address(0)),
            1,
            baseFeed,
            AggregatorV3Interface(address(0)),
            8,
            IERC4626(address(0)),
            1,
            quoteFeed,
            AggregatorV3Interface(address(0)),
            6,
            "0x"
        );

        console.log("Oracle created at:", address(oracle));

        vm.stopBroadcast();
    }
}
