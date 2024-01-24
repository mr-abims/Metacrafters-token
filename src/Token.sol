// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public owner;
    constructor() ERC20("Abims", "Bims") {
        
        owner = msg.sender;
    }
        
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    // Function to mint tokens. Only the owner can call this function.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
     function balanceOf(address user) public override view returns (uint256) {
       return super.balanceOf(user);
    }

    function transfer(address receiver, uint256 amount) public override returns (bool) {
        return super.transfer(receiver, amount);
    }

// Function to burn tokens. Any user can burn their own tokens.
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }


}
