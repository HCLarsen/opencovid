require "json"

struct Time::LocalConverter
  def self.from_json(value : JSON::PullParser) : Time
    Time.parse_local(value.read_string, "%d-%m-%Y")
  end

  def to_json(value : Time, json : JSON::Builder)
    format(value).to_json(json)
  end
end
