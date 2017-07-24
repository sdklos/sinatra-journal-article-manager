class JournalsController < ApplicationController
  get '/journals' do
    erb :"/journals/index"
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
