class AddRadioToChallenge < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :radio, null: false, foreign_key: true
  end
end
