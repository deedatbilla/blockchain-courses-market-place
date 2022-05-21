import React from "react";
import { Provider} from "./context/context";
function App() {
  // const {
  //   web3Config: { accounts, contract },
  // } = useAppContext();

  // const runExample = async () => {
  //   // Stores a given value, 5 by default.
  //   await contract.methods.set(5).send({ from: accounts[0] });

  //   // Get the value from the contract to prove it worked.
  //   const response = await contract.methods.get().call();
  // };
  return (
    <Provider>
      <div className="App">
        <h1>Good to Go!</h1>
        <p>Your Truffle Box is installed and ready.</p>
        <h2>Smart Contract Example</h2>
        <p>
          If your contracts compiled and migrated successfully, below will show
          a stored value of 5 (by default).
        </p>
        <p>
          Try changing the value stored on <strong>line 42</strong> of App.js.
        </p>
        {/* <div>The stored value is: {this.state.storageValue}</div> */}
      </div>
    </Provider>
  );
}

export default App;
