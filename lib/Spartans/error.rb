module Spartans

  class Error < StandardError
    attr_accessor :code
    attr_accessor :message

    def initialize(code, message)
      self.code = code
      self.message = message
      super("#{self.code}: #{self.message}")
    end
  end

end
