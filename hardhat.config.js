/** @type import('hardhat/config').HardhatUserConfig */
const fs = require('fs')
const mnemonic = fs
  .readFileSync('.secret')
  .toString()
  .trim()



module.exports = {
  solidity: "0.8.17",


  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '5777',
    },
    develop: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '5777',
    },
    dashboard: {},
    goerli: {
      provider: () => new HDWalletProvider(mnemonic, 'https://eth-goerli.g.alchemy.com/v2/ovgjkutqVzuZckq0GTW5IJbeNh5xnef5'),
      network_id: '5',       // Goerli's id
      confirmations: 2,    // # of confirmations to wait between deployments. (default: 0)
      timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
      skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    },
  },
};
