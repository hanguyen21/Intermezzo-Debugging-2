
require 'json'

class ActivitySuggester
  def initialize(requester) # requester is usually Net::HTTP
    @requester = requester
  end

  def suggest
    response = make_request_to_api
    return "Why not: #{response["activity"]}"
  end

  private

  def make_request_to_api
    # We use '@requester' rather than 'Net:HTTP'
    text_response = @requester.get(URI("https://www.boredapi.com/api/activity"))
    return JSON.parse(text_response)
  end
end