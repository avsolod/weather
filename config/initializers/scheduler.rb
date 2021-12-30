require 'rufus-scheduler'
require 'rest-client'
require 'json'

scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  url = 'http://dataservice.accuweather.com/currentconditions/v1/294021/historical/24?apikey=qR3AleYPGu7HvQTA46B9bQetXvGd52A8'
  response = RestClient.get(url)
  JSON.parse(response).map do |response|
    Temperature.create!(
      value: response['Temperature']['Metric']['Value'].to_f,
      stamp: response['EpochTime'].to_i
    )
  end
end


