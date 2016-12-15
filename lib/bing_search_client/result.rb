module BingSearchClient
  class Result
    attr_reader :body, :expanded_url

    def initialize(body:)
      @body = body
      @expanded_url = nil
    end

    def self.build_from_array_response(raw_response:)
      raw_response.map do |result_json_response|
        new(body: result_json_response).tap do |result|
          result.expand_url!
        end
      end
    end

    # Instance method to get the real url insted of the url bing
    def expand_url!
      bing_url = URI(body['url'])
      parsed_query = CGI::parse(bing_url.query)
      @expanded_url = parsed_query['r'].first
    end
  end
end
