require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base


  get '/' do
    redirect 'bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb (:bookmarks)
  end

  post '/bookmarks' do
    Bookmarks.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  run! if app_file == $0
end
