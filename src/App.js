import logo from './logo.svg';
import transparentUnicorn from "./transparentUnicorn.png";
import transparentBg from "./transparentBg.png";
import rainbowBorder from "./rainbowBorder.png";
import AppModel from "./models/App/AppModel.js";
import "./App.scss";
import './App.css';
import "./mediaQueries.scss";

const model = new AppModel();

function App() {
  return (
    <div className="App">
      <header className="app-mini-header">.</header>
      <div className="logo-container">
        <div className="logo-image"></div>
        <div className="logo-text">
          <h1 className='rainbow-text'>Olivia's Games</h1>
          <h2>magical games for Olivia (and other kids &amp; adults)</h2>
        </div>
      </div>
    </div>
  );
}

export default App;
