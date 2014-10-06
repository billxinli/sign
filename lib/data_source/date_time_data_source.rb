require_relative './data_source'

class DateTimeDataSource < DataSource
  def get_data(options = {})
    options = {format: '%-l:%M@%-d'}.merge(options)

    format = options[:format]
    Time.now.strftime(format).to_s
  end
end
