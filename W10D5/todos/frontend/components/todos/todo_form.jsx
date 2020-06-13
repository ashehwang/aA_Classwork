import React from 'react';
// import {uniqueId} from '../../util/util'

class TodoForm extends React.Component {
    constructor(props) { //props.receiveTodo => factory method that makes action
        super(props); // has access to store 
        this.state = {
            title: "", 
            body: "",
            done: false
        }; //default state
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    updateTitle(event){
        this.setState({ title: event.target.value})
    }

    updateBody(event){
        this.setState({ body: event.target.value})
    }
    
    handleSubmit(e){
        debugger;
        e.preventDefault();
        const todo = {title: this.state.title,
            body: this.state.body,
            id: new Date().getTime(),
            done: false};
        this.props.receiveTodo(todo); //automatically dispatched
        this.setState({
            title: "",
            body: ""
        })
    }

    render() {
        return(
            <form className="todo-form" onSubmit={ this.handleSubmit }>
                <label for="todo-title"> Title: </label>
                <input type="text" id="todo-title" value={ this.state.title } onChange={ this.updateTitle } />
                <label for="todo-body"> Todo Body: </label>
                <textarea id="todo-body" cols="30" rows="10" value={ this.state.body } onChange={ this.updateBody }></textarea>
                <input type="submit" value="Create Todo"/>
            </form>
        );
    };
}

export default TodoForm;