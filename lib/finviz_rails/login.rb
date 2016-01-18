class Login
  def initialize(username, password, agent)
    @username = username
    @password = password
    @agent = agent
  end

  def run
    go_to_login_page
    form['email'] = @username
    form['password'] = @password
    form.submit
    @agent
  end

  private

  def go_to_login_page
    @agent.get("http://finviz.com/login.ashx")
  end

  def form
    @form ||= @agent.page.forms[1]
  end
end
