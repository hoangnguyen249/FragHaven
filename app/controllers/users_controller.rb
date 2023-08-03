class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:public_index]
  def public_index
    @users = User.all
  end
end