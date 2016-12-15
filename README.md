[![Build Status](https://travis-ci.org/leanbit/bing_search_client.svg?branch=master)](https://travis-ci.org/leanbit/bing_search_client)

# BingSearchClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bing_search_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bing_search_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bing_search_client

## Usage

Configure your account key, if you do not have one just visit [Microsoft Cognitive Service](https://www.microsoft.com/cognitive-services/en-us/subscriptions)

```ruby
   BingSearchClient.configure do |c|
     c.account_key = "123"
   end

   news_client = BingSearchClient::News.new(num_results: 10, params: {:mkt => 'it-IT'})
   news_client.search(q: "test")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Run the specs

```
$ rspec

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/leanbit/bing_search_client.

## TODO

Implement other services like Web, Image and Video search.
Just take a look at the BingSearchClient::News class, add one class for each service. 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

