class FilterMapper
  def initialize(*params)
    @params = params.first
    @string = ""
  end

  def run
    mapper.each do |key, value|
      @string << "#{value}_#{@params[key]}" if @params[key]
    end
    @string
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
      current_volume: "sh_curvol"
    }
  end
end
