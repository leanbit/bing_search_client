module BingSearchClient
  class News
    
    attr_reader :num_results, :params

    def initialize(num_results: 100, params: {})
      @num_results = num_results
      @params = params
    end

    def search(q:, offset: 0)
      query_string = 'q='
      query_portion = URI.encode_www_form_component('\'' + q + '\'')
      local_params = "&count=#{num_results}&offset=#{offset}"
      @params.each do |k,v|
        local_params << "&#{k.to_s}=#{v.to_s}"
      end
      full_address = [BingSearchClient.config.base_url, 'news/search'].join('/') + '?' + query_string + query_portion + local_params
      Client.new(url: full_address).get
    end
  end
end
