var Token = artifacts.require("./QuantaToken.sol");

var tokenContract;

module.exports = function(deployer) {
    deployer.deploy(Token);
};
