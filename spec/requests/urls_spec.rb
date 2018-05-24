require 'rails_helper'

describe UrlsController do

  context 'GET / #index' do
    before do
      build(:url)
    end

    it 'should return 200 and the list of urls' do
      get urls_path

      expect(response).to have_http_status 200
      expect(JSON.parse(response.body)['urls']).not_to be nil
      expect(JSON.parse(response.body)['urls'].map{ |url| url['full_url'] }).to include 'http://example.com'
    end
  end

  context 'POST / #create' do
    let!(:params) {
      {url: {full_url: 'http://text.com'}}
    }

    it 'should return 200 and create the short_url when params are correct' do
      post urls_path, params: params

      expect(response).to have_http_status 200
      expect(JSON.parse(response.body)['short_url']).not_to be nil
    end

    it 'should raise an error when params are not correct' do
      expect{ post urls_path, params: {} }.to raise_error(ActionController::ParameterMissing)
    end

    it 'should return 422 when url is not a URL' do
      post urls_path, params: {url: {full_url: ''}}

      expect(response).to have_http_status 422
    end
  end

  context 'GET /shorturl #show' do
    let(:url) { create(:url, short_url: UrlShortener.generate_short_url) }

    it 'should return 200 and return the url object' do
      get url_path(url.short_url)

      expect(response).to have_http_status 200
      expect(JSON.parse(response.body)['full_url']).to eq url.full_url
      expect(JSON.parse(response.body)['short_url']).to eq url.short_url
    end

    it 'should return 404 when does not find the url' do
      get url_path(1234)

      expect(response).to have_http_status 404
    end
  end

end