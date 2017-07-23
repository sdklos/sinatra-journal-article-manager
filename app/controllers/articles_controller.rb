class ArticlesController < ApplicationController

  get "/articles/new" do
    erb :"/articles/new"
  end

  post "/articles" do
    @article = Article.create(name: params[:article_name], year: params[:article_year])

  end
  get "/articles/:slug" do
    @article = Article.find_by_slug(params[:slug])

    erb :"/articles/show"
  end

  get "/articles/:slug/edit" do
    @article = Article.find_by_slug(params[:slug])

    erb :"/articles/edit"
  end

end
