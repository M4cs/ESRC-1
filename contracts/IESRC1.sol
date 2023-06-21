// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*

Author: Max Bridgland <@maxbridgland>

Based on ESIP-1 Proposal by @dumbnamenumbers: https://twitter.com/dumbnamenumbers/status/1671616392796184579

*/



interface IESRC1 {

    /**
     * In batch enscriptions, the `to` array and `data` array must match in length.
     */
    error MismatchBatchLengths();

    /**
     * Enscriptions cannot be sent to the ZeroAddress.
     */
    error EnscriptionToZeroAddress();

    /**
     * @dev Emitted when `minter` calls 
     */
    event CreateEthscription(address indexed minter, string dataURI);

    /**
     * @dev Emitted when transferring Ethscription to `recipient` using `ethscriptionTxHash`
     */
    event TransferEthscription(address indexed recipient, bytes32 indexed ethscriptionTxHash);

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
    ) external;

    /**
     * @dev Loops through `to` and `dataURIs` arrays to enscribe to
     * each respective address.
     *
     * Requirements:
     *
     * - `to` addresses cannot be the zero address.
     * - `dataURIs` values cannot be blank.
     *
     * Emits {CreateEthscription} events based on number of addresses supplied.
     */
    function batchEthscribe(
        address[] memory to,
        string[] memory dataURIs
    ) external;

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
    ) external;

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
    ) external;

}
