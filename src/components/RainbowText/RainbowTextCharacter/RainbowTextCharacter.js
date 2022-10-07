import React, { useState, useEffect } from 'react';
import "./RainbowTextCharacter.scss";
import inlineStyles from "./inlineStyles.js";
import helperFunctions from "./helperFunctions.js";

const RainbowTextCharacter = (input) => {

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
        <span className="rainbowtextcharacter-container"
            key={input.index}
            data-char={input.char}
            data-index={input.index}>
            {input.char}
        </span>
    );
}

export default RainbowTextCharacter;
/***************************************************************/
