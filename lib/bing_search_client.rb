require 'json'
require "bing_search_client/version"
require "bing_search_client/client"
require "bing_search_client/result"
require "bing_search_client/news" 
#TODO implement client for Web, Image and Video search

module BingSearchClient
  # Class method to set up configuration parameters
  #
  # @example
  #   BingSearchClient.configure do |c|
  #     c.account_key = "123"
  #   end
  #
  def self.configure(&block)
    yield @config ||= Configuration.new
  end

  # Return configuration parameters
  #
  # @example
  #   BingSearchClient.config.api_key
  #
  def self.config
    @config
  end

  # Reset configuration parameters
  #
  # @example
  #   BingSearchClient.reset_config
  #
  def self.reset_config
    @config = nil
  end


  # Container for configuration parameters
  #
  class Configuration
    BASE_URL = "https://api.cognitive.microsoft.com/bing/v5.0".freeze

    attr_accessor :account_key, :base_url

    def base_url
      @base_url || BASE_URL
    end
  end

  # Exception raised for connection error
  #
  class BadResponse < Exception; end
end
