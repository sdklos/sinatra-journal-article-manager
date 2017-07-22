class ArticlesController < ApplicationController

  get "/articles/:slug" do
    @article = Article.find_by_slug(params[:slug])

    erb :"/articles/show"

  end

end
