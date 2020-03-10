
class AuthorizeApiRequest

  def auth_request(headers)
    bearer_token = headers['Authorization']
    @decoded_token = JsonWebToken.decode(bearer_token)
    user_id = @decoded_token[:user_id]

    val = REDIS.get("auth_#{user_id}")
    p val
    raise AuthError.new "You have been logged out." if val.blank? || val != bearer_token

    user = User.find_by_id(user_id)
    raise ValidationError.new "Not registered" if user.blank?

    user

  rescue
    raise AuthError.new, "You have been logged out"
  end
end
