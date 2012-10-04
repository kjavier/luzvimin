require 'yaml'
require 'luzvimin/version'

module Luzvimin
  PHILIPPINES = YAML.load_file(File.join(File.dirname(__FILE__), 'data', 'regions.yml')) || {}
  REGIONS = PHILIPPINES.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] } 
  METHODS = ['code', 'name', 'position']
    
  attr_reader :data

  class Region
    METHODS.each do |method|
      define_method(method) do
        @data[method] if @data
      end
    end

    def initialize(region)
      @data = PHILIPPINES[region] if region.is_a?(String)
    end
  end

  class << self
    def region(region)
      Region.new(region)
    end

    def regions
      REGIONS      
    end

    def select_regions
      REGIONS.map{|s| [s[1]['name'],s[0]]}
    end
  end
end
