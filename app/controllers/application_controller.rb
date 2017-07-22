require './config/environment'
require 'pry'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash
  end

  get '/' do
    if logged_in?
      erb :'collection/home'
    else
      erb :index
  end

  post '/signup' do
    if Collection.create[params].valid?
      @collection = Collection.create(params)
      session[:user_id] = @collection.id
      redirect("/collections/:slug")
    else
      flash[:message] = "Please enter a valid e-mail address and password"
      erb :index
   end
  end

  post '/login' do
    @collection = Collection.find_by(email: params["email"])
    if @collection.valid?
      session[:user_id] = @collection.id
      redirect("/collections/:slug")
    else
      flash[:message] = "E-mail address and password do not match."
      erb:index
    end

end

helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      Collection.find(session[:user_id])
    end
  end

end
