require 'test_helper'
require "pp"

class FinvizRailsTest < ActiveSupport::TestCase
  test "non-auth screener get first page of data" do
    finviz = Finviz.new
    pp finviz.screener(
      pattern: "wedge",
      order: "-change",
      signal: "toplosers",
      max_stock_count: 20
    )
  end
end
