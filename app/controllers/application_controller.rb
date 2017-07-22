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
      redirect("/collections/:slug")
    else
      erb :index
    end
  end

  post '/signup' do
    @collection = Collection.create(params)
  if @collection.valid?
    session[:user_id] = @collection.id
    redirect("/collections/:slug")
  else
   flash[:message] = "Please enter a valid username and password"
   erb :index
  end
end

  post '/login' do
    @collection = Collection.find_by(name: params["name"])
    if @collection && @collection.authenticate(params["password"])
      session[:user_id] = @collection.id
      redirect("/collections/#{@collection.slug}")
    else
      flash[:message] = "Username and Password do not match."
      erb:index
    end
  end

  get '/logout' do
    session.clear
    redirect("/")
  end

helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Collection.find(session[:user_id])
    end
  end

end
