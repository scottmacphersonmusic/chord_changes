class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.string :pitch
      t.string :quality
      t.integer :measure
      t.integer :sequence
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
