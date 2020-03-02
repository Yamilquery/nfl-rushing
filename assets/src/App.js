import React from 'react';
import logo from './thescore-logo.svg';
import './App.css';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

function App() {
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
          <Row className="CardResults">
            <Col xs={2}>Joe Banyard</Col>
            <Col>JAX</Col>
            <Col>RB</Col>
            <Col>2</Col>
            <Col>2</Col>
            <Col>7</Col>
            <Col>3.5</Col>
            <Col>7</Col>
            <Col>0</Col>
            <Col>0</Col>
            <Col>0</Col>
            <Col>0</Col>
            <Col>0</Col>
            <Col>0</Col>
            <Col>0</Col>
          </Row>
        </Container>

      </header>
    </div>
  );
}

export default App;
