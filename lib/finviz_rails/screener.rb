class Screener
  def initialize(agent, auth, *params)
    @agent = agent
    @auth = auth
    @params = params.first
    @stocks = []
  end

  def run
    @agent.get(url)
    set_pagination_count
    set_found_stock_count
    add_stocks_from_page(@agent.page.parser)
    if @pagination_count
      (2..@pagination_count).each do |page_num|
        break if max_stock_count && @stocks.count >= max_stock_count
        @agent.get url(page_num)
        add_stocks_from_page(@agent.page.parser)
      end
    end
    results
  end

  private

  def results
    {
      found_stock_count: @found_stock_count,
      returned_stock_count: @stocks.count,
      stocks: @stocks
    }
  end

  def set_found_stock_count
    @found_stock_count = begin
      text = @agent.page.parser.css('.count-text').text
      match = text.match /Total: (\d+)/
      match[1]
    end
  end

  def max_stock_count
    @params[:max_stock_count]
  end

  def set_pagination_count
    @pagination_count ||= begin
      pages = @agent.page.parser.css('a.screener-pages')
      pages.any? ? pages.last.text.to_i : nil
    end
  end

  def add_stocks_from_page(html)
    rows = html.css('#screener-content > table > tr:nth-child(4) tr')
    headers = rows.shift
    stocks = rows.map do |row|
      stock = {}
      row.css('td').each_with_index do |td, index|
        header = format_header(headers.css('td')[index].text)
        stock[header] = td.text
      end
      stock
    end
    @stocks.concat stocks
  end

  def format_header(header)
    header.gsub('.','').gsub('/','_').gsub(' ','').downcase
  end

  def url(page=nil)
    UrlFormatter.new(@auth, page, @params).run
  end
end
