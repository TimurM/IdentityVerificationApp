class GeoDistance

  def initialize(lat1, long1, lat2, long2)
    @lat1 = lat1
    @long1 = long1
    @lat2 = lat2
    @long2 = long2
  end

  def calculate_distance

    rad_per_deg = 0.017453293  #  PI/180

    rkm = 6371              # radius in kilometers...some algorithms use 6367

      dlon = @long2 - @long1
      dlat = @lat2 - @lat1

      dlon_rad = dlon * rad_per_deg
      dlat_rad = dlat * rad_per_deg

      lat1_rad = @lat1 * rad_per_deg
      lon1_rad = @long1 * rad_per_deg

      lat2_rad = @lat2 * rad_per_deg
      lon2_rad = @long2 * rad_per_deg

      a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
      c = 2 * Math.asin( Math.sqrt(a))


      dKm = rkm * c
  end
end
