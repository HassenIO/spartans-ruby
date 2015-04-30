require "json"
require "curb"

require "Spartans/version"
require "Spartans/error"

module Spartans

  # Set configuration parameters with Spartans API
  #
  def self.init params
    @app_id = params[:app_id]
    @api_key = params[:api_key]
    @api_version = params[:api_version] || 'v1'
    @api_url = params[:api_url] || 'http://api.spartans-dev.co:3000'
    return
  end

  # Get list of pushed items from Spartans
  # Returns the hashed JSON of the API response
  #
  def self.get_items
    curl = init_curl 'items'
    curl.perform

    return hash_output(curl)
  end

  # Push an item to Spartans
  # Expects Hash parameters: :id(required), :name, :properties
  # Returns the hashed JSON of the API response
  #
  def self.push_item params
    Spartans::Error.cause('NO_ITEM_ID') if params[:id].nil?

    curl = init_curl 'items'
    curl.http_post(
      Curl::PostField.content('source_id', params[:id]),
      Curl::PostField.content('name', params[:name] || ''),
      Curl::PostField.content('properties', params[:properties].nil? ? {} : params[:properties].to_json)
    )
    curl.perform

    return hash_output(curl)
  end

private

  # Init curl with init parameters
  #
  def self.init_curl path
    Spartans::Error.cause('NO_APP_ID') if @app_id.nil?
    Spartans::Error.cause('NO_API_KEY') if @api_key.nil?

    curl = Curl::Easy.new("#{@api_url}/#{@api_version}/apps/#{@app_id}/#{path}")
    curl.http_auth_types = :basic
    curl.username = @app_id
    curl.password = @api_key

    return curl
  end

  # Get curl response body, JSONify it then Hashify it
  #
  def self.hash_output curl
    return JSON.parse(curl.body_str)
  end

end
