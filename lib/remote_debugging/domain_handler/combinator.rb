module RemoteDebugging::DomainHandler
  class Combinator < Base
    attr_reader :handlers

    def initialize(*handlers)
      @handlers = handlers
    end

    def receive(message:)
      handlers.map do |handler|
        handler.receive message: message
      end.compact.reduce(&:merge)
    end
  end
end
