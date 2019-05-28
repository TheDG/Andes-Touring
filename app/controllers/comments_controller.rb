# frozen_string_literal: true

# Controller for application comments
class CommentsController < ApplicationController
  before_action :authenticate_user!

  load_resource :ski_route
  load_and_authorize_resource :comment, through: %i[ski_route], shallow: true

  def create
    @comment.save
    redirect_to ski_route_path(@comment.ski_route)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(
      ski_route: @ski_route
    )
  end
end
