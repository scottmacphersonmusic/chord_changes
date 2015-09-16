require "test_helper"

feature "songs have crud actions" do
  scenario "create song" do
    # Given a song index page at the root route
    visit root_path
    # When I click 'new song' and fill out the form and submit
    click_on "New Song"
    fill_in "Title", with: "Solar"
    fill_in "Composer", with: "Miles Davis"
    click_on "Create Song"
    # Then a new song is created and I see a notice
    page.must_have_content "New song created!"
    page.must_have_content "Miles Davis"
  end

  scenario "attempt to create invalid song" do
    # Given a new song form
    visit new_song_path
    # When I try to create a new, invalid song
    fill_in "Title", with: ""
    fill_in "Composer", with: ""
    # The song is not created and I see an error message
    current_path.must_equal new_song_path
    page.must_have_content "Song not created."
    page.must_have_content "?error?"
  end

  scenario "update song" do
    # Given an existing song
    visit root_path
    # When I click 'edit' and submit some changes
    first('.crud_links').click_link('Edit')
    fill_in "Title", with: "Share-a-key"
    click_on "Update Song"
    # The song is edited
    page.must_have_content "Song successfully updated!"
    page.must_have_content "Share-a-key"
  end

  scenario "attempt to edit invalid song" do
    # Given a new song edit form
    song = songs(:all_the_things)
    visit edit_song_path(song)
    # When I try update an invalid song
    fill_in "Composer", with: ""
    # The song is not created and I see an error message
    current_path.must_equal edit_song_path(song)
    page.must_have_content "Song not updated."
    page.must_have_content "?error?"
  end

  scenario "delete song" do
    # Given an existing song
    visit root_path
    # When I click delete
    first('.crud_links').click_link('Delete')
    # The song is deleted
    page.must_have_content "Song successfully deleted!"
    page.wont_have_content "Confirmation"
    page.wont_have_content "by Charlie Parker"
  end
end
