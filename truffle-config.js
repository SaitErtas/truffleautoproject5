const HDWalletProvider = require('@truffle/hdwallet-provider')

const fs = require('fs')
const mnemonic = fs
  .readFileSync('.secret')
  .toString()
  .trim()

module.exports = {
  networks: {
    developmentOld: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*',
    },
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*',
    },
    dashboard: { port: 24012 },
    goerli: {
      provider: () => new HDWalletProvider(mnemonic, 'https://eth-goerli.g.alchemy.com/v2/ovgjkutqVzuZckq0GTW5IJbeNh5xnef5'),
      network_id: '5', // Goerli's id
      confirmations: 2, // # of confirmations to wait between deployments. (default: 0)
      timeoutBlocks: 200, // # of blocks before a deployment times out  (minimum/default: 50)
      skipDryRun: true, // Skip dry run before migrations? (default: false for public nets )
    },
  },
  compilers: {
    solc: {
      version: '0.8.13',
      docker: false,
    },
  },
  db: {
    enabled: false,
    host: '127.0.0.1',
  },
  api_keys: {
    goerlietherscan: 'ovgjkutqVzuZckq0GTW5IJbeNh5xnef5',
  },
  plugins: ['truffle-plugin-verify'],
}
