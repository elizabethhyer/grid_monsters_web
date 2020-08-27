class UsersController < ApplicationController

  get "/signup" do
    if current_user
      redirect "/profiles"
    end 
    erb :'users/signup'
  end

  post "/users" do #this is the post for signup, posting to users
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect "users/#{user.name}"
    else 
      redirect '/failure'
    end 
  end

  get "/users/:name" do
    @user = User.find_by(params) 
    erb :'users/show'
  end 

  get "/account" do
    @user = User.find(session[:user_id])
    erb :home
  end

  get "/login" do
    if current_user
      redirect "/profiles"
    end 
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "users/#{user.name}"
    else 
      redirect '/failure'
    end 
  end

  get "/failure" do
    erb :'users/failure'
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
