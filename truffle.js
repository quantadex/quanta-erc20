/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

var LedgerWalletProvider = require("truffle-ledger-provider");
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "foil wisdom culture upon response early volcano rhythm enable glimpse kite alone";

var infura_apikey = 'f884e325628b4c58aaa49de658a5a753';

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id,
      gas: 1000000
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/" + infura_apikey),
      network_id: 3,
      gas: 4600000
    },
    live: {
      host: "localhost",
      port: 8546,
      network_id: 1 // Ethereum public network
    }
  }
};
