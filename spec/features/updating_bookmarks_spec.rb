feature "updating bookmarks" do
  scenario "create a bookmark then update it" do
    Bookmark.create(url: "http://www.youtube.com", title: "Youtube")
    visit('/bookmarks')
    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')

    first('.bookmark').click_button 'Update'
    fill_in 'url', with: 'http://www.newyoutube.com'
    fill_in 'title', with: 'New Youtube'
    click_button 'Update'

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link("Youtube", href: 'http://www.youtube.com')
    expect(page).to have_link("New Youtube", href: 'http://www.newyoutube.com')
  end
end