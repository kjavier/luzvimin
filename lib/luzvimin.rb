require 'yaml'
require 'luzvimin/version'

module Luzvimin
  PHILIPPINES = YAML.load_file(File.join(File.dirname(__FILE__), 'data', 'regions.yml')) || {}
  REGIONS = PHILIPPINES.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] } 
  METHODS = ['code', 'name', 'position', 'id']
    
  attr_reader :data

  class Region
    METHODS.each do |method|
      define_method(method) do
        @data[method] if @data
      end
    end

    def initialize(region)
      @data = PHILIPPINES[region] if region.is_a?(String)
      @data['id'] = region if @data
    end

    def provinces
      provinces = YAML.load_file(File.join(File.dirname(__FILE__), 'data/provinces', "#{self.id}.yml")) || {}
      provinces.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] }  
    end 

    def provinces_options_for_select
      provinces.map {|s| [s[1]['name'],s[0]]}
    end 
  end

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
  end
end
