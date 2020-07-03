pragma solidity ^0.5.0;

import "./Token.sol";

contract EthSwap {
    string public name = "EthSwap instant exchange";
    Token public token;
    uint public rate = 100; // how many tokens you get per ETH

    event TokenPurchase(
        address account,
        address token,
        uint amount,
        uint rate
    );

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        rate;
        uint tokenAmount = msg.value * rate;

        // this = EthSwap's address
        require(token.balanceOf(address(this)) >= tokenAmount);
        
        token.transfer(msg.sender, tokenAmount);

        // event that tokens were purchased
        emit TokenPurchase(msg.sender, address(token), tokenAmount, rate);
    }
}