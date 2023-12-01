class AddSongToChallenge < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :song, null: false, foreign_key: true
  end
end
