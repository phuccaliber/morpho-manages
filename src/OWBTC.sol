// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract OWBTC is ERC20, Ownable {
    event AddedToWhitelist(address indexed account);
    event RemovedFromWhitelist(address indexed account);

    error NotWhitelisted(address account);

    mapping(address => bool) public whitelisted;

    constructor() ERC20("OWBTC", "OWBTC") Ownable(msg.sender) {}

    function decimals() public pure override returns (uint8) {
        return 8;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function addOrRemoveFromWhitelist(address account, bool isWhitelisted) external onlyOwner {
        whitelisted[account] = isWhitelisted;
        if (isWhitelisted) {
            emit AddedToWhitelist(account);
        } else {
            emit RemovedFromWhitelist(account);
        }
    }

    function _update(address from, address to, uint256 value) internal override {
        if (!whitelisted[to]) {
            revert NotWhitelisted(to);
        }
        super._update(from, to, value);
    }
}
