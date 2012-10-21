# Luzvimin

Luzvimin is a gem that lists all regions and provinces in the Philippines

## Installation

Add this line to your application's Gemfile:

    gem 'luzvimin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luzvimin

## Usage

To list all regions:
  
    Luzvimin.regions

To create a select tag for all regions:
  
    Luzvimin.select_regions

To get details about a region:

    region = Luzvimin.region('NCR')
    region.code is 'NCR'.
    region.name is 'National Capital Region'.

To get a region's provinces:

    region.provinces

To create a select tag for all region's provinces:

    region.select_provinces

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
