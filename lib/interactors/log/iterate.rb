# frozen_string_literal: true

require 'interactor'

require_relative '../row/process'

module Log
  # Log::Iterate
  class Iterate
    include Interactor

    def call
      context.db = []

      File.readlines(context.file).each do |line|
        result = Row::Process.call(db: context.db, row: line)
        if result.failure?
          context.fail!(error: result.error)
          break
        end
      end
    rescue Errno::ENOENT
      context.fail!(error: 'File not Found!')
    end
  end
end
