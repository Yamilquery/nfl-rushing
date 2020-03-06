import React from 'react';
import logo from './thescore-logo.svg';
import './App.css';
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import FootballPlayerResults from './components/FootballPlayerResults';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      player_name: "",
      direction: "ASC",
      field: "Lng",
      limit: 20,
      offset: 0,
    };
  }

  componentDidMount() {
    fetch('http://localhost:4000/football_players?player_name=&direction=DESC&field=Lng')
    .then(res => res.json())
    .then((data) => {
      this.setState({ players: data })
    })
  }

  componentDidUpdate(prevProps, prevState) {
    if (
      (prevState.player_name != this.state.player_name) ||
      (prevState.direction != this.state.direction) ||
      (prevState.field != this.state.field)
    ) {
      fetch(`http://localhost:4000/football_players?player_name=${this.state.player_name}&direction=${this.state.direction}&field=${this.state.field}`)
      .then(res => res.json())
      .then((data) => {
        this.setState({ players: data })
      })
    }
  }

  toogleDirection(field) {
    if (this.state.field == field) {
      return this.state.direction == "ASC" ? "DESC" : "ASC";
    } else {
      return "DESC";
    }
  }

  sortingBy(field) {
    this.setState({
      direction: this.toogleDirection(field),
      field,
    });
  }

  downloadCsv() {
    window.location.href = `download-csv?player_name=${this.state.player_name}&direction=${this.state.direction}&field=${this.state.field}`;
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />

          <p>NFL Players' Rushing Statistics</p>
          
          <Container>
            <Row className="CardHeader__header">
              <Col xs={10}/>
              <Col xs={2}>
              <Button
                  variant="light"
                  onClick={(e) => this.downloadCsv()}
                >Download CSV</Button>
              </Col>
            </Row>
            <Row className="CardHeader__header">
              <Col xs={2}>
                <input
                  className="SearchPlayer"
                  placeholder="Player"
                  onChange={(e) => this.setState({ player_name: e.target.value })}
                />
              </Col>
              <Col>Team</Col>
              <Col>Pos</Col>
              <Col>Att/G</Col>
              <Col>Att</Col>
              <Col>
                <Button
                  variant="light"
                  onClick={(e) => this.sortingBy("Yds")}
                >Yds</Button>
              </Col>
              <Col>Avg</Col>
              <Col>Yds/G</Col>
              <Col>
                <Button
                  variant="light"
                  onClick={(e) => this.sortingBy("TD")}
                >TD</Button>
              </Col>
              <Col>
                <Button
                  variant="light"
                  onClick={(e) => this.sortingBy("Lng")}
                >Lng</Button>
              </Col>
              <Col>1st</Col>
              <Col>1st%</Col>
              <Col>20+</Col>
              <Col>40+</Col>
              <Col>FUM</Col>
            </Row>
            <FootballPlayerResults data={this.state.players || []} />
          </Container>

        </header>
      </div>
    );
  }
}

export default App;
