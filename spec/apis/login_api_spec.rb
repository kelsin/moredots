require 'rails_helper'

RSpec.describe "Login Api", :type => :api do
  before do
    header 'Accept', 'application/json+ember'
  end

  describe('/login') do
    it('should error if a redirect url is not given') do
      get('/login')

      expect(last_response).to_not be_ok
    end

    it('should error if a bad redirect url is given') do
      get('/login',
          { :redirect => 'bad url' },
          'CONTENT_TYPE' => 'application/json')

      expect(last_response).to_not be_ok
    end

    it('should error if a non-http/s redirect url is given') do
      get('/login',
          { :redirect => 'smtp://localhost' },
          'CONTENT_TYPE' => 'application/json')

      expect(last_response).to_not be_ok
    end

    it('should succeed if a http redirect url is given') do
      get('/login',
          { :redirect => 'http://localhost/?code=' },
          'CONTENT_TYPE' => 'application/json')

      expect(last_response).to be_ok
      expect(Login.count).to equal(1)

      expect(last_response.body).to have_json_path('method')
      expect(last_response.body).to have_json_path('href')
      expect(last_response.body).to include_json("http://example.org/auth/bnet?key=#{Login.first.key}".to_json)
    end

    it('should succeed if a https redirect url is given') do
      get('/login',
          { :redirect => 'https://localhost/?code=' },
          'CONTENT_TYPE' => 'application/json')

      expect(last_response).to be_ok
      expect(Login.count).to equal(1)

      expect(last_response.body).to have_json_path('method')
      expect(last_response.body).to have_json_path('href')
      expect(last_response.body).to include_json("http://example.org/auth/bnet?key=#{Login.first.key}".to_json)
    end
  end
end
