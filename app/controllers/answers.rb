get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

get '/answers/:id' do
  erb :'answers/index'
end

post '/questions/:id/answers' do
  question = Question.find(params[:id])
  answer_list = params[:answer]
  @answer = Answer.create(text: answer_list[:text])
  puts @answer.inspect
  puts @answer[:question_id]
  redirect "/questions/#{@question.id}"
end

