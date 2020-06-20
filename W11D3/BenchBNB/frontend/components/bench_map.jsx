import React from 'react';
import { withRouter } from 'react-router-dom';

class BenchMap extends React.Component {
    constructor(){
        super();
    }

    render(){
        return(
            <div id="map-container" ref="map">
                hello
            </div>
        )
    }
}

export default withRouter(BenchMap);