class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_column :evqlid_iterations, :evqlid_result_id, :integer
    add_foreign_key :evqlid_iterations, :evqlid_results
  end
end
