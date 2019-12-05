require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base


  get '/' do
    redirect 'bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb (:bookmarks)
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  get '/bookmarks/delete' do
    erb(:'bookmarks/delete')
  end

  post '/bookmarks/delete' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
