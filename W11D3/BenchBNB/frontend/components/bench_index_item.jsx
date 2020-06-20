import React from 'react';

const BenchIndexItem = ({ bench }) => (
    <ul> Bench ID: {bench.id}
        <li>Description: {bench.description}</li>
        <li>Location: {bench.lat}, {bench.lng}</li>
    </ul>
)

export default BenchIndexItem;