class LandmarksController < ApplicationController


  get '/landmarks' do
    @landmakes = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:name],  year_completed: params[:year_completed])
    @landmark.save
    redirect to("/landmarks")
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to("landmarks/#{@landmark.id}")
  end


end
