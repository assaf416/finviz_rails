require 'httparty'
require 'mechanize'

class Finviz
  include HTTParty

  attr_accessor :authenticated

  def initialize(username=nil, password=nil)
    @username = ENV['FINVIZ_USERNAME'] || username
    @password = ENV['FINVIZ_PASSWORD'] || password
    login if @username && @password
  end

  def screener(params)
    Screener.new(agent, @authenticated, params).run
  end

  private


  def login
    @authenticated = true
    Login.new(@username, @password, agent).run
  end

  def agent
    @agent ||= Mechanize.new
  end
end
