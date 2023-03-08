const axios = require('axios');
const dotenv = require('dotenv');
const path = require('path');
dotenv.config({
    path: path.resolve(__dirname,'.env')
});
const apiKey = process.env.apiKey;
const model = 'text-davinci-edit-001';

const entries = [
  { input: 'What day of the wek is it?', instruction: 'Fix the spelling mistakes' },
  { input: 'I want to be a billonaire', instruction: 'Correct the grammar' },
  { input: 'To be or not to be, that is the question', instruction: 'Rewrite in modern language' }
];

entries.forEach(entry => {
  const data = JSON.stringify({
    model: model,
    input: entry.input,
    instruction: entry.instruction
  });

  const config = {
    method: 'post',
    url: 'https://api.openai.com/v1/edits',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + apiKey
    },
    data: data
  };

  axios(config)
    .then(function (response) {
      console.log(`Input: ${entry.input}\nInstruction: ${entry.instruction}\nOutput: ${response.data.choices[0].text}\n`);
    })
    .catch(function (error) {
      console.log(error);
    });
});
