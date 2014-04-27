require_relative '../data_source'

class TimeDataSource < DataSource
  def get_data
    Time.now.strftime('%-l:%M@%-d').to_s
  end

  private
end