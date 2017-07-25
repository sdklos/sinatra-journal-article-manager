class JournalsController < ApplicationController
  get '/journals' do
    erb :"/journals/index"
  end

  get '/journals/new' do
    erb:"/journals/new"
  end

  post '/journals' do
    @journal = Journal.create(name: params["journal_name"])
    if @journal.valid?
      redirect("/journals/#{@journal.slug}")
    else
      flash[:message] = "Please provide a name for the Journal."
      redirect("/journals/new")
    end
  end

  get '/journals/:slug' do
    @journal = Journal.find_by_slug(params[:slug])
    if @journal
      erb :'/journals/show'
    else
      flash[:message] = "No journal with that name exists."
      redirect("/journals")
    end
  end
end
