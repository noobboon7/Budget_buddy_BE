class ApplicationController < ActionController::API
  # before_action :authorized
  def encode_token(payload)

   # don't forget to hide your secret in an environment variable
   JWT.encode(payload, 'my_super_top_secret')
 end

 def auth_header
   # byebug
 # { Authorization: 'Bearer <token>' }
   request.headers['Authorization']
 end

 def decoded_token
     # header: { 'Authorization': 'Bearer <token>' }
     begin
       JWT.decode(auth_header, 'my_super_top_secret')[0]["user_id"]
     rescue
       nil
     end
   # byebug
 end

 def session_user
   # byebug
   User.find_by(id: decoded_token)
 end

 def logged_in?
   # byebug
   !!session_user
 end

 # def authorized
 #   byebug
 #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
 # end
end
