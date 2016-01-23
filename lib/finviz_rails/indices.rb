class Indices
  def initialize(agent, auth, *params)
    @agent = agent
    @auth = auth
    @results = {}
  end

  def run
    @agent.get(url)
    matches.map do |match|
      indice = get_indice(match.first)
      percent_change = get_percent(match.first)
      @results[indice] = percent_change
    end
    @results
  end

  private

  def get_indice(string)
    string.match(/^"(.+?)"/)[1]
  end

  def get_percent(string)
    string.match(/change":(\d*\.?\d*)/)[1].to_f
  end

  def url
    "http://#{'elite.' if @auth}finviz.com/futures_charts.ashx?t=INDICES&p=d1"
  end

  def matches
    @agent.page.content.scan /{"label":(.+?),"sparkline"/
  end
end
