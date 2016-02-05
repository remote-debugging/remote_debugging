require_relative 'remote_debugging/version'
require_relative 'remote_debugging/domain_handler'
require_relative 'remote_debugging/message'
require_relative 'remote_debugging/server'

module RemoteDebugging
  DEFAULT_PORT = 9222
  DEFAULT_HOST = 'localhost'
end
