import React from 'react';

class SessionForm extends React.Component {
    constructor(props){
        super(props);
        this.state = { username: '', password: ''};
        this.handleSubmit = this.handleSubmit.bind(this);
        this.updatePassword = this.updatePassword.bind(this);
        this.updateUsername = this.updateUsername.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

    updatePassword(e) {
        this.setState({ password: e.currentTarget.value })
    }
    
    updateUsername(e) {
        this.setState({ username: e.currentTarget.value })
    }

    renderErrors(){
        return(
            <ul>
                {this.props.errors.map( (err,i) => (
                    <li key={i}>
                        {error}
                    </li>
                ))}
            </ul>
        )
    }

    render(){
        return (
          <div>
              {this.renderErrors()}
              <h4>Welcome to Ashe's BenchBnB!</h4>
              <br/>
              Please {this.props.formType} or {this.props.navLink}
              <form action="" onSubmit={this.handleSubmit}>
                  <label> Username: 
                    <input 
                        type="text"
                        value={this.state.username}
                        onChange={this.updateUsername}
                    />
                  </label>
                    <label> Password:
                    <input
                            type="password"
                            value={this.state.password}
                            onChange={this.updatePassword}
                        />
                    </label>
                    <input type="submit" value={this.props.formType}/>
              </form>
          </div>  
        )
    }
}

export default SessionForm;