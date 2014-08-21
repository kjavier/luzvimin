require 'yaml'

module Luzvimin
  class Region
    Luzvimin::METHODS.each do |method|
      define_method(method) do
        @data[method] if @data
      end
    end

    def initialize(region)
      @data = Luzvimin::PHILIPPINES[region] if region.is_a?(String)
      @data['id'] = region if @data
    end

    def province(province)
      Province.new(self.id, province)
    end

    def provinces
      provinces = begin
        YAML.load_file(File.join(File.dirname(__FILE__), 'data/provinces', "#{self.id}.yml")) || {}
      rescue => e
        {}
      end

      provinces.map { |k, v| [k, v] }.sort_by{ |k, v| v['position'] }
    end

    def provinces_options_for_select
      provinces.map {|s| [s[1]['name'],s[0]]}
    end
  end
end
