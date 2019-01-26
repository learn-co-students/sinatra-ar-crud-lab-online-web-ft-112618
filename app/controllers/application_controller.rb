
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles" #makes homepage thte list of articles
  end

  #index
   get '/articles' do
     @articles = Article.all

     erb :index
   end

  #new
    get '/articles/new' do
      @article = Article.new #method is from Active Record
      erb :new
    end
  #create
    post '/articles' do
      @article = Article.create(params) #method is from Active Record
      redirect to "/articles/#{ @article.id }"
    end
  #show
     get '/articles/:id' do
       @article = Article.find(params[:id])

       erb :show
     end

    #UPDATE
    #EDIT
    get '/articles/:id/edit' do #form to edit
      @article = Article.find(params[:id])
      erb :edit
    end
    #PATCH
    patch '/articles/:id' do
      @article = Article.find(params[:id])
      @article.update(params[:article])
      redirect to "/articles/#{@article.id}"
    end

    #DELETE
    delete '/articles/:id' do
      @article = Article.find(params[:id])
      @article.delete
      redirect "/articles"
    end
end
