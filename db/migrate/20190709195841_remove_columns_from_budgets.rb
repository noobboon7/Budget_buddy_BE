class RemoveColumnsFromBudgets < ActiveRecord::Migration[5.2]
  def change
    remove_column :budgets, :description, :string
  end
end
