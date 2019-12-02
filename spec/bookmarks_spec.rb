require 'bookmarks.rb'

describe 'Bookmarks' do

  let(:bookmarks) {Bookmarks.new}

  describe '#all' do 
    it "displays all the users bookmarks" do
      expect(Bookmarks.all).to eq ["Gymshark: www.gymshark.com", "Google: www.google.com", "Boohooman: www.boohooman.com"]
    end
  end

end