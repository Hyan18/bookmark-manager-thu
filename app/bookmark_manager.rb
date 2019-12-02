require 'sinatra/base'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmarks.new
    erb(:bookmarks)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.new
    erb(:bookmarks)
  end

  run! if app_file == $0
end
