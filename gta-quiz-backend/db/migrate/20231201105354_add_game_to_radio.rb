class AddGameToRadio < ActiveRecord::Migration[7.0]
  def change
    add_reference :radios, :game, null: false, foreign_key: true
  end
end
