# frozen_string_literal: true
module Users
  # CallbacksController
  class CallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env["omniauth.auth"])
      @user.remember_me = true
      sign_in_and_redirect @user
    end
  end
end

