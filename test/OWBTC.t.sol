// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {OWBTC} from "../src/OWBTC.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract OWBTCTest is Test {
    OWBTC public token;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = makeAddr("owner");
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");

        vm.prank(owner);
        token = new OWBTC();
    }

    function testDecimals() public view {
        assertEq(token.decimals(), 8);
    }

    function testMint() public {
        uint256 amount = 1000 * 10 ** 8; // 1000 OWBTC

        vm.startPrank(owner);
        token.addOrRemoveFromWhitelist(user1, true);
        token.mint(user1, amount);
        vm.stopPrank();

        assertEq(token.balanceOf(user1), amount);
        assertEq(token.totalSupply(), amount);
    }

    function testMintFailureNotOwner() public {
        vm.prank(user1);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user1));
        token.mint(user1, 1000 * 10 ** 8);
    }

    function testMintToNonWhitelisted() public {
        vm.prank(owner);
        vm.expectRevert(abi.encodeWithSelector(OWBTC.NotWhitelisted.selector, user1));
        token.mint(user1, 1000 * 10 ** 8);
    }

    function testWhitelist() public {
        assertFalse(token.whitelisted(user1));

        vm.startPrank(owner);
        // Add user1 to whitelist
        token.addOrRemoveFromWhitelist(user1, true);
        assertTrue(token.whitelisted(user1));

        // Remove user1 from whitelist
        token.addOrRemoveFromWhitelist(user1, false);
        assertFalse(token.whitelisted(user1));
        vm.stopPrank();
    }

    function testWhitelistFailureNotOwner() public {
        vm.prank(user1);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, user1));
        token.addOrRemoveFromWhitelist(user2, true);
    }

    function testTransferToWhitelisted() public {
        // Setup: Add users to whitelist and mint tokens
        vm.startPrank(owner);
        token.addOrRemoveFromWhitelist(user1, true);
        token.addOrRemoveFromWhitelist(user2, true);
        token.mint(user1, 1000 * 10 ** 8);
        vm.stopPrank();

        // Transfer to whitelisted address should succeed
        vm.prank(user1);
        token.transfer(user2, 100 * 10 ** 8);
        assertEq(token.balanceOf(user2), 100 * 10 ** 8);
        assertEq(token.balanceOf(user1), 900 * 10 ** 8);
    }

    function testTransferToNonWhitelisted() public {
        // Setup: Add user1 to whitelist and mint tokens
        vm.startPrank(owner);
        token.addOrRemoveFromWhitelist(user1, true);
        token.mint(user1, 1000 * 10 ** 8);
        vm.stopPrank();

        // Transfer to non-whitelisted address should fail
        vm.prank(user1);
        vm.expectRevert(abi.encodeWithSelector(OWBTC.NotWhitelisted.selector, user2));
        token.transfer(user2, 100 * 10 ** 8);
    }

    function testTransferFromWhitelisted() public {
        // Setup: Add users to whitelist, mint tokens, and approve
        vm.startPrank(owner);
        token.addOrRemoveFromWhitelist(user1, true);
        token.addOrRemoveFromWhitelist(user2, true);
        token.mint(user1, 1000 * 10 ** 8);
        vm.stopPrank();

        vm.prank(user1);
        token.approve(owner, 500 * 10 ** 8);

        // TransferFrom should succeed
        vm.prank(owner);
        token.transferFrom(user1, user2, 100 * 10 ** 8);

        assertEq(token.balanceOf(user2), 100 * 10 ** 8);
        assertEq(token.balanceOf(user1), 900 * 10 ** 8);
        assertEq(token.allowance(user1, owner), 400 * 10 ** 8);
    }

    function testTransferFromToNonWhitelisted() public {
        // Setup: Add user1 to whitelist, mint tokens, and approve
        vm.startPrank(owner);
        token.addOrRemoveFromWhitelist(user1, true);
        token.mint(user1, 1000 * 10 ** 8);
        vm.stopPrank();

        vm.prank(user1);
        token.approve(owner, 500 * 10 ** 8);

        // TransferFrom to non-whitelisted address should fail
        vm.prank(owner);
        vm.expectRevert(abi.encodeWithSelector(OWBTC.NotWhitelisted.selector, user2));
        token.transferFrom(user1, user2, 100 * 10 ** 8);
    }
}
