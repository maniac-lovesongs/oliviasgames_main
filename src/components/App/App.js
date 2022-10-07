import React, { useState, useRef, useEffect } from 'react';
import "./App.scss";
import inlineStyles from "./inlineStyles.js";
import helperFunctions from "./helperFunctions.js";

const App = (input) => {

    const [modelListenerId, setModelListenerId] = useState(null);
    useEffect(() => {
        const tempId = input.model.registerListener((propsChanged) => {
        });
        setModelListenerId(tempId);

        return function cleanup() {
            input.model.unregisterListener(modelListenerId);
            setModelListenerId(null);
        }
    }, []);
    

    return (
        <div className="app-container">
        </div>
    );
}

export default App;
/***************************************************************/
