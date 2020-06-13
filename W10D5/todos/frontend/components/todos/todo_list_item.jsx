import React from 'react';

const TodoListItem = (props) => {

    return (
        <div key={props.todo.id}>
            <li>{props.todo.title}</li>
        </div>
    )
}

export default TodoListItem;