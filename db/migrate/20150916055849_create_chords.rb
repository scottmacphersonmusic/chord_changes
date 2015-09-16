class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.string :pitch
      t.string :quality
      t.string :measure
      t.string :sequence

      t.timestamps null: false
    end
  end
end
