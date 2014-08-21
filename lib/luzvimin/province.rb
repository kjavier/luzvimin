require 'yaml'

module Luzvimin
  class Province
    HOME_DIR = File.expand_path("#{File.dirname(__FILE__)}/..")

    Luzvimin::METHODS.each do |method|
      define_method(method) do
        @data[method] if @data
      end
    end

    def initialize(region, province)
      provinces = begin
        YAML.load_file(File.join(HOME_DIR, 'data/provinces', "#{region}.yml")) || {}
      rescue => e
        {}
      end

      @data = provinces[province] if province.is_a?(String)
      @data['id'] = province if @data
    end

    def cities
      cities = begin
        YAML.load_file(File.join(HOME_DIR, 'data/cities', "#{self.id}.yml")) || {}
      rescue => e
        {}
      end

      cities.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] }
    end

    def cities_options_for_select
      cities.map {|s| [s[1]['name'],s[0]]}
    end
  end
end
