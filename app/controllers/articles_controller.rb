class ArticlesController < ApplicationController

  get "/articles/new" do
    erb :"/articles/new"
  end

  post "/articles" do
    @article = Article.create(name: params["article"]["name"], year: params["article"]["year"])
    @article.collection_id = current_user.id
    if !params["author"]["author_first_name"].empty? && !params["author"]["author_last_name"].empty?
      @article.build_author(first_name: params["author"]["author_first_name"], last_name: params["author"]["author_last_name"])
    else
      @article.author_id = params["article"]["author_id"]
    end
    @article.save
    if !params["journal_name"].empty?
      @article.build_journal(name: params["journal_name"])
    else
      @article.journal_id = params["article"]["journal_id"]
    end
    @article.details = params["details"]
    binding.pry
    if @article.author && @article.journal
      @article.save
      redirect("/collections/#{current_user.slug}")
    else
      flash[:message] = "Please provide an author and journal for your article."
      redirect("/articles/new")
    end



  end
  get "/articles/:id" do
    @article = Article.find(params[:id])

    erb :"/articles/show"
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :"/articles/edit"
  end

end
