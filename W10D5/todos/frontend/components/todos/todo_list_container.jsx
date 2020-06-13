import { connect } from "react-redux";
import TodoList from "./todo_list";
import { receiveTodo, receiveTodos } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = (state) => ({
    todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({
    receiveTodo: banana => dispatch(receiveTodo(banana))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(TodoList); //creates a girnormouts props for TodoList



