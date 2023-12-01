class AddRadioToSong < ActiveRecord::Migration[7.0]
  def change
    add_reference :songs, :radio, null: false, foreign_key: true
  end
end
