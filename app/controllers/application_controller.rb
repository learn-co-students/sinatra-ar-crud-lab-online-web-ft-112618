
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to "/articles"
  end  

#create new object in the model class Article, then set it to an instance variable
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  
 #create new object based on the params of the form data created in new.erb. The new object will be stored in @articles. Then redirect the user to the page based on the id number from the params.
  post '/articles' do
    @article = Article.create(params) #creating a new object with an unique id number
    redirect to "/articles/#{@article.id}" #redirect to newly-created object based on id number using string interpolation.
  end  
  
#this will render the index page and show a list of all of the articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end  
  
#Active Record will find the article with id number set by the params, grab that article, and show it to the user
   get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end 

#Active Record will find the article with id number set by the params, render the edit view and allow the user to edit that specific article using the form in edit.erb. The edited article will then be posted to the patch action.
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  #Active Record will retrieve the article with the id number set by the params, then perform update based on the date by the params from the form in edit.erb. It then save the article and redirect the user to that specific article.
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

#Active Record will delete a specific article based on the params. It works like the .find method. Then the program will redirect to the index page.
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end  
  
end
