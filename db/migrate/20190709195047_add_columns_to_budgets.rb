class AddColumnsToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :category, :string
    add_column :budgets, :img_url, :string
    add_column :budgets, :user_id, :integer
  end
end
