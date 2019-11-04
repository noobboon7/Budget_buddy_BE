class AddForeignKeyToBudgets < ActiveRecord::Migration[5.2]
  def change
     add_foreign_key :budgets, :users
  end
end
