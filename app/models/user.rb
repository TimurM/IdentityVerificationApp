class User
  include ActiveAttr::Model

  attribute :first_name
  attribute :last_name
  attribute :ip_address
  attribute :phone_distance_from_ip
  attribute :stated_distance_from_ip
  attribute :stated_distance_from_phone

end
