const names = ["Harry", "Ron", "Jeff", "Thomas"];

const newNamesWithExcMark = ["Harry", "Ron", "Jeff", "Thomas"].map(
  (e) => `${e}`
);
const students = [
  {
    name: "Harry",
    score: 60,
  },
  {
    name: "James",
    score: 88,
  },
  {
    name: "Ron",
    score: 90,
  },
  {
    name: "Bethy",
    score: 75,
  },
];

const arrayMap = (arr, action) => {
  const loopTrough = (arr, action, newArray = [], index = 0) => {
    const item = arr[index];
    if (!item) return newArray;
    return loopTrough(
      arr,
      action,
      [...newArray, action(arr[index])],
      index + 1
    );
  };

  return loopTrough(arr, action);
};

// ! Filter array
const namesArray2 = [1, "", "Hallo", 0, null, "Harry", 14];
const truthyArray = namesArray2.filter((item) => Boolean(item));

const eligibleForScholarshipStudents = students.filter(
  (student) => student.score > 85
);
console.log(...eligibleForScholarshipStudents);
// ! End filter

// ! Array Reduce
const totalScore = students.reduce((acc, student) => acc + student.score, 0);
console.log(totalScore);

// ! End Array Reduce

// ! Array Some
const array = [1, 2, 3, 4, 5];
const even = array.some((element) => element % 2 === 0);

console.log(even);
// ! End Array Some

// ! Array Find
const findJames = students.find((student) => student.name === "James");
console.log(findJames);
// ! End Array Find

// ! Array Sort
const months = ["March", "Jan", "Feb", "Dec"];
months.sort();
console.log(months);
// output: [ 'Dec', 'Feb', 'Jan', 'March' ]

const array1 = [1, 30, 4, 1000, 101, 121];
array1.sort();
console.log(array1);

const compareNumber = (a, b) => {
  return a - b;
};
const sorting = array1.sort(compareNumber);
console.log(sorting);

// ! End Array Sort

// ! Array Every

const scores = [70, 85, 90];
const minimumScore = 65;

const examPassed = scores.every((score) => score >= minimumScore);
console.log(examPassed);

// ! EndArray Every

// ! Array For Each

names.forEach((name) =>{
    console.log(`Hello, ${name}`);
})

// ! End Array For Each

const newNames = arrayMap(names, (name) => `${name}!`);

// console.log({
//   names,
//   newNamesWithExcMark,
//   truthyArray,
// });
// console.log({ names, newNamesWithExcMark });

const user = {
  firstname: "Harry",
  lastname: "Protter",
};

const renameLastNameUser = (newLastName, user) => {
  user.lastname = newLastName;
};

renameLastNameUser("Potter", user);

const createUserWithNewLastName = (newLastName, user) => {
  return { ...user, lastname: newLastName };
};

const newUser = createUserWithNewLastName("Potter", user);

// console.log(newUser);
// console.log(user);

const hitungLuasLingkaran = (jariJari) => {
  return 3.14 * (jariJari * jariJari);
};

const createPersonWithAge = (age, person) => {
  return { ...person, age };
};

const person = {
  name: "Bobo",
};

const newPerson = createPersonWithAge(18, person);

// console.log({
//   person,
//   newPerson,
// });

const countDown = (start) => {
  console.log(start);

  if (start > 0) countDown(start - 1);
};

// countDown(2);

const hello = () => {
  console.log("Hello!");
};

const say = (someFunction) => {
  someFunction();
};

const sayHello = () => {
  return () => {
    console.log("Hello!");
  };
};

// hello();
// say(hello);
// sayHello()();
