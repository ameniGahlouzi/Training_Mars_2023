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
    const completion = await openai.createChatCompletion({
    model: "gpt-3.5-turbo",
    messages: [{role: "user", content: prompt}],
    });
    return completion.data.choices[0].message.content;
}

module.exports = callOpenAi;

