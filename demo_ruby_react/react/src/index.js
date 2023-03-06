import React from "react";
import ReactDOM from "react-dom";
import CC from "./article";

function App() {
  return (
    <div>
      <CC></CC>
    </div>
  );
}

const rootElement = document.getElementById("root");
ReactDOM.render(<App />, rootElement);
