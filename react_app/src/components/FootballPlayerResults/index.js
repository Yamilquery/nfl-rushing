import React from 'react';
import FootballPlayerRecord from './record';

const renderTableData = (data) => {
    return data.map((player, index) =>
        <FootballPlayerRecord key={index} player={player} />
    );
}

const FootballPlayerResults = ({ data }) => {
    return <div className="CardBodyResults">{renderTableData(data)}</div>;
};

export default FootballPlayerResults;