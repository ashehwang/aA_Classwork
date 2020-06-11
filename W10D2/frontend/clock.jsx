import React from 'react';

export default class Clock extends React.Component {

    constructor() {
        super();
        this.state = {
            time: new Date()
        };
        setInterval(this.tick.bind(this), 1000);
    }

    tick () {
        this.setState({time: new Date()})
    }

    // componentDidMount() {
    //     this.handle = setInterval(this.tick.bind(this), 1000);
    // }

    // componentWillUnmount() {
    //     clearInterval(this.handle)
    // }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();

        if (seconds < 10) {
            seconds = `0${seconds}`
        }
        if (minutes < 10) {
            minutes = `0${minutes}`;
        }
        if (hours < 10) {
          hours = `0${hours}`;
        }

        return (
            <>
                <h1 className="h1">Clock</h1>
                <div className='clock'>
                    <p>
                    Current Time: {hours}:{minutes}:{seconds} PST
                    </p>
                    <br/>
                    <p>
                        Today's Date: {this.state.time.toDateString()}
                    </p>
                </div>
            </>
        );
    }

}