const HelloBlockchain = artifacts.require("HelloBlockchain");
const DoubleMyContract = artifacts.require("DoubleMyContract");

module.exports = function (deployer) {
  deployer.deploy(HelloBlockchain, "Hello Blockchain");
  deployer.deploy(DoubleMyContract, "Double My Contract");
};