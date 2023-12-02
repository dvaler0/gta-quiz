class AddSolutionToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :solution, :string
  end
end
