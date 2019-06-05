# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    ski_routes_id = SkiRoute.where(user: user).pluck(:id)

    can %i[read create], Comment
    can %i[read create], Picture
    can %i[read create], SkiRoute
    can %i[edit update], SkiRoute, id: ski_routes_id
    can %i[edit update], User, id: user.id
  end
end
