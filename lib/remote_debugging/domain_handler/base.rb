module RemoteDebugging
  module DomainHandler
    class Base

      def receive(message:)
        # overwrite in subclass if you don't plan to ignore received messages
      end

      private

      def respond(**params)
        Message.response **params
      end

      def empty_response(message)
        respond id: message.id, result: {}
      end
    end
  end
end
