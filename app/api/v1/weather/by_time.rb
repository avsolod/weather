# frozen_string_literal: true

module V1
  module Weather
    class ByTime < Grape::API
      rescue_from NotFoundError, ActiveRecord::RecordNotFound do |exception|
        error!('Temperature not found', 404)
      end

      desc 'Returns the hourly temperature for the last 24 hours'

      params do
        requires :timestamp
      end

      get :by_time do
        raise NotFoundError if Temperature.existed_timestamp?(params[:timestamp].to_i)

        temperature = Temperature.by_time(params[:timestamp])
        raise NotFoundError if temperature.nil?

        temperature.value
      end
    end
  end
end
