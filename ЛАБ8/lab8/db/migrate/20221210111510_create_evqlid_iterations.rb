class CreateEvqlidIterations < ActiveRecord::Migration[7.0]
  def change
    create_table :evqlid_iterations do |t|
      t.integer :iteration
      t.integer :num1
      t.integer :num2

      t.timestamps
    end
  end
end
