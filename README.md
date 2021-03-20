# LoggerScript

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/logger_script`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logger_script'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install logger_script

## Usage

Setup: 

    $ bin/setup

For Show your logs in proper format and database level:

For Read From File:

    $ bin/run filename.log file

For Insert in Database:

    $ bin/run filename.log db

Result:

    #######################-Output For Result-##########################
	| URL |                       | Views |                            $
	/about/2                      90 Visits                            #
	/contact                      89 Visits                            #
	/index                        82 Visits                            #
	/about                        81 Visits                            #
	/help_page/1                  80 Visits                            #
	/home                         78 Visits                            #
	##############################-END-#################################
	#######################-Output For Uniq result-######################
	| URL |                       | Views |                            $
	/index                        23 Visits                            #
	/home                         23 Visits                            #
	/contact                      23 Visits                            #
	/help_page/1                  23 Visits                            #
	/about                        22 Visits                            #
	/about/2                      22 Visits                            #
	##############################-END-#################################


To Run console and create work with orm:

    $ bin/console
    
Example:

      WebserverLog.all #=> for all data from db
      WebserverLog.create(ip: "232.343.232.12", url: "/home") 

 For Now only postgres db are supported

## Potential Feature

for further feature you can use rack for create an interface and make live logger app for save input request to your web-app & sinatra freamwork for add DSL to your web-app

for this, add rack and sinatra to Gemfile:

    gem 'sinatra', '~> 2.1'
    gem 'rack', '~> 2.2', '>= 2.2.3'

## Model Usage
  
  Developers Can use Sequel Orm feature for easier use from logger 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amin-abbasiy/logger_script. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/logger_script/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LoggerScript project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/amin-abbasiy/logger_script/blob/master/CODE_OF_CONDUCT.md).
