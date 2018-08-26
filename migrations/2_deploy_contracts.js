var Token = artifacts.require("./QuantaToken.sol");

var tokenContract;

module.exports = function(deployer) {
    return Token.new().then(function(result) {
        tokenContract = result;
    });
};
