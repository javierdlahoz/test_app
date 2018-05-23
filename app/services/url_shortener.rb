class UrlShortener

  SHORT_URL_LENGTH = 6

  class << self
    def generate_short_url
      chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
      UrlShortener::SHORT_URL_LENGTH.times.map { chars.sample }.join
    end
  end

end