
feature 'Bookmark Manager header' do 
  scenario "when a user visits the home page, there should be a header" do
    visit('/bookmarks')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Bookmarks list' do
  scenario "when a user is logged in, they should be able to see a list of their bookmarks" do
    Bookmark.create(url: "http://www.youtube.com", title: "Youtube")
    visit('/bookmarks')
    expect(page).to have_content "Youtube"
  end
end

feature 'Adding bookmarks' do
  scenario 'After logging in I want to save some website as my bookmark' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.youtube.com'
    fill_in 'title', with: 'Youtube'
    click_button 'submit'
    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')
  end
end