require 'rails_helper'

RSpec.describe "Index Api", :type => :api do
  describe('/') do
    it('should return env information') do
      get('/')

      expect(last_response).to be_ok
      expect(last_response.body).to have_json_path('env')
      expect(last_response.body).to have_json_path('api/login')
      expect(last_response.body).to have_json_path('sites/website')
      expect(last_response.body).to have_json_path('sites/docs')
    end
  end
end
