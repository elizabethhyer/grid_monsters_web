class ProfilesController < ApplicationController

  get "/profiles" do
    @profiles = Profile.all
    erb :'/profiles/index'
  end

  get "/profiles/new" do
    if logged_in?
      erb :'/profiles/new'
    else 
      redirect_if_not_logged_in
    end 
  end

  get "/profiles/newest" do
    redirect_if_not_logged_in
    @profile = Profile.last
    redirect "/profiles/#{@profile.id}"
  end 

  post "/profiles" do
    if logged_in?
      @profile = current_user.profiles.build(params)
      if @profile.save 
        redirect to "/profiles/#{@profile.id}"
      else 
        redirect to "/profiles/new"
      end 
    end 
    redirect_if_not_logged_in
  end

  get "/profiles/:id" do 
    redirect_if_not_logged_in
    if @profile = Profile.find_by(params)
      erb :'/profiles/show'
    else 
      redirect '/profiles' #triggers a new request/response cycle
    end 
  end 

  get "/profiles/:id/edit" do 
    redirect_if_not_logged_in
    @profile = Profile.find_by(params)
    if !check_owner(@profile)
      redirect "/profiles"
    end 
    erb :'/profiles/edit'
  end 

  patch "/profiles/:id" do 
    redirect_if_not_logged_in
    @profile = Profile.find_by(id: params[:id])
    if check_owner(@profile)
    @profile.update(params[:profile])
    else 
      redirect "/profiles"
    end 
    erb :'profiles/show'
  end 

  delete "/profiles/:id" do 
    redirect_if_not_logged_in
    @profile = Profile.find_by(id: params[:id])
    if check_owner(@profile)
      @profile.delete
    end 
      redirect '/profiles'
  end 

end
