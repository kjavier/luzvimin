require 'yaml'
require 'luzvimin/version'

module Luzvimin
  PHILIPPINES = YAML.load_file(File.join(File.dirname(__FILE__), 'data', 'regions.yml')) || {}
    
  attr_reader :data

  class Region
    REGIONS = PHILIPPINES.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] } 
    methods = ['code', 'name', 'position']
   
    methods.each do |method|
      define_method(method) do
        @data[method] if @data
      end
    end

    def initialize(region)
      @data = PHILIPPINES[region] if region.is_a?(String) 
    end

    class << self
      def all
        REGIONS      
      end

      def select_regions
        REGIONS.map{|s| [s[1]['name'],s[0]]}
      end
    end
  end

  class << self
    def regions
      Region.all
    end

    def select_regions
      Region.select_regions
    end
  end
end
