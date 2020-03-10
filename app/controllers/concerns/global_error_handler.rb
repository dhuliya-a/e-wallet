module GlobalErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :record_errors
  end

  private

  def record_errors(error)
    if error.class == AuthError
      render json: {error: error.message}, status: :unauthorized

    elsif error.class == ValidationError
      render json: {error: error.message}, status: :bad_request

    elsif error.class == ActiveRecord::RecordNotFound
      render json: {error: "record not found"}, status: :bad_request

    else
      render json: {error: error.message}, status: :internal_server_error
    end
  end
end
