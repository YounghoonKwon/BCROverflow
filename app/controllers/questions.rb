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

post '/question/:id/upvote' do
  # if session[:user_id] != nil
    question = Question.find(params[:id])
    question.votes.create(user_id: session[:user_id], value: 1)
    redirect "/question/:id"

    #   if request.accept? 'application/json'
    #     question.votes.count.to_json
    #   else
    #     question.votes.count.to_s
    #   end
    # else
    #   redirect "/questions"
    # end
  # else
  #   redirect '/users/login'
  # end
end

post '/question/:id/downvote' do
  # if session[:user_id] != nil
    question = Question.find(params[:id])
    question.votes.create(user_id: session[:user_id], value: -1)
    redirect "/question/:id"

    #   if request.accept? 'application/json'
    #     question.votes.count.to_json
    #   else
    #     question.votes.count.to_s
    #   end
    # else
    #   redirect "/questions"
    # end
  # else
  #   redirect '/users/login'
  # end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "questions/#{@question.id}"
end






