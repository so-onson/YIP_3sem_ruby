class CreateEvqlidResults < ActiveRecord::Migration[7.0]
  def change
    create_table :evqlid_results do |t|
      t.integer :num1
      t.integer :num2
      t.integer :nod
      t.integer :nok
      t.string :result

      t.timestamps
    end
  end
end
