# frozen_string_literal: true

# Controller for application user resource
class UsersController < ApplicationController
  load_and_authorize_resource

  def edit; end

  def update
    p @user
    if @user.update(user_params)
      flash[:notice] = 'User Updated succesfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Problem updating user'
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :avatar)
  end
end
