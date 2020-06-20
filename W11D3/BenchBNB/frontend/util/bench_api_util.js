export const fetchBenches = () => (
    $.ajax({
        url: 'api/benches',
        method: 'GET',
        error: err => console.log(err)
    })
);

export const fetchBench = (id) => (
    $.ajax({
        url: `api/benches/${id}`
    })
);

export const createBench = benchform => (
    $.ajax({
        method: 'POST',
        url: 'api/benches',
        data: benchform
    })
);