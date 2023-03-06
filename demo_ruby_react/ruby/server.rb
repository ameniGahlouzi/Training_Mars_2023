require 'sinatra'

articles = [{id:1,name:"Article 1"}, {id:2,name:"Article 2"}, {id:3,name:"Article 3"}]

get '/' do
  content_type :json
  articles.to_json
end

set :bind, '0.0.0.0'
set :port, 8080
