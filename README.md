[![Gem Version](https://badge.fury.io/rb/cryptoruby.svg)](https://badge.fury.io/rb/cryptoruby)
[![Maintainability](https://api.codeclimate.com/v1/badges/bad219ce2847552d2d56/maintainability)](https://codeclimate.com/github/Hamdan85/cryptoruby/maintainability)
[![Dependency Status](https://gemnasium.com/badges/github.com/Hamdan85/cryptoruby.svg)](https://gemnasium.com/github.com/Hamdan85/cryptoruby)
[![Build Status](https://travis-ci.org/Hamdan85/cryptoruby.svg?branch=master)](https://travis-ci.org/Hamdan85/cryptoruby)

# Cryptoruby

How about to have your own blockchain? This gems allow your application to have it... 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptoruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptoruby

## Usage

In order to use this gem you'll need to initialize your block first:
 ````ruby
blockchain = Cryptoruby::Blockchain.new
````

This will create your blockchain and initiate with and empty first block. The Genesis one.

After that, all youll need to do is to add some blocks to it:
````ruby
data = {amount: 3000}
blockchain.add_block(data) # or
blockchain << data
````

You see... data can be anything. You can store strings, jsons, arrays, even base64 files.

Then, after adding blocks, you'll need to check if your chain is still valid right?
````ruby
blockchain.is_valid? # returns true or false
````
Try changing something in the blocks and validating again... this works man... for real!

Ah... almost forgot... you can set yours blockchain's difficult too... 
To do so, all you need to do is to change (or instantiate from the beginning) the difficult parameter
````ruby
blockchain = Cryptoruby::Blockchain.new(3) 
````
The difficult is default to 0, but you can set it for whatever you want. In this example, it was set to 3 zeroes in the start of the hash.

And, in the end, you'll be able to export everything. How About That?
```ruby
blockchain.export
```

## Full Usage

````ruby
blockchain = Cryptoruby::Blockchain.new(2) # Difficult of 2 initial zeros
#<Cryptoruby::Blockchain:0x007fcb340b5cc8 @blocks=[#<Cryptoruby::Blockchain::Block:0x007fcb340b57f0 @index=0, @previous_hash=nil, @data="Genesis Block", @difficult=2, @blockchain=#<Cryptoruby::Blockchain:0x007fcb340b5cc8 ...>, @timestamp=1513486966, @nonce=6995, @hash="000449121a75ece0e52adbc12cf60bde1f9fe3f7c627f1163c412d58cfc2a41fddcf275814fc8acdbf685b993b07fc3f8bb0d2664294af418a47198c5b7eb90f">], @index=0, @difficult=2>
blockchain << { name: 'last night', amount_in_cents: 35000 }
[#<Cryptoruby::Blockchain::Block:0x007fcb340b57f0 @index=0, @previous_hash=nil, @data="Genesis Block", @difficult=2, @blockchain=#<Cryptoruby::Blockchain:0x007fcb340b5cc8 @blocks=[...], @index=1, @difficult=2>, @timestamp=1513486966, @nonce=6995, @hash="000449121a75ece0e52adbc12cf60bde1f9fe3f7c627f1163c412d58cfc2a41fddcf275814fc8acdbf685b993b07fc3f8bb0d2664294af418a47198c5b7eb90f">, #<Cryptoruby::Blockchain::Block:0x007fcb358bf080 @index=1, @previous_hash="000449121a75ece0e52adbc12cf60bde1f9fe3f7c627f1163c412d58cfc2a41fddcf275814fc8acdbf685b993b07fc3f8bb0d2664294af418a47198c5b7eb90f", @data={:name=>"last night", :amount_in_cents=>35000}, @difficult=2, @blockchain=#<Cryptoruby::Blockchain:0x007fcb340b5cc8 @blocks=[...], @index=1, @difficult=2>, @timestamp=1513486969, @nonce=4565, @hash="0008767c32faa0bdf72229f1b3d5e55fe590ea7b9dc6791804a831ac4229e074ddc58b1ee9369d7af16d0e89f4f3627df626483a248b720337620f4c26d9e2e7">]
blockchain.export
{
    :difficult => 2,
       :blocks => [
        [0] {
                    :index => 0,
            :previous_hash => nil,
                     :data => "Genesis Block",
                :timestamp => 1513486966,
                     :hash => "000449121a75ece0e52adbc12cf60bde1f9fe3f7c627f1163c412d58cfc2a41fddcf275814fc8acdbf685b993b07fc3f8bb0d2664294af418a47198c5b7eb90f",
                :difficult => 2,
                    :nonce => 6995
        },
        [1] {
                    :index => 1,
            :previous_hash => "000449121a75ece0e52adbc12cf60bde1f9fe3f7c627f1163c412d58cfc2a41fddcf275814fc8acdbf685b993b07fc3f8bb0d2664294af418a47198c5b7eb90f",
                     :data => {
                           :name => "last night",
                :amount_in_cents => 35000
            },
                :timestamp => 1513486969,
                     :hash => "0008767c32faa0bdf72229f1b3d5e55fe590ea7b9dc6791804a831ac4229e074ddc58b1ee9369d7af16d0e89f4f3627df626483a248b720337620f4c26d9e2e7",
                :difficult => 2,
                    :nonce => 4565
        }
    ]
}
````

Hope you like it!!

## Development

It'll be awesome if you help me to get it better. After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hamdan85/cryptoruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cryptoruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hamdan85/cryptoruby/blob/master/CODE_OF_CONDUCT.md).
