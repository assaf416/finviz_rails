require 'httparty'
require 'mechanize'

class Finviz
  include HTTParty

  def initialize(username=nil, password=nil)
    @username = ENV['FINVIZ_USERNAME'] || username
    @password = ENV['FINVIZ_PASSWORD'] || password
    login(username, password) if username && password
    @auth = false
  end

  def screener(params)
    Screener.new(agent, @auth, params).run
  end

  private

  def login
    @auth = true
    Login.new(username, password, agent)
  end

  def agent
    @agent ||= Mechanize.new
  end
end
