require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

def dictionary 
raw_data = HTTP.get("https://api.exchangerate.host/symbols")

 parse_data = JSON.parse(raw_data)

 hop = parse_data.fetch("symbols").keys
 
end
get("/") do
 
  @var1 = dictionary

 
 erb(:Home)
end

get("/:currency") do
  
  @ans = params.fetch("currency")

  @var1 = dictionary 
 
  erb(:currency)
end 

get("/:currency/:input") do 
  @ans = params.fetch("currency")

  @answer = params.fetch("input")

 raw = HTTP.get("https://api.exchangerate.host/convert?from=#{@ans}&to=#{@answer}") 

 pro = JSON.parse(raw)

 @solution = pro.fetch("result")
  
  erb(:second)
end
