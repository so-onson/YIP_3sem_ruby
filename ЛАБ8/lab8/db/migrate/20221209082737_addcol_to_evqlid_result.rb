class AddcolToEvqlidResult < ActiveRecord::Migration[7.0]
  def change
    add_column :evqlid_results, :result1, :string
    add_column :evqlid_results, :result2, :string
  end
end
