class Bnet
  include HTTParty
  base_uri 'https://us.api.battle.net'

  # Loads the list of wow characters given a user's oauth access token
  def characters(access_token)
    response = self.class.get('/wow/user/characters',
                              :headers => {
                                'Authorization' => "Bearer #{access_token}"
                              })

    response['characters'] || []
  end

  # Loads a character from the wow api
  def character(name, realm)
    self.class.get("/wow/character/#{CGI::escape realm}/#{CGI::escape name}",
                   :query => {
                     'fields' => 'items',
                     'apikey' => ENV['BNET_KEY']
                   })
  end

  # Loads a character's ilvl from the wow api
  def ilvl(name, realm)
    character(name, realm).try(:[], 'items').try(:[], 'averageItemLevel')
  end
end
