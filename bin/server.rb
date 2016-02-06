#!/usr/bin/env ruby

require 'remote_debugging'
require 'remote_debugging/pry'

server = RemoteDebugging::Server.new port: 9223,
                                     fallback_handler: RemoteDebugging::DomainHandler::Echo.new,
                                     handler: {
                                       'console' => RemoteDebugging::DomainHandler::Combinator.new(
                                                       RemoteDebugging::DomainHandler::Logging.new(promt: 'CONSOLE: '),
                                                       RemoteDebugging::Pry::DomainHandler::Debugger.new
                                                     ),
                                       'debugger' => RemoteDebugging::DomainHandler::Combinator.new(
                                                       RemoteDebugging::DomainHandler::Logging.new(promt: 'DEBUGGER: '),
                                                       RemoteDebugging::Pry::DomainHandler::Debugger.new
                                                     ),
                                       'runtime' => RemoteDebugging::DomainHandler::Combinator.new(
                                                       RemoteDebugging::DomainHandler::Logging.new(promt: 'RUNTIME: '),
                                                       RemoteDebugging::Pry::DomainHandler::Debugger.new
                                                     )
                                     }
server.start
