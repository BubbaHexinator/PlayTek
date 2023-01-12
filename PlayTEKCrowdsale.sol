pragma solidity >=0.4.22 <0.9.0;

import "./PlayTEK.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract PlayTEKCrowdsale is Crowdsale, MintedCrowdsale{ // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    //kaseicoin contract. 
    constructor(
        uint rate,
        address payable wallet,
        PlayTEK token
    ) public 
    
    Crowdsale(rate, wallet, token) {
        // constructor can stay empty
    }
}


contract PlayTEKCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    address public PlayTEK_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    address public PlayTEK_crowdsale_address;

    // Add the constructor.
    constructor(
       string memory name,
       string memory symbol,
       address payable wallet
    ) 
    public 
    {
        // Create a new instance of the KaseiCoin contract.' new' is not the datatype.  "new" is calling the contract. 
        PlayTEK token = new PlayTEK(name, symbol, 0);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        PlayTEK_token_address = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        PlayTEKCrowdsale PlayTEK_crowdsale = new PlayTEKCrowdsale(1, wallet, token);        
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        //we are address function ( built in fuction inside sol) and we are passing it the variable we created on line 48
        PlayTEK_crowdsale_address = address(PlayTEK_crowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
        token.addMinter(PlayTEK_crowdsale_address);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role. 
        token.renounceMinter();
    }
}
