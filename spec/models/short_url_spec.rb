require 'rails_helper'

describe ShortUrl, type: :model do
  it { is_expected.to be_mongoid_document }

  subject { ShortUrl.new(full_url: 'http://test.com') }

  it 'should generate short url when created' do
    subject.save

    expect(subject.counter).to eq 0
    expect(subject.short_url).not_to be nil
  end
end