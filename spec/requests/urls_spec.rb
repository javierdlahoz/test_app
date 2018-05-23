require 'rails_helper'

describe UrlsController do

  context 'GET / #index' do
    before do
      build(:url)
    end

    it 'should return 200 and the list of urls' do
      get urls_path

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['urls']).not_to be nil
      expect(JSON.parse(response.body)['urls'].map{ |url| url['full_url'] }).to include 'http://example.com'
    end
  end

end