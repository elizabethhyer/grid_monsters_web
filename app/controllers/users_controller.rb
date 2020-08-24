class UsersController < ApplicationController

  get "/signup" do
    erb :'users/signup'
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/failure"
    else 
      User.create(username: params[:username], password: params[:password])
      redirect "/"
    end 
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :home
  end

  get "/login" do
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && 
      user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else 
      redirect "/failure"
    end 
  end

  get "/failure" do
    erb :'users/failure'
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end

end
