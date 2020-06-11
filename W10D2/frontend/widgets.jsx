import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const items = [
  { title: "one", content: "I am the first" },
  { title: "two", content: "Second pane here" },
  { title: "three", content: "Third pane here" },
];


function Root() {
    return(
        <div>
            <Clock />
            <Tabs items={items}/>
        </div>
    );
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<Root />, document.getElementById("gabor"));
});