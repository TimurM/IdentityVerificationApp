class CalculateDistance

  def initialize(user)
    @user = user
    process_request
  end

  def process_request
    nsa_data = NsaData.new(
                first_name: @user.first_name,
                last_name: @user.last_name
                )

    #retrieve data from the NSA API and finds the person's info
    phone_loc = phone_location(nsa_data)
    persons_loc = persons_location(nsa_data)

    #Converts IP address of the user to lat & long
    lat,long = generate_geo_coords

    #Calcualtes distance
    gen_phone_dist_from_ip(phone_loc, persons_loc, lat, long)
    gen_stated_dist_from_ip(persons_loc, phone_loc, lat, long)
    gen_stated_dist_from_phone(persons_loc, phone_loc)
    return @user
  end

  private

  def phone_location(nsa_data)
    nsa_data.retrive_person_data("phone_location")
  end

  def persons_location(nsa_data)
    nsa_data.retrive_person_data("stated_location")
  end

  def generate_geo_coords
    geo_response = Geocoding.new(ip_address: @user.ip_address)
    geo_response.convert_to_lat_and_long
  end

  def gen_phone_dist_from_ip(phone_loc, person_loc, lat, long)
    dist = GeoDistance.new(lat, long, phone_loc["latitude"],
                               phone_loc["longitude"]
                                    ).calculate_distance
    @user.phone_distance_from_ip = dist
  end

  def gen_stated_dist_from_ip(phone_loc, persons_loc, lat, long)
    dist = GeoDistance.new(lat, long, persons_loc["latitude"],
                                      persons_loc["longitude"]
                                      ).calculate_distance

    @user.stated_distance_from_ip = dist
  end

  def gen_stated_dist_from_phone(persons_loc, phone_loc)
    puts "printing persons location"
    puts persons_loc
    dist = GeoDistance.new(persons_loc["latitude"],
                           persons_loc["longitude"],
                           phone_loc["latitude"],
                           phone_loc["longitude"]).calculate_distance
    @user.stated_distance_from_phone = dist
  end
end
