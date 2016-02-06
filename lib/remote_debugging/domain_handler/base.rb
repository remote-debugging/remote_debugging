module RemoteDebugging::DomainHandler
  class Base

    def receive(message:)
      # overwrite in subclass if you don't plan to ignore received messages
    end

    private

    def respond(to_message:, with:)
      Message.response id: to_message.id,
                       result: with
    end

    def empty_response(message)
      respond to_message: message, with: {}
    end
  end
end
