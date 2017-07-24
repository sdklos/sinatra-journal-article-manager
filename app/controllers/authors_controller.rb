class AuthorsController < ApplicationController

  get "/authors" do
    erb :"authors/index"
  end
  get "/authors/:slug" do
      @author = Author.find_by_slug(params[:slug])
      if @author
        erb :'/authors/show'
      else
        flash[:message] = "No author with that name exists."
        redirect("/")
      end
  end

end
