class UrlFormatter
  def initialize(auth, page, params)
    @auth = auth
    @page = page
    @params = params
  end

  def run
    if @page
      stock_num = ((@page * 20) + 1) - 20
    else
      stock_num = 0
    end
    "#{url}&r=#{stock_num}"
  end

  private

  def url
    @url ||= [base_url, signal, filters, order, tickers].join("&")
  end

  def signal
    "s=#{@params[:signal]}"
  end

  def filters
    "f=#{FilterMapper.new(@params).run}"
  end

  def order
    "o=#{@params[:order]}"
  end

  def tickers
    "t=#{@params[:tickers].join(',')}"
  end

  def base_url
    "http://#{'elite.' if @auth}finviz.com/screener.ashx?v=111"
  end
end
