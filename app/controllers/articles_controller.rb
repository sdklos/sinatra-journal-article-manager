class ArticlesController < ApplicationController

  get "/articles" do
    erb :"/articles/index"
  end

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
    if @article.author && @article.journal
      @article.save
      redirect("/collections/#{current_user.slug}")
    else
      flash[:message] = "Please provide an author and journal for your article."
      redirect("/articles/new")
    end
  end

  get "/articles/:slug" do
    @article = Article.find_by_slug(params[:slug])
    if @article
      erb :"/articles/show"
    else
      flash[:message] = "No article with that id exists."
      redirect("/articles")
    end

  end

  get "/articles/:slug/add" do
    @article = Article.find_by_slug(params[:slug])
    current_user.articles << @article
    current_user.save
    redirect("/collections/#{current_user.slug}")
  end

  get "/articles/:slug/edit" do
    @article = Article.find_by_slug(params[:slug])

    erb :"/articles/edit"
  end

  patch "/articles/:slug" do
    @article = Article.find_by_slug(params[:slug])
    @article.details = "#{@article.details}" + "<br>" + params["additional_details"]
    binding.pry
    @article.save
    redirect("/articles/#{@article.slug}")
  end

  get "/articles/:slug/remove" do
    @article = Article.find_by_slug(params[:slug])
    current_user.articles.all.find(@article.id).delete
    current_user.save
    redirect("/collections/#{current_user.slug}")
  end

end
