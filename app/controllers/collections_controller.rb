class CollectionsController < ApplicationController
  get "/collections/:slug" do
    if logged_in?
      @collection = current_user
      erb :'/collections/show'
    else
      redirect("/")
    end
  end

  get '/collections/logout' do
    session.clear
    redirect("/")
  end
end
