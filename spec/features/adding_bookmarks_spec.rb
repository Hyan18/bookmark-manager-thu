feature 'Adding bookmarks' do
  scenario 'After logging in I want to save some website as my bookmark' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.youtube.com'
    fill_in 'title', with: 'Youtube'
    click_button 'submit'
    expect(page).to have_link("Youtube", href: 'http://www.youtube.com')
  end
end
