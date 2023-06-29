# EachInThread
[![Gem Version](https://badge.fury.io/rb/each_in_thread.svg)](https://badge.fury.io/rb/each_in_thread)

The `each_in_thread` gem extends Ruby's Enumerable module to provide an easy way to iterate over collections with
concurrency. This means you can perform actions on each item in an array (or any other enumerable) in separate threads.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'each_in_thread'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install each_in_thread

## Usage

```ruby
require 'each_in_thread'
require 'net/http'

# Suppose we have an array of URLs we want to fetch.
urls = %w[http://example.com http://example.org http://example.net]

# We can fetch each URL in a separate thread like this:
urls.each_in_thread(concurrency: 5) do |url|
  response = Net::HTTP.get(URI(url))
  puts "Fetched #{url}: #{response.size} bytes"
end
```

The each_in_thread method takes an options hash, where you can specify the following:

- concurrency: The number of threads to use. Defaults to 10.
- log_each: The number of iterations between each progress output. Defaults to 1.
- verbose: Whether to output progress. Defaults to false.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Galaxy83/each_in_thread. This
project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code
of conduct.

## License

The gem is available as open source under the terms of the MIT License.
