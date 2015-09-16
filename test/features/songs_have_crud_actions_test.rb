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
    # Then a new song is created
    page.must_have_content "New song created!"
    page.must_have_content "Miles Davis"
  end

  scenario "edit song" do
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
end
