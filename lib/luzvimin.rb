require 'yaml'
require 'luzvimin/version'

module Luzvimin
  PHILIPPINES = YAML.load_file(File.join(File.dirname(__FILE__), 'data', 'regions.yml')) || {}
  REGIONS = PHILIPPINES.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] }
  METHODS = ['code', 'name', 'position', 'id']

  attr_reader :data

  require 'luzvimin/region'
  require 'luzvimin/province'

  class << self
    def region(region)
      Region.new(region)
    end

    def regions
      REGIONS
    end

    def regions_options_for_select
      REGIONS.map {|s| [s[1]['name'],s[0]]}
    end

    def province(region, province)
      Province.new(region, province)
    end
  end
end
