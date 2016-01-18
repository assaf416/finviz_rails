require 'test_helper'
require "pp"

class FinvizRailsTest < ActiveSupport::TestCase
  test "non-auth screener get first page of data" do
    finviz = Finviz.new
    pp finviz.screener(
      price_range: "2to3",
      analyst_recommendation: "strongbuy",
      average_volume: "o50",
      pattern: "wedgedown",
      is_active: true
    )
  end
end
