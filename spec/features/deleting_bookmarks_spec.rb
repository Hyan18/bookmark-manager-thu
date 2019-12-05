feature "deleting bookmarks" do
  scenario "create a bookmark then delete it" do
    Bookmark.create(url: "http://www.youtube.com", title: "Youtube")
    visit('/bookmarks')
    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link("Youtube", href: 'http://www.youtube.com')
  end
end
