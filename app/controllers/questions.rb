get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  question_list = params[:question]
  @question = Question.create(title: question_list[:title], body: question_list[:body])
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/question'
end




