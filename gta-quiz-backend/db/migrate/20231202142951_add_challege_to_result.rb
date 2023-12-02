class AddChallegeToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :challenge, null: false, foreign_key: true
  end
end
