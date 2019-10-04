class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :item, :img_url, :targetgoal, :category, :user_id
end
