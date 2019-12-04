require 'bookmarks.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmarks.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.youtube.com')")
      expect(Bookmarks.all).to eq ["http://www.youtube.com"]
    end
  end

end