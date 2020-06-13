export const allTodos = (state) => {
    let newTodos = []
    Object.keys(state.todos).forEach((id) => newTodos.push(state.todos[id]));
    return newTodos;
};

// this is todos
// {
//     1: {
//         id: 1,
//         title: "wash car",
//         body: "with soap",
//         done: false
//     },
//     2: {
//         id: 2,
//         title: "wash dog",
//         body: "with shampoo",
//         done: true
//     }
// };