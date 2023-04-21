require "time_error" 


RSpec.describe TimeError do
    it "Returns difference in seconds between server time and the time on this computer" do
       fake_requester = double :requester
      
       allow(fake_requester).to receive(:get)
        .with(URI("https://worldtimeapi.org/api/ip"))
        .and_return('{"abbreviation":"BST","client_ip":"92.4.167.178","datetime":"2023-04-21T07:37:24.041412+01:00","day_of_week":5,"day_of_year":111,"dst":true,"dst_from":"2023-03-26T01:00:00+00:00","dst_offset":3600,"dst_until":"2023-10-29T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1682059044,"utc_datetime":"2023-04-21T06:37:24.041412+00:00","utc_offset":"+01:00","week_number":16}')
      
      time = Time.new(2023, 4, 21, 7, 37, 24)
      time_error = TimeError.new(fake_requester)
      result = time_error.error(time)
      expect(result).to eq (0.041412)
    end
  end