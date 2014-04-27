require_relative '../data_source'

class TimeDataSource < DataSource
  def get_data
    Time.now.strftime('%-m/%-d %-l:%M').to_s
  end

  private
end