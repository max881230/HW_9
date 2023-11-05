// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {myNFT} from "../src/ERC721.sol";

contract myNFT_test is Test {
    myNFT public mynft;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        mynft = new myNFT("myNFT", "MNFT");
    }

    function test_mint_1() public {
        vm.startPrank(alice);
        // mint NFT to alice
        mynft.mint_(alice, 0);
        // assertEq(mynft.balanceOf(alice), 5);
        vm.stopPrank();
    }

    function test_mint_10() public {
        vm.startPrank(alice);
        // mint NFT to alice
        for (uint256 i = 0; i < 10; i++) {
            mynft.mint_(alice, i);
        }
        // assertEq(mynft.balanceOf(alice), 5);
        vm.stopPrank();
    }

    function test_transfer_1() public {
        test_mint_1();
        vm.startPrank(alice);
        mynft.transfer_(alice, bob, 0);
        // assertEq(mynft.balanceOf(bob), 1);
        vm.stopPrank();
    }

    function test_transfer_middle() public {
        test_mint_10();
        vm.startPrank(alice);
        mynft.transfer_(alice, bob, 5);
        vm.stopPrank();
    }

    function test_transfer_last() public {
        test_mint_10();
        vm.startPrank(alice);
        mynft.transfer_(alice, bob, 9);
        vm.stopPrank();
    }

    function test_approve() public {
        test_mint_1();
        vm.startPrank(alice);
        mynft.approve_(bob, 0);
        vm.stopPrank();

        vm.startPrank(bob);
        mynft.transfer_(alice, bob, 0);
        // assertEq(mynft.balanceOf(bob), 1);
        vm.stopPrank();
    }

    function test_balanceOf() public {
        test_mint_1();
        vm.startPrank(alice);
        mynft.balanceOf_(alice);
        vm.stopPrank();
    }

    function test_ownerOf() public {
        test_mint_1();
        vm.startPrank(alice);
        mynft.ownerOf_(0);
        vm.stopPrank();
    }
}
