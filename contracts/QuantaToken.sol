pragma solidity ^0.4.18;

import './zeppelin/token/PausableToken.sol';

contract QuantaToken is PausableToken {
    string  public  constant name = "QUANTA";
    string  public  constant symbol = "QDEX";
    uint8   public  constant decimals = 9;
    uint256 public INITIAL_SUPPLY = 400000000 * (10 ** uint256(decimals));

    modifier validDestination( address to )
    {
        require(to != address(0x0));
        require(to != address(this));
        _;
    }

    function QuantaToken() 
    {
        admin = owner;
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(address(0x0), msg.sender, INITIAL_SUPPLY);
    }

    function transfer(address _to, uint _value) validDestination(_to) returns (bool) 
    {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint _value) validDestination(_to) returns (bool) 
    {
        return super.transferFrom(_from, _to, _value);
    }

    event AdminTransferred(address indexed previousAdmin, address indexed newAdmin);

    function changeAdmin(address newAdmin) onlyOwner {
        // owner can re-assign the admin
        AdminTransferred(admin, newAdmin);
        admin = newAdmin;
    }
}
