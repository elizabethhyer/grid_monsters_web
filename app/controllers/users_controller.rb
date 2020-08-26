class UsersController < ApplicationController

  get "/signup" do
    erb :'users/signup'
  end

  post "/users" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect "users/#{user.id}"
  end

  get "/users/:id" do
    @user = User.find_by(params) 
    erb :'users/show'
  end 

  get "/account" do
    @user = User.find(session[:user_id])
    erb :home
  end

  get "/login" do
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "users/#{user.id}"
    else 
      flash[:message] = "Invalid Login"
      redirect '/login'
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


# errors:
# if nothing is added to the form in signup or login, there is no error handling
# account is created, but login takes them back to the login page