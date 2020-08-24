class ProfilesController < ApplicationController

  get "/profiles" do
    # @profiles = ["Dracula", "Mummy", "The Butcher"]
    erb :"/profiles/index"
  end

  get "/profiles/new" do
    erb :'/profiles/new'
  end

  post "/profiles" do
    @profile = (name: params[:name], species: params[:species], bio: params[:bio])
    erb :'/profiles/show'
  end

  get "/profiles/:id" do 
    @profile = Profile.find(params[:id])
    erb :'/profiles/show'
  end 

  # # GET: /profiles/5
  # get "/profiles/:id" do
  #   erb :"/profiles/show.html"
  # end

  # # GET: /profiles/5/edit
  # get "/profiles/:id/edit" do
  #   erb :"/profiles/edit.html"
  # end

  # # PATCH: /profiles/5
  # patch "/profiles/:id" do
  #   redirect "/profiles/:id"
  # end

  # # DELETE: /profiles/5/delete
  # delete "/profiles/:id/delete" do
  #   redirect "/profiles"
  # end
end
