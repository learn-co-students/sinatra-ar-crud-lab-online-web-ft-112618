
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  	erb :index
  end

  get '/articles/new' do

  	erb :new
  end

  post '/articles' do
  	
  	@title = params[:title]
  	@content = params[:content] 

  	Article.create(title: @title,content: @content)

  	@id = Article.last.id
  	
  	redirect "/articles/#{@id}"
  end

  get "/articles" do
  	
  	@article = Article.all
  	

  	erb :index

  end

  get "/articles/:id" do
  	
  	 @id = params[:id]

  	@article = Article.find(@id)
  	erb :show

  end

  get '/articles/:id/edit' do 

  	@id = params[:id]

  	@article = Article.find(@id)
  	erb :edit
  end

  patch '/articles/<%= @article.id %>' do 


  end


end
