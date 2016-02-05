#!/usr/bin/env ruby

require_relative '../lib/remote_debugging'

server = RemoteDebugging::Server.new(port: 9223)
server.start
