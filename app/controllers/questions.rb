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

post '/questions/:id/upvote' do
  # if session[:user_id] != nil
    @question = Question.find(params[:id])
    @question.votes.create(user_id: session[:user_id], value: 1)
    if request.xhr?
      vote_total = @question.votes.reduce(0) {|sum, vote| sum += vote.value }
      return vote_total.to_s
    else
      redirect "/questions/#{@question.id}"
    end
end

post '/questions/:id/downvote' do
  # if session[:user_id] != nil
    @question = Question.find(params[:id])
    @question.votes.create(user_id: session[:user_id], value: -1)
    if request.xhr?
      vote_total = @question.votes.reduce(0) {|sum, vote| sum += vote.value }
      return vote_total.to_s
    else
      redirect "/questions/#{@question.id}"
    end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "questions/#{@question.id}"
end

post '/answers/:id/upvote' do
  # if session[:user_id] != nil
    @answer = Answer.find(params[:id])
    @answer.votes.create(user_id: session[:user_id], value: 1)
    if request.xhr?
      vote_total = @answer.votes.reduce(0) {|sum, vote| sum += vote.value }
      return vote_total.to_s
    else
      redirect "/questions/#{@answer.question_id}"
    end
end

post '/answers/:id/downvote' do
  # if session[:user_id] != nil
    @answer = Answer.find(params[:id])
    @answer.votes.create(user_id: session[:user_id], value: -1)
    if request.xhr?
      vote_total = @answer.votes.reduce(0) {|sum, vote| sum += vote.value }
      return vote_total.to_s
    else
      redirect "/questions/#{@answer.question_id}"
    end

end





