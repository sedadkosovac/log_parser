# frozen_string_literal: true

require 'interactor'

require_relative 'iterate'
require_relative 'sort'
require_relative 'present'

module Log
  class Process
    include Interactor::Organizer

    organize Log::Iterate, Log::Sort, Log::Present
  end
end
