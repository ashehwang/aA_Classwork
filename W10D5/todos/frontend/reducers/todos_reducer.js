import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach( todo => {
                nextState[todo.id] = todo;
            }) //taking in an array
            return nextState;
        case RECEIVE_TODO: //takes one object of todo
            nextState[action.todo.id] = action.todo;
            return nextState;
        default:
            return state;
    }
};

export default todosReducer;

const newObj = {
    id: 3,
    title: "wear button up shirt",
    body: "nag Carlos",
    done: false
}