const callOpenAi = require("./script");
const readline = require('readline');
const array = require("./completion.json")
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  

  function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  const createCompletion = async (element) => {
         let prompt = element.prompt;
         if (prompt === 'stop') {
            rl.close();
            return;
          }
          const response = await callOpenAi(prompt);
          console.log(response);  
  };
  
  const createCompletions = async () => {
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        await createCompletion(element);
        await sleep(30000)
    }
  }
  
  createCompletions()
  
  