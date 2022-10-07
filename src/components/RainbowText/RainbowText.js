import React, { useState, useRef, useEffect } from 'react';
import RainbowTextCharacter from "./RainbowTextCharacter/RainbowTextCharacter.js";
import "./RainbowText.scss";
import inlineStyles from "./inlineStyles.js";
import helperFunctions from "./helperFunctions.js";

const RainbowText = (input) => {
    const [modelListenerId, setModelListenerId] = useState(null);
    const [totalChars, setTotalChars] = useState(0);
    useEffect(() => {
        const tempId = input.model.registerListener((propsChanged) => {
        });
        setModelListenerId(tempId);

        return function cleanup() {
            input.model.unregisterListener(modelListenerId);
            setModelListenerId(null);
        }
    }, []);

    const makeCharacters = () => {
        let numChars = 0; 
        const textArray = input.text.split("");
        for (let i = 0; i < textArray.length; i++) {
            if (textArray[i] !== " ")
                numChars += 1;
        }
        
        const chars = textArray.map((ch, index) => {
            return <RainbowTextCharacter 
                key={index}
                model={input.model}
                char={ch}
                index={index}
            />
        });
        return chars; 
    }
    

    return (
        <div className="rainbowtext-container">
            {makeCharacters()}
        </div>
    );
}

export default RainbowText;
/***************************************************************/
