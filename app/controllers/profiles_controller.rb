class ProfilesController < ApplicationController

  get "/profiles" do
    @profiles = Profile.all
    erb :"/profiles/index"
  end

  get "/profiles/new" do
    erb :'/profiles/new'
  end

  post "/profiles" do
    @profile = Profile.create(params)
    erb :'/profiles/show'
  end

  get "/profiles/:id" do 
    @profile = Profile.find_by(params)
    erb :'/profiles/show'
  end 

  get "/profiles/:id/edit" do 
    @profile = Profile.find_by(params)
    erb :'/profiles/edit'
  end 

  patch "/profiles/:id" do 
    @profile = Profile.find_by(id: params[:id])
    @profile.update(params)
  end 

  # # DELETE: /profiles/5/delete
  # delete "/profiles/:id/delete" do
  #   redirect "/profiles"
  # end
end
