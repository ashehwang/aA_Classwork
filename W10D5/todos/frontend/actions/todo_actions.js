export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

//action creators

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos
    }
}

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo
    }
}

// export { receiveTodos, receiveTodo };