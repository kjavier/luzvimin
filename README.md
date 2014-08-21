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

To create options for a select tag for all regions:
  
    Luzvimin.regions_options_for_select

To get details about a region:

    region = Luzvimin.region('NCR')
    region.code is 'NCR'.
    region.name is 'National Capital Region'.

To get a region's provinces:

    region.provinces

To create options for select tag for a region's provinces:

    region.provinces_options_for_select

To get details about a province:

    province = region.province('METRO_MANILA')

    or

    province = Luzvimin.province('NCR', 'METRO_MANILA')

To get the cities of a province:

    cities = province.cities

To create options for select tag for a province's cities:

    province.cities_options_for_select

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
