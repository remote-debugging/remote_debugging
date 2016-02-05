module RemoteDebugging::DomainHandler
  class Logging < Base
    attr_reader :promt

    def initialize(promt: 'received: ')
      @promt = promt
    end

    def receive(message:)
      #todo: have a decent logger or something
      puts promt.to_s + message.inspect
    end
  end
end
