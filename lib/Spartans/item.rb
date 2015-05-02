module Spartans
  class Item

    # Get list of pushed items from Spartans
    # Returns the hashed JSON of the API response
    #
    def self.get_all
      curl = Spartans.init_curl 'items'
      curl.perform

      return Spartans.hash_output(curl)
    end

    # Push an item to Spartans
    # Expects Hash parameters: :id(required), :name, :properties
    # Returns the hashed JSON of the API response
    #
    def self.push params
      Spartans::Error.cause('NO_ITEM_ID') if params[:id].nil?

      curl = Spartans.init_curl 'items'
      curl.http_post(
        Curl::PostField.content('source_id', params[:id]),
        Curl::PostField.content('name', params[:name] || ''),
        Curl::PostField.content('properties', params[:properties].nil? ? {} : params[:properties].to_json)
      )
      curl.perform

      return Spartans.hash_output(curl)
    end

  end
end
