class NsaData

  def initialize(first_name: first_name, last_name: last_name)
    @first_name = first_name
    @last_name = last_name
    retrieve_nsa_data
  end

  def retrieve_nsa_data
    @res = HTTParty.get('https://gov.blockscore.com/api/people')
  end

  def retrive_person_data(key)
    @res.each do |person|
      return person[key] if name_equal?(person)
    end
  end

  private

  def name_equal?(person)
    if person['first_name'].downcase == @first_name.downcase && \
      person['last_name'].downcase == @last_name.downcase

      return true
    end
    false
  end
end
