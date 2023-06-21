# ESIP-1 Contract Draft Proposal

Based on https://twitter.com/dumbnamenumbers/status/1671616392796184579, I'm proposing this contract standard. 

This contract will enable people to inherit and easily create Ethscriptions from within their own contracts.

**THERE IS NO SECURITY. DO NOT USE THIS IN PRODUCTION. WILL BE UPDATED AS THE PROPOSAL IS BUILT OUT**

## To Use

```
pragma solidity ^0.8.18;

import './ESRC1.sol';

contract MyContract is ESRC1 {

  function mint(string memory dataURI) public {
    // Do some validation here maybe a signature check or something so people can't just call any dataURI
    enscribe(msg.sender, dataURI);
  }

}
```
