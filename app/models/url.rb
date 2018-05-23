class Url
  include Mongoid::Document
  include Mongoid::Timestamps

  field :full_url, type: String
  field :short_url, type: String
  field :counter, type: Integer, default: 0

  validates :short_url, uniqueness: true, allow_nil: true

  before_create :generate_short_url

  def full_short_url
    "#{Rails.application.config.ui_domain}/#{short_url}"
  end

  def as_json(options = {})
    serializable_hash(
      {
        methods: [:full_short_url],
        except: [:counter]
      }.merge(options)
    )
  end

  private

  def generate_short_url
    tmp_short_url = UrlShortener.generate_short_url
    while Url.where(short_url: tmp_short_url).count > 0 do
      tmp_short_url = UrlShortener.generate_short_url
    end
    self.short_url = tmp_short_url
  end

end