require "minitest/autorun"

require "/../src/provincial_cases.cr"
require "./webmocks.cr"

class ProvincialCasesTest < Minitest::Test
  def test_parses
    json = %({"cases":497,"cumulative_cases":51031,"date_report":"25-09-2020","province":"Ontario"})
    cases = Opencovid::ProvincialCases.from_json(json)
    assert_equal 497, cases.cases
    assert_equal 51031, cases.cumulative_cases
    assert_equal Time.local(2020, 9, 25, location: Time::Location.local), cases.date
    assert_equal "Ontario", cases.province
  end
end
