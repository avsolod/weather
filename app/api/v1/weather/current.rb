# frozen_string_literal: true

module V1
  module Weather
    class Current < Grape::API
      desc 'Returns the current temperature'

      get :current do
        url = 'http://dataservice.accuweather.com/currentconditions/v1/294021?apikey=qR3AleYPGu7HvQTA46B9bQetXvGd52A8'
        response = RestClient.get(url)
        JSON.parse(response).first['Temperature']['Metric']['Value']
      end
    end
  end
end
