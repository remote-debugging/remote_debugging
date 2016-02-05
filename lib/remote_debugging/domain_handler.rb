require_relative 'domain_handler/base'
require_relative 'domain_handler/combinator'
require_relative 'domain_handler/echo'
require_relative 'domain_handler/logging'

module RemoteDebugging
  ##
  # The remote debugging API has different domains -- each domain roughly represents a tab
  # in the chrome inspector. For a list of domains an commands in the remote debugging API version 1.1 see:
  # https://github.com/cyrus-and/chrome-remote-interface/blob/111bdfffcb019366ff1dd4028befbd896b8aec8f/lib/protocol.json
  module DomainHandler
  end
end
