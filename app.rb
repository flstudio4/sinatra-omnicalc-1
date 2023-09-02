require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "<h1>hello</h1>"
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params.fetch("user_number").to_f
  erb(:square_root_result)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  percentage = @apr / 100.0
  periods = @years * 12.0
  rate_per_period = percentage / 12
  @payment = (@principal * rate_per_period) / (1 - ((1 + rate_per_period) ** -periods))
  erb(:payment_result)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  erb(:random_result)
end
