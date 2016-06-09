class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    login(params[:email], params[:password])

    redirect to '/posts'
  end

  get '/logout' do
    logout!

    redirect "/posts"
  end

end


