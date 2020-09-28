require "./local_converter"

module Opencovid
  class ProvincialCases
    include JSON::Serializable

    getter cases : Int32
    getter cumulative_cases : Int32

    @[JSON::Field(key: "date_report", converter: Time::LocalConverter)]
    getter date : Time

    getter province : String
  end
end
