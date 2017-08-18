get '/' do
  erb :index
end

get '/users' do
  redirect '/'
end

get '/users/login' do
  erb :'users/login'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  erb :'users/profile'
end

post '/users' do
  user_info = params[:user]
  user = User.new(first_name: user_info[:first_name], last_name: user_info[:last_name],  username: user_info[:username], email: user_info[:email], password: user_info[:hashed_password] )

  if user_info[:hashed_password].length == 0
    user.valid?
    password_error = "Password can't be blank"
  else
    user.save
  end

  if user.persisted?
    session[:user_id] = user.id
    redirect 'users/stats'
  else
    errors = user.errors.full_messages.concat([password_error])
    report_create_errors(errors)
  end

  redirect '/users/:id'
end




