class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
  end

  get '/posts/new' do
    if !session[:email].present?
      redirect "/login"
    else
      erb :"/posts/new"
    end
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      post = Post.find(params[:id])
      if post.user_id == current_user.id
        "An edit post form #{current_user.id} is editing #{post.id}"
      else
        "You can't edit this post!"
      end
    end
  end


end