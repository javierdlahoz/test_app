require 'rails_helper'

describe UrlShortener do

  context '#generate_short_url' do

    it 'should generate short url' do
      expect(described_class.generate_short_url).to be_a(String)
    end
  end
end