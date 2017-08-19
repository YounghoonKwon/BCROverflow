get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

get '/answers/:id' do
  erb :'answers/index'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  answer_list = params[:answer]
  @answer = Answer.create(text: answer_list[:text], question_id: params[:id], user_id: session[:user_id])
  if request.xhr?
    erb :'answers/new', layout: false, answer: @answer
  else
    redirect "/questions/#{@question.id}"
  end
end

  # if request.accept? 'application/json'
    #   @answer.to_json
    # else
    #   @answer.to_s
    # end
