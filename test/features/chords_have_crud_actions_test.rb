require "test_helper"

feature "chords have crud actions" do
  scenario "create chord" do
    # Given an existing song's show page
    visit song_path(songs(:cherokee))
    # When I click on 'create chord' and fill out the form
    click_on "New Chord"
    fill_in "Pitch", with: "Bb"
    fill_in "Quality", with: "maj7"
    fill_in "Measure", with: "1"
    fill_in "Sequence", with: "1"
    click_on "Create Chord"
    # A chord is created
    save_and_open_page
    page.must_have_content "Chord successfully created!"
    page.must_have_content "Bbmaj7"
  end

  scenario "update chord" do
  end

  scenario "delete chord" do
  end

  # - - - Unhappy Paths - - -

  scenario "attempt to create invalid chord" do
  end

  scenario "attempt to update invalid chord" do
  end
end
