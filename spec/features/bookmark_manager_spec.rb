
feature 'Bookmark Manager header' do 
  scenario "when a user visits the home page, there should be a header" do
    visit('/bookmarks')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Bookmarks list' do
  scenario "when a user is logged in, they should be able to see a list of their bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.youtube.com')")
    visit('/bookmarks')
    expect(page).to have_content "http://www.youtube.com"
  end
end