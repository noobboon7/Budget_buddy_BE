class UsersController < ApplicationController
  # before_action :authorized, only: [:persist]
  # skip_before_action :authorized, only: [:create]
  wrap_parameters :user, include: [:first_name, :last_name, :email, :username, :password, :bio, :avatar, :amount]

  def index
    @users= User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: {user: UserSerializer.new(@user)}
  end

  def login
     # byebug
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { error: "NICE TRY" }
    end
  end

  def add_to_wallet
    user = User.find_by(id:decoded_token)
		user.update(amount: user.amount + params[:amount].to_i)
    # byebug
    render json: {user: UserSerializer.new(user)}
  end

  def persist
    # byebug
    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), jwt: token }
  end



	def create
    # byebug
		user = User.new(user_params)
		if user.save
			token = encode_token(user.id)
			render json: {user: UserSerializer.new(user), jwt: token }, status: :created
		else
			render json: {errors: user.errors.full_messages}, status: :not_acceptable
		end
	end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :bio, :avatar, :amount)
    end
end
