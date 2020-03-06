import React from 'react';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

const FootballPlayerRecord = ({ player }) => {
    return (<Row className="CardResults">
        <Col xs={2}>{player["Player"]}</Col>
        <Col>{player["Team"]}</Col>
        <Col>{player["Pos"]}</Col>
        <Col>{player["Att/G"]}</Col>
        <Col>{player["Att"]}</Col>
        <Col>{player["Yds"]}</Col>
        <Col>{player["Avg"]}</Col>
        <Col>{player["Yds/G"]}</Col>
        <Col>{player["TD"]}</Col>
        <Col>{player["Lng"]}</Col>
        <Col>{player["1st"]}</Col>
        <Col>{player["1st%"]}</Col>
        <Col>{player["20+"]}</Col>
        <Col>{player["40+"]}</Col>
        <Col>{player["FUM"]}</Col>
    </Row>)
};

export default FootballPlayerRecord;