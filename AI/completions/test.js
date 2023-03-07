const callOpenAi = require("./script");
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  const askQuestion = async () => {
    rl.question('What do you want to ask OpenAI? (Type "stop" to exit) ', async (prompt) => {
      if (prompt === 'stop') {
        rl.close();
        return;
      }
  
      const response = await callOpenAi(prompt);
      console.log(response);
  
      askQuestion(); // recursively ask the question again
    });
  };
  
  askQuestion(); // start the first question prompt
 
  
  
  
  