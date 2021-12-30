# frozen_string_literal: true

module V1
  module Weather
    class Historical < Grape::API
      desc 'Returns the hourly temperature for the last 24 hours'

      helpers do
        def query
          Temperature.data_for_twenty_four
        end
      end

      namespace :historical do
        get :max do
          query.maximum(:value)
        end

        get :min do
          query.minimum(:value)
        end

        get :avg do
          query.average(:value).to_i
        end
      end
    end
  end
end
