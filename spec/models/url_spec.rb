require 'rails_helper'

describe Url, type: :model do
  it { is_expected.to be_mongoid_document }

  subject { Url.new(full_url: 'http://test.com') }

  it 'should generate short url when created' do
    subject.save

    expect(subject.counter).to eq 0
    expect(subject.short_url).not_to be nil
  end

  context '#full_short_url' do
    it 'should return a string containing the ui domain' do
      expect(subject.full_short_url).to include(Rails.application.config.ui_domain)
    end
  end
end