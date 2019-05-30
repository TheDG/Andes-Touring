# frozen_string_literal: true

# Controller for ski routes
class SkiRoutesController < ApplicationController
  before_action :authenticate_user!, on: %i[new create]
  load_and_authorize_resource

  def show; end

  def new; end

  def create
    if @ski_route.save
      flash[:notice] = 'Ruta creada satisfactoriamente'
      redirect_to ski_route_path(@ski_route)
    else
      flash.now[:alert] = 'Hubo un problema al tratar de crear la ruta'
      render 'new', status: :unprocessable_entity
    end
  end

  def ski_route_params
    params.require(:ski_route).permit(:title, :intro, :distance, :vert,
                                      :time, :aspect, :dificulty, :route_description,
                                      :location, :sector, :avatar,
                                      pictures_attributes: %i[description image])
          .merge(user: current_user)
  end
end
