class Geocoding

  def initialize(ip_address: ip_address)
    @ip_address = ip_address
  end

  def convert_to_lat_and_long
    request_location
    lat = @res["latitude"]
    long = @res["longitude"]
    [lat, long]
  end

  private

  def request_location
    @res = HTTParty.get('http://freegeoip.net/json/' + "#{@ip_address}")
  end

end
