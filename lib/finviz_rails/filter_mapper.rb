class FilterMapper
  def initialize(*params)
    @params = params.first
    @param_components = []
  end

  def run
    mapper.each do |key, value|
      @param_components << "#{value}_#{@params[key]}" if @params[key]
    end
    @param_components.join(",")
  end

  private

  def mapper
    {
      price_range: "sh_price",
      analyst_recommendation: "an_recom",
      volatility: "ta_volatility",
      average_volume: "sh_avgvol",
      pattern: "ta_pattern",
      country: "geo",
      current_volume: "sh_curvol",
      simple_moving_average_20_day: "ta_sma20",
      simple_moving_average_50_day: "ta_sma50",
      simple_moving_average_200_day: "ta_sma200"
    }
  end
end
