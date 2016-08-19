# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  should have_many(:tasks)
  should have_many(:pomodoros).through(:tasks)

  def test_from_omniauth_return_new_user
    assert_nil User.find_by_uid("some_uid")
    auth = Auth.new("some_uid", "test@email.com", "name")
    user = User.from_omniauth(auth)

    assert user.persisted?
  end

  def test_from_omniauth_return_exist_user
    user = create(:user)
    auth = Auth.new(user.uid, user.email, user.name)
    user = User.from_omniauth(auth)

    assert user.persisted?
  end

  class Auth
    attr_reader :uid, :info

    def initialize(uid, email, name)
      @uid = uid
      @info = Info.new(email, name)
    end

    def provider
      "github"
    end

    Info = Struct.new(:email, :name)
  end
end

