get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  question_list = params[:question]
  @question = Question.create(title: question_list[:title], body: question_list[:body], user_id: session[:user_id])
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  # @user = User.find_by(id: @question.answers.first.user_id)
  erb :'questions/question'
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy!
  redirect '/questions'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "questions/#{@question.id}"
end






