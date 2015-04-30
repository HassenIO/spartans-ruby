module Spartans

  class Error < StandardError
    attr_accessor :code
    attr_accessor :message

    ERRORS = {
      'NO_APP_ID' => 'Missing app_id. Use `Spartans.init` to init app_id.',
      'NO_API_KEY' => 'Missing api_key. Use `Spartans.init` to init api_key.',
      'NO_ITEM_ID' => 'Missing id parameter for item.'
    }

    def initialize(code, message)
      self.code = code
      self.message = message
      super("#{self.code}: #{self.message}")
    end

    def self.cause error_code
      raise self.new(error_code, ERRORS[error_code])
    end

  end

end
