module RemoteDebugging::DomainHandler
  class Echo < Base
    def receive(message:)
      message
    end
  end
end
