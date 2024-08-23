const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");


module.exports = buildModule("LockModule", (m) => {
  const Bank = m.contract("Bank");

  return { Bank };
});
