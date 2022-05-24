import React, { createContext, useState, useContext, useEffect } from "react";
import getWeb3 from "../getWeb3";
import SimpleStorageContract from "../contracts/SimpleStorage.json";
const Context = createContext({
  web3Config: {},
});

const Provider = ({ children }) => {
  const [web3Config, setWeb3Config] = useState({
    web3: null,
    accounts: null,
    contract: null,
  });
//   const setWeb3ConfigState = (state) => {
//     setWeb3Config(state);
//   };

  const initializeeWeb3 = async () => {
    try {
      // Get network provider and web3 instance.
      const web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      const accounts = await web3.eth.getAccounts();

      // Get the contract instance.
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = SimpleStorageContract.networks[networkId];
      const instance = new web3.eth.Contract(
        SimpleStorageContract.abi,
        deployedNetwork && deployedNetwork.address
      );

      // Set web3, accounts, and contract to the state, and then proceed with an
      // example of interacting with the contract's methods.
      setWeb3Config({ web3, accounts, contract: instance });
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`
      );
      console.error(error);
    }
  };
  
  useEffect(() => {
    initializeeWeb3()
  }, [])
  

  const state = {
    web3Config,
  };
  return <Context.Provider value={state}>{children}</Context.Provider>;
};

const useAppContext = () => useContext(Context);

export { Provider, useAppContext };
