require 'bookmarks.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmarks.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      expect(Bookmarks.all).to eq ["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com", "http://www.askjeeves.com"]
    end
  end

end