require_relative '../data_source'

class TtcDataSource < DataSource

  base_uri 'webservices.nextbus.com/service'

  def initialize(agency = 'ttc')
    @options = { a: agency }
  end

  def get_predictions_for(stop_id = '10210', route = '511')
    @options.merge!({ 'command'  => 'predictions',
                      'stopId'   => stop_id,
                      'routeTag' => route })
    ttc = self.class.get('/publicXMLFeed', query: @options)


    predictions = ttc['body']['predictions']['direction']

    if predictions
      predictions     =predictions.collect { |x| x['prediction'] }.flatten
      predictions     = predictions.sort! { |a, b| a['epochTime'] <=> b['epochTime'] }
      prediction      = predictions.first
      minutes         = prediction['minutes']
      prediction_time = Time.at(prediction['epochTime'].to_f/1000).strftime('%I:%M%p')
      "#{route}: in #{minutes}M @ #{prediction_time}"
    else
      "#{route}: N/A"
    end
  end

  def get_data
    get_predictions_for(10210, 511)
  end
end