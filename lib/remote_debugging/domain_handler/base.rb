module RemoteDebugging::DomainHandler
  class Base

    def receive(message:)
      # overwrite in subclass if you don't plan to ignore received messages
    end
  end
end
