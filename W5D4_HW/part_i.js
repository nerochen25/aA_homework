function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping1();


function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping2();

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3(); //throw an error since x is declared for a const var in a outter scope

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping4();

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// mysteryScoping5(); //same name w/ same type in sampe scope cannot be declared

// function madLib(str1, str2, str3) {
//   console.log('we shall ' + str1. + ' the ' + str2 + ' ' + str3 + '.');
// }

// madLib('make', 'best', 'guac');

let madLib =function(verb, adjective, noun) {
  console.log('we shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase()+ '.');
}


// madLib('make', 'best', 'guac');


function isSubstring(searchString, subString) {
  var arr = searchString.split(' ')
  if (arr.includes(subString)) {
    console.log(true);
  } else {
    console.log(false);
  }
}

// isSubstring("time to program", "nero");


function fizzBuzz(arr) {
  var new_arr = [];
  for (var i = 0; i < arr.length; i++) {
    if ((arr[i]%3 === 0 || arr[i]%5 === 0) && arr[i]%15 !== 0) {
      new_arr.push(arr[i]);
    }
  }
  return new_arr;
}

// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,15,90]));


function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes (n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
}
