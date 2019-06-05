# frozen_string_literal: true

# Home Controller
require 'open-uri'

class HomeController < ApplicationController
  def index
    @ski_routes = SkiRoute.all
   end
end
