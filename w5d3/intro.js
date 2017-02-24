"use strict";
// Part 1:
  // Phase 1:

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring(searchString, substring) {
  if (searchString.includes(substring)) {
    return true;
  } else {
    return false;
  }
}

  // Phase 2:
function fizzBuzz(array) {
  const result = [];
  for (let i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0 || array[i] % 5 === 0) && (array[i] % 15 !== 0)) {
      result.push(array[i]);
    }
  }
  return result;
}

function isPrime(number) {
  if ( number < 2) { return false; }
  for (let i = 2; i < number; i++) {
    if ( number % i === 0) { return false; }
  }
  return true;
}

function sumOfPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
}

// Part 2:
  // Phase 1:
function titleize(array, callback) {
  let titles = array.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  callback(titles);
}

function printCallback(array) {
  array.forEach( el => console.log(el) );
}

  // Phase 2:
function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes "phrRRRRRRRRRRR!!!!!!!"`);
};

Elephant.prototype.grow = function () {
  return this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  console.log(`${this.name} is ${this.tricks[Math.floor(Math.random()*this.tricks.length)]}!`)
};

  // Phase 3:
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`)
};

herd.forEach(Elephant.paradeHelper);

  // Phase 4:
function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}
