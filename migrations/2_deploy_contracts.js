var CourseManagement = artifacts.require("./CourseManagement.sol");

module.exports = function (deployer) {
  deployer.deploy(CourseManagement);
};
