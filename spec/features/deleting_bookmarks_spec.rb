feature "deleting bookmarks" do
  scenario "create a bookmark then delete it" do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.youtube.com'
    fill_in 'title', with: 'Youtube'
    click_button 'submit'

    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')

    visit 'bookmarks/delete'
    fill_in 'title', with: 'Youtube'
    click_button 'Delete'

    expect(page).to_not have_link("Youtube", href: 'http://www.youtube.com')
  end
end
