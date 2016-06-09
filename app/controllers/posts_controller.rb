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
      if post = current_user.posts.find_by(params[:id])
      "That's your post, edit it! " #We should render the edit form...
      else
        redirect '/posts'
      end
    end
  end


end