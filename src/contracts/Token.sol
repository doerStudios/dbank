// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  //  add minter variable
  address public minter;

  //add minter changed event
  event MinterChanged(address indexed from, address to);

  constructor() public payable ERC20("Brick Coin", "BRK") {
    //  asign initial minter
    minter = msg.sender;
  }

  //Add pass minter role function

  function mint(address account, uint256 amount) public {
    //  check if msg.sender have minter role
    require(msg.sender == minter, 'Error, msg.sender does not have minter role');
		_mint(account, amount);
	}
}