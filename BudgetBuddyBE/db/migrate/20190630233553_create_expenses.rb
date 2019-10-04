class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :type
      t.integer :amount
      t.string :description

      t.timestamps
    end
  end
end
