// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*

Author: Max Bridgland <@maxbridgland>

Based on ESIP-1 Proposal by @dumbnamenumbers: https://twitter.com/dumbnamenumbers/status/1671616392796184579

*/


import "./IESRC1.sol";

contract ESRC1 is IESRC1 {

    /**
     * @dev Enscribes `dataURI` to `to` address.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `dataURI` cannot be blank.
     *
     * Emits a {CreateEthscription} event.
     */
    function ethscribe(
        address to,
        string memory dataURI
    ) external {
        if (to == address(0)) {
            revert EnscriptionToZeroAddress();
        }

        emit CreateEthscription(to, dataURI);
    }

    /**
     * @dev Loops through `to` and `data` arrays to enscribe to
     * each respective address.
     *
     * Requirements:
     *
     * - `to` addresses cannot be the zero address.
     * - `data` values cannot be blank.
     *
     * Emits {Enscription} events based on number of addresses supplied.
     */
    function batchEthscribe(
        address[] memory to,
        string[] memory dataURIs
    ) external {
        if (to.length != dataURIs.length) {
            revert MismatchBatchLengths();
        }

        unchecked {
            for (uint i=0;i<to.length;i++) {
                if (to[i] == address(0)) {
                    revert EnscriptionToZeroAddress();
                }
                emit CreateEthscription(to[i], dataURIs[i]);
            }
        }
    }

    /**
     * @dev Transfers ethscription to `to` address by original tx hash.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     *
     * Emits a {TransferEthscription} event.
     */
    function transferEthscription(
        address to,
        bytes32 txHash
    ) external {
        if (to == address(0)) {
            revert EnscriptionToZeroAddress();
        }

        emit TransferEthscription(to, txHash);
    }

    /**
     * @dev Loops through `to` and `txHashes` arrays to transfer Ethscription to
     * each respective address.
     *
     * Requirements:
     *
     * - `to` addresses cannot be the zero address.
     *
     * Emits {TransferEthscription} events based on number of addresses supplied.
     */
    function batchTransferEthscription(
        address[] memory to,
        bytes32[] memory txHashes
    ) external {
        if (to.length != txHashes.length) {
            revert MismatchBatchLengths();
        }

        unchecked {
            for (uint i=0;i<to.length;i++) {
                if (to[i] == address(0)) {
                    revert EnscriptionToZeroAddress();
                }
                emit TransferEthscription(to[i], txHashes[i]);
            }
        }
    }

}
