require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
 raw_data = HTTP.get("https://api.exchangerate.host/symbols")

 @parse_data = JSON.parse(raw_data)

 @hop = @parse_data.fetch("symbols").keys
 erb(:new)
end

get("/:currency") do 
@new_var = params.fetch("currency")
  erb(:currency)
end 
