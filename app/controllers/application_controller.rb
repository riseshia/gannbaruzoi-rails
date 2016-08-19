# frozen_string_literal: true
# ApplicationController
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_url, notice: "You don't have permission with this action"
  end
end

