import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.reset = this.reset.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : ""
    this.setState({ num1 })
  };

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : ""
    this.setState({ num2 })
  };

  reset(e) {
    e.preventDefault();
    this.setState({ result: 0, num1: "", num2: "" })
  }

  add(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2})
  }

  subtract(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 - this.state.num2})
  }

  multiply(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2})
  }

  divide(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2})
  }
  render() {
    const { result, num1, num2 } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setNum1} value={num1}></input>
        <input type="text" onChange={this.setNum2} value={num2}></input>
        <button onClick={this.reset}>Clear</button>
        <br/>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
