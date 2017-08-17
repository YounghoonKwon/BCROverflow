get '/' do
  erb :index
end

get '/users' do
  redirect '/'
end

get '/users/:id' do
  erb :'users/profile'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  redirect '/users/:id'
end

get '/users/login' do
  erb :'users/login'
end


