import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MicjohnModule = buildModule("MicjohnModule", (m) => {

    const todoList = m.contract("Todo");

    return { todoList};
});

export default MicjohnModule;