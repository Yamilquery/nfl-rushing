import React from 'react';
import FootballPlayerRecord from './Record';

const renderTableData = (data) => {
    return data.map(player => <FootballPlayerRecord player={player} />);
}

const FootballPlayerResults = ({ data }) => {
    return <div className="CardBodyResults">{renderTableData(data)}</div>;
};

export default FootballPlayerResults;