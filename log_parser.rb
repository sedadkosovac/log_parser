# frozen_string_literal: true

# !/usr/bin/env ruby

require_relative 'lib/interactors/log/process'

result = Log::Process.call(file: ARGV[0])

puts result.error unless result.success?
