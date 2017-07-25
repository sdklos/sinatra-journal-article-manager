class CollectionsController < ApplicationController

  get "/collections" do
    erb :"collections/index"
  end

  get "/collections/:slug" do
      @collection = Collection.find_by_slug(params[:slug])
      if @collection
        erb :'/collections/show'
      else
        flash[:message] = "No collection with that name exists."
        redirect("/collections")
      end
  end

end
