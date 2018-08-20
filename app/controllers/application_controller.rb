class ApplicationController < ActionController::API
  include ExceptionHandler

  def welcome
    render json: {message: "Welcome to PandabizeAPI, visit API Documentation at: https://documenter.getpostman.com/view/4361815/RWTpsGpo"}
  end
end
