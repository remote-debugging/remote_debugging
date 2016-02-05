require 'websocket/eventmachine/server'

module RemoteDebugging
  class Server
    DEFAULT_DOMAIN_HANDLERS = {}
    DEFAULT_FALLBACK_HANDLER = DomainHandler::Combinator.new(
                                 DomainHandler::Echo.new,
                                 DomainHandler::Logging.new(promt: 'unhandled message: ')
                               )

    attr_reader :host, :port, :handler, :fallback_handler

    def initialize(host: DEFAULT_HOST,
                   port: DEFAULT_PORT,
                   handler: DEFAULT_DOMAIN_HANDLERS,
                   fallback_handler: DEFAULT_FALLBACK_HANDLER
                  )
      @host = host
      @port = port
      @handler = handler
      @fallback_handler = fallback_handler
    end

    def start
      EM.run do
        WebSocket::EventMachine::Server.start(:host => host, :port => port) do |ws|
          ws.onopen do
            #todo: remove this line, or have a decent logger or something
            puts "Client connected"
          end

          ws.onmessage do |content, type|
            message = Message.from_json content, type: type
            response = domain_handler_for(message.domain).receive(message: message).to_json
            ws.send(response, type: type)
          end

          ws.onclose do
            #todo: remove this line, or have a decent logger or something
            puts "Client disconnected"
          end
        end
      end
    end

    private

    def domain_handler_for(domain)
      sanitized_domain = domain.to_s.strip.downcase
      @handler.fetch sanitized_domain, @fallback_handler
    end

  end
end
