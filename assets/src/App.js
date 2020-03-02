import React from 'react';
import logo from './thescore-logo.svg';
import './App.css';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import gql from 'graphql-tag';
import { Query } from 'react-apollo';
import FootballPlayerResults from './FootballPlayerResults';

const GET_FOOTBALL_PLAYERS = gql`
  query(
    $playerName: String!,
    $direction: String,
    $field: String,
    $limit: Int,
    $offset: Int
  ) {
    football_players(
      playerName: $playerName,
      orderBy: {direction: $direction, field: $field},
      limit: $limit
      offset: $offset
    ) {
      player_name,
      team_abbreviation,
      player_position,
      rushing_attemps_per_game_avg,
      rushing_attemps,
      total_rushing_yards,
      rushing_average_yards_per_attempt,
      rushing_yards_per_game,
      total_rushing_touchdowns,
      longest_rush,
      rushing_first_downs,
      rushing_first_down_percentage,
      rushing_20_yards_each,
      rushing_40_yards_each,
      rushing_fumbles
    }
  }
`;

const App = () => (
  <Query
    query={GET_FOOTBALL_PLAYERS}
    variables={{
      playerName: "a",
      direction: "ASC",
      field: "TOTAL_RUSHING_YARDS",
      limit: 10,
      offset: 0,
    }}
    notifyOnNetworkStatusChange={true}
  >
    {({ data, loading, error, fetchMore }) => {
      if (error) {
        return <p>Error</p>;
      }

      if (!data == true) {
        return (
          <div className="App">
            <header className="App-header">
              <img src={logo} className="App-logo" alt="logo" />

              <p>Loading...</p>
            </header>
          </div>
        );
      }

      return (
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />

            <p>NFL Players' Rushing Statistics</p>
            
            <Container>
              <Row className="CardHeader__header">
                <Col xs={2}>Player</Col>
                <Col>Team</Col>
                <Col>Pos</Col>
                <Col>Att/G</Col>
                <Col>Att</Col>
                <Col>Yds</Col>
                <Col>Avg</Col>
                <Col>Yds/G</Col>
                <Col>TD</Col>
                <Col>Lng</Col>
                <Col>1st</Col>
                <Col>1st%</Col>
                <Col>20+</Col>
                <Col>40+</Col>
                <Col>FUM</Col>
              </Row>
              <FootballPlayerResults data={data.football_players} />
            </Container>

          </header>
        </div>
      );
    }}
  </Query>
)

export default App;
