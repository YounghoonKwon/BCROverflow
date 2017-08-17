get '/answers/:id' do
  erb :'answers/index'
end

post '/answers' do
  redirect '/answers/:id'
end

