import React from 'react';
import TodoListContainer from "./todos/todo_list_container"
//Why does this exist
const App = () => {
    return (
    <div>
        <h1>Gil and Ashe's Todo App</h1>
        <TodoListContainer />
    </div>
    )
};

export default App;