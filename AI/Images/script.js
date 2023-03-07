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

let callOpenAiImage = async (prompt) => {
    const response = await openai.createImage({
      prompt: prompt,
      n: 1,
      size: "1024x1024",
    });
    image_url = response.data.data[0].url;
  
  
  
    return image_url;
  }

module.exports = callOpenAiImage;

