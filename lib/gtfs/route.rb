module GTFS
  class Route
    include GTFS::Model

    has_required_attrs :id, :either_name, :type
    has_optional_attrs :agency_id, :desc, :url, :color, :text_color, :short_name, :long_name
    attr_accessor *attrs

    column_prefix :route_

    # Prefer the short name, but either is acceptable according to spec
    def either_name
      return @short_name || @long_name
    end

    def self.parse_routes(data)
      return parse_models(data)
    end
  end
end
