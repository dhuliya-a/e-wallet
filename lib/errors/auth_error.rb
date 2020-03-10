class AuthError < StandardError
end



  # def authorize_request
  #   header = request.headers['Authorization']
  #   header = header.split(' ').last if header
  #     #if authorized, returns current

  #   @decoded = JsonWebToken.decode(header)

  #   if REDIS.get(@decoded[:user_id])
  #     p "AUTHORIZED"
  #     @current_user = User.find(@decoded[:user_id])

  #   #add if you'll remove the rescues
  #   # else
  #   #   p "UNAUTHORIZED"
  #   #   render json: { errors: "Unauthorized" }, status: :unauthorized
  #   end

  #   # rescue ActiveRecord::RecordNotFound => e
  #   #   render json: { errors: e.message }, status: :unauthorized
  #   # rescue JWT::DecodeError => e
  #   #   p "UNAUTHORIZED"
  #   #   render json: { errors: e.message }, status: :unauthorized

  #   raise StandardError.new "asdfs"
  #   p "FUCKdzvfvsfbsfb"

  # end
