//const HelloBlockchain = artifacts.require("HelloBlockchain");
// const DoubleMyContract = artifacts.require("DoubleMyContract");
const SampleContract = artifacts.require("SampleContract");
//const CposContract = artifacts.require("CposContract");
//const ContractB = artifacts.require("ContractB");

module.exports = function (deployer) {
  //deployer.deploy(HelloBlockchain, "Hello Blockchain");
  // deployer.deploy(DoubleMyContract, "Double My Contract");
  deployer.deploy(SampleContract);
  //deployer.deploy(CposContract);
  //deployer.deploy(ContractB, "ContractB");
};