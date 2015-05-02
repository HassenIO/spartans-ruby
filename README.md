# Spartans

Spartans helps you suggest what your users love. Use this ruby gem to interact with Spartans API in a developper-friendly way.

## Installation

Add this line to your application's Gemfile:

    gem 'spartans'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spartans

## Usage

First, you have to init Spartans using your application credentials:

    require 'spartans'

    Spartans.init :app_id  => YOUR_APP_ID,
                  :api_key => YOUR_API_KEY

Then push an item to Spartans using `Spartans::Item.push` method:

    Spartans::Item.push { :id => ITEM_ID,
                          :name => ITEM_NAME,
                          :properties => ITEM_PROPERTIES
                        }

Only the `:id` parameter is required to uniquely identify the item. `:name` will be used in the Spartans application dashboard to help you identify an item with its name instead of a raw ID.

Finally, `:properties` parameter will be used when Spartans will look for relevant suggestions. That properties parameter will feed Spartans algorithm and create matches between your items.

This Spartans method returns the JSON output of the API in a Hash format.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Spartans/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
