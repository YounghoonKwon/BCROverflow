get '/questions' do
  redirect '/questions/index'
end

get '/questions/:id' do
  erb :'questions/question'
end

get '/questions/new' do
  erb :'questions/new'
end

post 'questions' do
  redirect '/questions/:id'
end




