require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/failure"
    else 
      User.create(username: params[:username], password: params[:password])
      redirect "/home"
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

end
