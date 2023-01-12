pragma solidity ^0.5.0;

//  Import the following contracts from the OpenZeppelin library:
//    * `ERC20`
//    * `ERC20Detailed`
//    * `ERC20Mintable`
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// Create a constructor for the KaseiCoin contract and have the contract inherit the libraries that you imported from OpenZeppelin.
//IS IMPORTANT in order to run a contract. 
//
contract PlayTEK is ERC20, ERC20Detailed, ERC20Mintable {
    //we have to give value upon deploying it
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply
    )// this is a variable we can call and use inside the contract.  "name" is givien inside the constructor, and "sybmol" is given inside the contract. 
        ERC20Detailed(name, symbol, 18)
        public
        
    {//the msg.sender is the person who deploys the contract.  Inherited on line 14. . "msn.sender" is an address, and the droployed of the contract. 
        
    
    }
}
