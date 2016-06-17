class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
  
    figure = Figure.create(params[:figure])

    if params[:figure][:title_ids].nil?
      figure.titles << Title.create(params["title"])

      if params[:figure][:landmark_ids].nil?
        figure.landmarks << Landmark.create(params["landmark"])
      end
    end

    figure.save
    redirect to("/figures")

  end

  get '/figures/:id' do

    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])
    if @figure.landmarks.empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    else
      @figure.landmarks[0].update(:name => params["landmark"])
    end
    @figure.save
    redirect to("figures/#{@figure.id}")
  end


end
