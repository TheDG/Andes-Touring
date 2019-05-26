# frozen_string_literal: true

# Concern to test authorization validation
module Authorizable
  extend ActiveSupport::Concern

  included do
    class << self
      %i[executive administrator].each do |account|
        define_method :"test_unauthorized_#{account}_on" do |method, route, params = {}|
          it "should respond unauthorized on #{method}/#{route}" do
            send(method, route, params)
            expect(response).to redirect_to(public_send("new_#{account}_session_path"))
            expect(response.status).to eq(302)
          end
        end
      end
    end
  end
end
