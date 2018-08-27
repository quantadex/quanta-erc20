pragma solidity ^0.4.18;

import './zeppelin/token/PausableToken.sol';

contract QuantaToken is PausableToken {
    string  public  constant name = "QUANTA";
    string  public  constant symbol = "QDEX";
    uint8   public  constant decimals = 9;
    uint256 public INITIAL_SUPPLY = 400000000 * (10 ** uint256(decimals));

    function QuantaToken() 
    {
        admin = owner;
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(address(0x0), msg.sender, INITIAL_SUPPLY);
    }

    event AdminTransferred(address indexed previousAdmin, address indexed newAdmin);

    function changeAdmin(address newAdmin) onlyOwner {
        // owner can re-assign the admin
        AdminTransferred(admin, newAdmin);
        admin = newAdmin;
    }
}
