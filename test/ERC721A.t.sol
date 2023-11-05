// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {myANFT} from "../src/ERC721A.sol";

contract myANFT_test is Test {
    myANFT public myanft;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        myanft = new myANFT("myANFT", "MANFT");
    }

    function test_mint_1() public {
        vm.startPrank(alice);
        // mint NFT to alice
        myanft.mint_(alice, 1);
        // assertEq(myanft.balanceOf(alice), 1);
        vm.stopPrank();
    }

    function test_mint_10() public {
        vm.startPrank(alice);
        // mint NFT to alice
        myanft.mint_(alice, 10);
        // assertEq(myanft.balanceOf(alice), 10);
        vm.stopPrank();
    }

    function test_transfer_1() public {
        test_mint_1();
        vm.startPrank(alice);
        myanft.transfer_(alice, bob, 0);
        // assertEq(myanft.balanceOf(bob), 1);
        vm.stopPrank();
    }

    function test_transfer_middle() public {
        test_mint_10();
        vm.startPrank(alice);
        myanft.transfer_(alice, bob, 5);
        vm.stopPrank();
    }

    function test_transfer_last() public {
        test_mint_10();
        vm.startPrank(alice);
        myanft.transfer_(alice, bob, 9);
        vm.stopPrank();
    }

    function test_approve() public {
        test_mint_1();
        vm.startPrank(alice);
        myanft.approve_(bob, 0);
        vm.stopPrank();

        vm.startPrank(bob);
        myanft.transfer_(alice, bob, 0);
        // assertEq(myanft.balanceOf(bob), 1);
        vm.stopPrank();
    }

    function test_balanceOf() public {
        test_mint_1();
        vm.startPrank(alice);
        myanft.balanceOf_(alice);
        vm.stopPrank();
    }

    function test_ownerOf() public {
        test_mint_1();
        vm.startPrank(alice);
        myanft.ownerOf_(0);
        vm.stopPrank();
    }
}
