require 'spec_helper'

describe BingSearchClient::News  do
  before(:each) do
    BingSearchClient.configure do |bsc|
      bsc.account_key = "6mm60lsCNIB,FwOWjJqA80QZHh9BMwc-ber4u"
    end
  end

  subject(:news_client) { BingSearchClient::News.new  }

  context 'search' do

    before(:each) do 
      search_url = [BingSearchClient.config.base_url, 'news/search'].join('/')
      stub_request(:get, /#{search_url}.*/).
        to_return(body: File.read('spec/support/news_search.json'))
    end
    
    it 'must hit the search endpoint' do
      response = news_client.search(q: 'issf')
      expect(response).to be_a Hash
      expect(response).to have_key(:results)
      expect(response).to have_key(:extra)
      expect(response[:results].count).to eq 6
    end

    it 'must expand url on result' do 
      response = news_client.search(q: 'issf')
      first_result = response[:results].first
      puts first_result
      expect(first_result.expanded_url).to eq 'http://www.meteoweb.eu/2016/12/ambiente-thai-union-si-impegna-un-tonno-100-sostenibile/807648/'
    end
  end
end