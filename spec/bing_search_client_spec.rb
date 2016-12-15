require 'spec_helper'

describe BingSearchClient do
  it 'has a version number' do
    expect(BingSearchClient::VERSION).not_to be nil
  end

  it 'must configure with account_key' do
    BingSearchClient.configure do |tineye|
      tineye.account_key = "123"
    end
    expect(BingSearchClient.config.account_key).to eq "123"
    expect(BingSearchClient.config.base_url).to eq BingSearchClient::Configuration::BASE_URL
  end

  it 'must configure with api_key and base_url' do
    BingSearchClient.configure do |tineye|
      tineye.account_key = "123"
      tineye.base_url = "https://api.cognitive.microsoft.com/bing/v5.0"
    end
    expect(BingSearchClient.config.account_key).to eq "123"
    expect(BingSearchClient.config.base_url).to eq "https://api.cognitive.microsoft.com/bing/v5.0"
  end
end
