import { htmlGenerator } from "./warmup";

class Clock {
    constructor() {
        const currentTime = new Date();

        this.hours = currentTime.getHours();
        this.minutes = currentTime.getMinutes();
        this.seconds = currentTime.getSeconds();

        htmlGenerator(this.printTime(), clockElement);
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        const timeString = `${this.hours}:${this.minutes}:${this.seconds}`
        return timeString;
    }

    _tick() {
        this._addSeconds();
        htmlGenerator(clock.printTime(), clockElement);
    }

    _addSeconds() {
        this.seconds += 1;
        if (this.seconds === 60) {
            this.seconds = 0;
            this._addMinutes();
        }
    }

    _addMinutes() {
        this.minutes += 1;
        if (this.minutes === 60) {
            this.minutes = 0;
            this._addHours();
        }
    }

    _addHours() {
        this.hours = (this.hours + 1) % 24;
    }

}

const clockElement = document.getElementById('clock');
const clock = new Clock();