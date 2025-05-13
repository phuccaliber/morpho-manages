// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @title Config
/// @notice Contains the addresses of deployed contracts
library Config {
    // Core protocol
    address internal constant MORPHO_BLUE = address(0xEB4162C6E363e7C925395E82a8fe7BE78bc74A5f);
    address internal constant META_MORPHO_FACTORY = address(0xcB966E4924cFe446cD78720c0453e13C28e94f88); // Replace with actual address after deployment

    // Governance
    address internal constant TIMELOCK = address(0); // Replace with actual address after deployment
    address internal constant OWNER = address(0); // Replace with actual address after deployment
    address internal constant FEE_RECIPIENT = address(0); // Replace with actual address after deployment

    // Markets
    address internal constant USDC = address(0); // Replace with actual address
    address internal constant WETH = address(0); // Replace with actual address
    address internal constant WBTC = address(0); // Replace with actual address

    // Oracles
    address internal constant USDC_ORACLE = address(0); // Replace with actual address
    address internal constant WETH_ORACLE = address(0); // Replace with actual address
    address internal constant WBTC_ORACLE = address(0); // Replace with actual address

    // Interest Rate Models
    address internal constant DEFAULT_IRM = address(0); // Replace with actual address
}
