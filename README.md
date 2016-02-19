# RemoteDebugging

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/remote_debugging`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remote_debugging'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remote_debugging

## Usage

Start ruby-debugging server:

    $ bundle exec bin/server

Start chrome with and give him a separate user data dir to make it possible to run another instance of chrome:

    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=<ENTER_NEW_PROFILE_PATH_HERE> --remote-debugging-port=9222

Then open the following URL in chrome:

    http://localhost:9222/devtools/inspector.html?ws=localhost:9223

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/remote_debugging. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

