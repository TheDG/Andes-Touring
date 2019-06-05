# frozen_string_literal: true

# Controller for application user resource
class UsersController < ApplicationController
  load_and_authorize_resource

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Perfil actualizado satisfactoriamente'
      redirect_to root_path
    else
      flash.now[:alert] = 'Hubo un problema al tratar de actualizar el perfil'
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :avatar)
  end
end
