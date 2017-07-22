class CollectionsController < ApplicationController

  get "/collections/:slug" do
      @collection = Collection.find_by_slug(params[:slug])
      if @collection
        erb :'/collections/show'
      else
        flash[:message] = "No collection with that name exists."
        redirect("/")
      end
  end

end
