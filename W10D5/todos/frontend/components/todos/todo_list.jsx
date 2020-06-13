import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

const todoList = (props) => {
    return (
        <>
            <ul>
                {props.todos.map((todo, idx) => (
                    <TodoListItem key={`todo-list-item-${idx}`} todo={todo}/>
                ))}
            </ul>
            <TodoForm receiveTodo={ props.receiveTodo }/>
        </>
    )
}



export default todoList;
// const MyComponent = ({ firstName, initials, handleAdd, handleDelete }) => {
//     return <div>...</div>;
// };

// export default () => <h3>Todo List goes here!</h3>