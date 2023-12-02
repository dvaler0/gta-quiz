class DeleteRadioFromChallenge < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :radio_id
  end
end
