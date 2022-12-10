class AddUniqnessToRes < ActiveRecord::Migration[7.0]
  def change
    add_index :evqlid_results, [ :num1, :num2 ], unique: true
  end
end
