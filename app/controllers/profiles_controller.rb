class ProfilesController < ApplicationController

  get "/profiles" do
    redirect_if_not_logged_in
    @profiles = Profile.all
    erb :'/profiles/index'
  end

  get "/profiles/new" do
    redirect_if_not_logged_in
    erb :'/profiles/new'
  end

  post "/profiles" do
    redirect_if_not_logged_in
    @profile = Profile.create(params)
    redirect "/profiles/#{@profile.id}"
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
