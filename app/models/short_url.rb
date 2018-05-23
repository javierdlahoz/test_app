class ShortUrl
  include Mongoid::Document
  include Mongoid::Timestamps

  field :full_url, type: String
  field :short_url, type: String
  field :counter, type: Integer, default: 0

  validates :short_url, uniqueness: true, allow_nil: true

  before_create :generate_short_url

  private

  def generate_short_url
    tmp_short_url = UrlShortener.generate_short_url
    while ShortUrl.where(short_url: tmp_short_url).count > 0 do
      tmp_short_url = UrlShortener.generate_short_url
    end
    self.short_url = tmp_short_url
  end

end