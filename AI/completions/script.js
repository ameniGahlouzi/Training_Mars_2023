const { Configuration, OpenAIApi } = require("openai");
const dotenv = require('dotenv');
const path = require('path');

dotenv.config({
    path: path.resolve(__dirname,'.env')
});
const configuration = new Configuration({
    apiKey: process.env.apiKey,
});
const openai = new OpenAIApi(configuration);

let callOpenAi = async (prompt) => {
    const response = await openai.createCompletion({
        model: "text-davinci-003",
        prompt: JSON.stringify(prompt),
        temperature: 0,
        max_tokens: 4097 - prompt.length,
        top_p: 1,
        frequency_penalty: 0,
        presence_penalty: 0,
        best_of: 1
      })
      .catch(error=>{
          console.log("error")
      });

      

      return response.data.choices[0].text;
}

module.exports = callOpenAi;

