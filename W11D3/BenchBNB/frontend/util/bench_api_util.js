export const fetchBenches = (data) => (
    $.ajax({
        url: 'api/benches',
        data
    })
)

export const fetchBench = (id) => (
    $.ajax({
        url: `api/benches/${id}`
    })
)

export const createBench = benchform => (
    $.ajax({
        method: 'POST',
        url: 'api/benches',
        data: benchform
    })
)