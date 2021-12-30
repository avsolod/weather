# frozen_string_literal: true

module V1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'weather'

    namespace :weather do
      mount Weather::Current
      mount Weather::Historical
      mount Weather::ByTime
    end

    add_swagger_documentation api_version: 'v1',
      info: {
        title: 'Weather statistica V1 API',
        description: 'Documentation for version 1 API'
      }
  end
end
