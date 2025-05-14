// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @title Config
/// @notice Contains the addresses of deployed contracts
library Config {
    // Core protocol
    address internal constant OWNER = address(0x787bb22b6dEb95D8d61C6628a97448b6fedCb414);
    address internal constant MORPHO_BLUE = address(0xEB4162C6E363e7C925395E82a8fe7BE78bc74A5f);
    address internal constant META_MORPHO_FACTORY = address(0xcB966E4924cFe446cD78720c0453e13C28e94f88);
    address internal constant OWBTC = address(0xc7Bd64978a3dC064fe749F05FeC070b939CFaf07);
    address internal constant OWUSDC = address(0x9a00a26415Bf174cA2D74Cf02d9693d27A3A67a5);

    // Vault management
    address internal constant OWUSDC_VAULT = address(0x76b1a103d58dC2873f80ccaf96b7790668aEB0aC);
    address internal constant FEE_RECIPIENT = address(0); // Replace with actual address after deployment

    // Markets
    address internal constant USDC = address(0); // Replace with actual address
    address internal constant WETH = address(0); // Replace with actual address
    address internal constant WBTC = address(0); // Replace with actual address

    // Oracles
    address internal constant MORPHO_CHAINLINK_ORACLE_FACTORY = address(0xE7509Edb9b0612353aBf01160E7Bdb9747336BEE);
    address internal constant USDC_ORACLE = address(0); // Replace with actual address
    address internal constant WETH_ORACLE = address(0); // Replace with actual address
    address internal constant WBTC_ORACLE = address(0); // Replace with actual address

    // Interest Rate Models
    address internal constant DEFAULT_IRM = address(0); // Replace with actual address
}
