class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
    render json: @budgets
  end

  def show
    @budget = Budget.find(params[:id])
    render json: {budget: BudgetSerializer.new(@budget)}
  end

  def get_user_budgets
    # byebug
    user = User.find_by(id:decoded_token)
    budgets = user.budgets
    render json: budgets, each_serializer: BudgetSerializer
  end

  def create
    # byebug
    budget = Budget.new(budget_params)
    budget.user_id = decoded_token
    budget.save
    render json: {budget: BudgetSerializer.new(budget)}, status: :created
  end
  def destroy
    # byebug
    @budget = Budget.find_by(id: params["id"])
    @budget.destroy
  end


  private
  def budget_params
    params.require(:budget).permit(:item, :category, :targetgoal, :img_url, :user_id)
  end
end
