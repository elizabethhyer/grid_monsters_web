class ProfilesController < ApplicationController

  get "/profiles" do
    @profiles = Profile.all
    erb :'/profiles/index'
  end

  get "/profiles/new" do
    erb :'/profiles/new'
  end

  post "/profiles" do
    @profile = Profile.create(params)
    redirect "/profiles/#{@profile.id}"
  end

  get "/profiles/:id" do 
    if @profile = Profile.find_by(params)
      erb :'/profiles/show'
    else 
      redirect '/profiles' #triggers a new request/response cycle
    end 
  end 

  get "/profiles/:id/edit" do 
    @profile = Profile.find_by(params)
    erb :'/profiles/edit'
  end 

  patch "/profiles/:id" do 
    @profile = Profile.find_by(id: params[:id])
    @profile.update(params[:profile])
    erb :'profiles/show'
  end 

  delete "/profiles/:id" do 
    @profile = Profile.find_by(id: params[:id])
    @profile.delete
    redirect '/profiles'
  end 

end
