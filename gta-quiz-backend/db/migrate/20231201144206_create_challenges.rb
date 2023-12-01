class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.timestamp :date
      t.timestamps
    end
  end
end
