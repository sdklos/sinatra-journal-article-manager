class AuthorsController < ApplicationController

  get "/authors" do
    erb :"authors/index"
  end

  get "/authors/new" do
    erb:"/authors/new"
  end

  post "/authors" do
    @author = Author.create(first_name: params["author"]["author_first_name"], last_name: params["author"]["author_last_name"])
    if @author.valid?
      redirect("/authors/#{@author.slug}")
    else
      flash[:message] = "Please provide a first and last name for the author."
      redirect("/authors/new")
    end
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
