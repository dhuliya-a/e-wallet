
class ApplicationController < ActionController::API
  before_action :authorize_request

  include GlobalErrorHandler

  attr_reader :current_user

  def authorize_request
    @current_user = AuthorizeApiRequest.new.auth_request(request.headers)
  end
end
