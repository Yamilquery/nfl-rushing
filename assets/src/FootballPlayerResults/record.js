import React from 'react';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

const FootballPlayerRecord = ({ player }) => {
    return (<Row className="CardResults">
        <Col xs={2}>{player.player_name}</Col>
        <Col>{player.team_abbreviation}</Col>
        <Col>{player.player_position}</Col>
        <Col>{player.rushing_attemps_per_game_avg}</Col>
        <Col>{player.rushing_attemps}</Col>
        <Col>{player.total_rushing_yards}</Col>
        <Col>{player.rushing_average_yards_per_attempt}</Col>
        <Col>{player.rushing_yards_per_game}</Col>
        <Col>{player.total_rushing_touchdowns}</Col>
        <Col>{player.longest_rush}</Col>
        <Col>{player.rushing_first_downs}</Col>
        <Col>{player.rushing_first_down_percentage}</Col>
        <Col>{player.rushing_20_yards_each}</Col>
        <Col>{player.rushing_40_yards_each}</Col>
        <Col>{player.rushing_fumbles}</Col>
    </Row>)
};

export default FootballPlayerRecord;