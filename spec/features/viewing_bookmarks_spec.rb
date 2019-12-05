
feature 'Bookmark Manager header' do 
  scenario "when a user visits the home page, there should be a header" do
    visit('/bookmarks')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Bookmarks list' do
  scenario "when a user is logged in, they should be able to see a list of their bookmarks" do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'destroyallsoftware')

    visit '/bookmarks'

    expect(page). to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page). to have_link("Google", href: "http://www.google.com")
    expect(page). to have_link("destroyallsoftware", href: "http://www.destroyallsoftware.com")
  end
end
