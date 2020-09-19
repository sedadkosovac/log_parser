# frozen_string_literal: true

require_relative 'extract'
require_relative 'store'
require_relative 'validate'

module Row
  class Process
    include Interactor::Organizer

    organize Row::Extract, Row::Validate, Row::Store
  end
end
