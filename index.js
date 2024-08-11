import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import env from "dotenv";

env.config();
const app = express();
const port = process.env.BACKEND_PORT;


const db = new pg.Client({
  user: process.env.DATABASE_USER,
  host: process.env.DATABASE_SERVER,
  database: process.env.DATABASE,
  password: process.env.DATABASE_PASSWORD,
  port: process.env.DATABASE_PORT,
});


db.connect();

let quiz = [];
let currentIndex = 0;
let progress = 0;
let totalCorrect = 0;
// let quiz = [
//   { englishText: "hello", igboText: "kedu", "igbo_sound": "xxx.mp3", "image": "xxx.png" },
//   { englishText: "sibling", igboText: "nwanne", "igbo_sound": "xxx.mp3", "image": "xxx.png" },
//   { englishText: "cousin", igboText: "ibenne", "igbo_sound": "xxx.mp3", "image": "xxx.png" },
//   { englishText: "thank you", igboText: "daalụ", "igbo_sound": "xxx.mp3", "image": "xxx.png" },
// ];

async function getData() {

  db.query("SELECT * FROM questions ORDER BY RANDOM() LIMIT 10 ", (err, res) => {
    if (err) {
      console.error("Error executing query", err.stack);
    } else {
      quiz = res.rows;
      // console.log(quiz);
    }
    db.end();
  });
}
getData();




// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let currentQuestion = {};

// GET home page
app.get("/", async (req, res) => {
  res.render("home.ejs");
});

// GET nextQuestion
app.get("/next", async (req, res) => {
  if (currentIndex >= quiz.length) {
    res.render("restart.ejs", {
      progress: (currentIndex/quiz.length)*100 + "%",
      totalScore: (totalCorrect/quiz.length)*100 + "%",
    });
    await getData();
    totalCorrect = 0;
    currentIndex = 0;
  } else {
    await nextQuestion();
    res.render("index.ejs", {
      question: currentQuestion,
      progress: (currentIndex/quiz.length)*100 + "%",
      // totalScore: (totalCorrect/quiz.length)*100 + "%"
    });
  }
});

// POST answer to question
app.post("/submit", (req, res) => {

  let answer = req.body.answer.trim();
  let isCorrect = false;
  if (currentQuestion.englishtext.toLowerCase() === answer.toLowerCase()) {
    totalCorrect++;
    isCorrect = true;
  }

  res.render("result.ejs", {
    question: currentQuestion,
    answer: answer,
    progress: (currentIndex/quiz.length)*100 + "%",
    wasCorrect: isCorrect,
  });
});

async function nextQuestion() {
  const randomWord = quiz[Math.floor(Math.random() * quiz.length)];

  currentQuestion = randomWord;
  currentIndex+= 1;
}

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
