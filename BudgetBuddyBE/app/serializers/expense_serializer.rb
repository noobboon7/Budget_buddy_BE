class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :type, :amount, :description
end
