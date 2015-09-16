class AddSongIdToChord < ActiveRecord::Migration
  def change
    add_column :chords, :song_id, :string
  end
end
