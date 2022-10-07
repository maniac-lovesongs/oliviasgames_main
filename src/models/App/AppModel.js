/**************************************************************/
class AppModel {
    constructor() {
        this.listeners = [];
    }
    /***************************************************************/
    unregisterListener(id) {
        if (id >= 0 && id < this.listeners.length) {
            this.listeners[id] = null;
        }
    }
    /***************************************************************/
    registerListener(func) {
        this.listeners.push(func);
        return this.listeners.length - 1;
    }
    /***************************************************************/
    notifyListeners(propsChanged) {
        for (let i = 0; i < this.listeners.length; i++) {
            const listener = this.listeners[i];
            if (listener !== null && listener !== undefined) {
                listener(propsChanged);
            }
        }
    }
}

export default AppModel; 
