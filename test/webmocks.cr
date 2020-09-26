require "webmock"

def loadfile(filename : String)
  file = File.new("test/files/#{filename}.json")
  content = file.gets_to_end
  file.close

  return content
end

WebMock.stub(:get, "http://api.opencovid.ca/timeseries?stat=cases&loc=ON&date=25-09-2020").to_return(status: 200, body: %({"cases":[{"cases":497,"cumulative_cases":51031,"date_report":"25-09-2020","province":"Ontario"}]}))

WebMock.stub(:get, "http://api.opencovid.ca/timeseries?stat=cases&loc=3595&after=01-09-2020&before=25-09-2020").to_return(status: 200, body: loadfile("toronto-timeseries"))
