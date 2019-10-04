class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :item
      t.string :description
      t.integer :targetgoal

      t.timestamps
    end
  end
end
