require 'bookmark'

describe 'Bookmark' do

  let(:bookmarks) {Bookmarks.new}

  describe "#all" do
    it "should return a list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
   
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      p bookmark
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
   end

   describe "#create" do
    it "should create a new bookmark" do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe "#delete" do
    it "should delete an existing bookmark" do
      bookmark_to_delete = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark_to_delete.id)

      expect(Bookmark.all.length).to eq 0
    end

    it "should raise an error if bookmark does not exist in database" do
      expect{ Bookmark.delete(id: 999) }.to raise_error("That bookmark does not exist")
    end
  end

  describe "#update" do
    it "should update an existing bookmark" do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.update(id: bookmark.id, title: 'Updated Test Bookmark')

      expect(Bookmark.all.first.title).to eq('Updated Test Bookmark')
    end

    it "should raise an error if bookmark does not exist in database" do
      expect{ Bookmark.delete(id: 999) }.to raise_error("That bookmark does not exist")
    end
  end

end
