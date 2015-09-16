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
    page.must_have_content "Chord successfully created!"
    page.must_have_content "Bbmaj7"
  end

  scenario "update chord" do
    # Given an existing chord's show page
    song = songs(:cherokee)
    chord = chords(:cher_1_1)
    visit song_chord_path(song, chord)
    # When I click on edit, fill out and submit the form
    click_on "Edit"
    fill_in "Pitch", with: "A#"
    fill_in "Quality", with: "7(#9)"
    click_on "Update Chord"
    # Then the chord is edited
    page.must_have_content "Chord successfully updated!"
    page.must_have_content "A#"
    page.must_have_content "7(#9)"
  end

  scenario "delete chord" do
    # Given an existing chord's show page
    song = songs(:cherokee)
    chord = chords(:cher_4_1)
    visit song_chord_path(song, chord)
    # When I click delete
    click_on "Delete"
    # Then the chord is deleted
    page.must_have_content "Chord successfully deleted!"
    page.wont_have_content "Ab7(#9)"
  end

  # - - - Unhappy Paths - - -

  scenario "attempt to create invalid chord" do
    # Given a new chord form

    # When I submit invalid data

    # Then no chord is created and I see an error message
  end

  scenario "attempt to update invalid chord" do
    # Given a chord edit form

    # When I submit invalid data

    # Then the chord is not updated and I seen an error messag

  end
end
