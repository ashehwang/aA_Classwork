import BenchIndex from './bench_index';
import { connect } from 'react-redux';
import { fetchBenches } from '../actions/bench_action';

const mSTP = (state) => ({
    benches: Object.values(state.entities.benches)
});


const mDTP = (dispatch) => ({
    fetchBenches: () => dispatch(fetchBenches())
});

export default connect(mSTP, mDTP)(BenchIndex);