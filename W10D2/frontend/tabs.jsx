import React from 'react';

export default class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            currentTab: 0
        };
    }

    tabSelector(num) {
        this.setState({currentTab: num})
    }

    render() {
        return (
        <>
              <h1 className="tab-h1">Tabs</h1>
          <div className="tabs">
            <header className="tabs-header">
              <ul>
                {this.props.items.map((el, idx) => (
                  <li className ="tabs-list" key={ idx } onClick={() => this.tabSelector(idx)}>
                      { el.title }
                  </li>
                ))}
              </ul>
            </header>
            <main className="tabs-content">
                {this.props.items[this.state.currentTab].content}
            </main>
          </div>
        </>
        );
    }
}