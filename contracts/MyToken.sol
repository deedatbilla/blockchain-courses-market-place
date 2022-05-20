pragma solidity ^0.4.18;

contract MyToken {
  uint256 INITIAL_SUPPLY = 100;
  mapping(address => uint256) balances;

  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  function MyToken() public {
    balances[tx.origin] = INITIAL_SUPPLY;
  }
  function sendToken(address _to, uint256 _amount) public returns (bool success) {
    if (balances[msg.sender] < _amount) return false;
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
    Transfer(msg.sender, _to, _amount);
    return true;
  }
  function balanceOf(address _owner) public returns (uint256 balance) {
    return balances[_owner];
  }
}
