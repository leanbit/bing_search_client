module BingSearchClient
  class Client
    attr_reader :url

    def initialize(url:)
      @url = url
    end

    def get
      uri = URI(url)
      req = Net::HTTP::Get.new(uri.request_uri)
      req.add_field('Ocp-Apim-Subscription-Key', BingSearchClient.config.account_key)
      response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
      end
      parse_response(response)
    end

    private

      def parse_response(response)
        body = JSON.parse(response.body)
        if (200..299).include?(response.code.to_i)
          return { results: BingSearchClient::Result.build_from_array_response(raw_response: body['value']), extra: body.reject { |k| k != 'value' } }
        else
          raise BingSearchClient::BadResponse.new("#{response.status}: #{body}")
        end
      end
  end
end
