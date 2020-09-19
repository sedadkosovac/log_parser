# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative '../lib/interactors/log/process'

# Parse logs with paths and IPs and sorts them by views and unique views

def parse(file_path)
  return 'Please provide path to log file!' if file_path.nil?

  result = Log::Process.call(file: file_path)

  result.error if result.failure?
end

puts parse(ARGV[0]) if $PROGRAM_NAME == __FILE__
