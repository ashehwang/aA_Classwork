import * as APIUtil from '../util/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";

export const receiveBenches = benches => ({
    type: RECEIVE_BENCHES,
    benches
});

export const receiveBench = bench => ({
    
})