# frozen_string_literal: true

class API < Grape::API
  format :json

  mount Health
  mount V1::Base
end
