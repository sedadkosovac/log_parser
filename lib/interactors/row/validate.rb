# frozen_string_literal: true

require 'interactor'

module Row
  class Validate
    include Interactor

    def call
      valid_visitor
      valid_path
    end

    private

    def valid_visitor
      return if context.visitor =~ /^[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}$/

      context.fail!(error: 'Wrong visitor format!')
    end

    def valid_path
      return if context.path =~ %r{^/[.a-zA-Z0-9_/-]+$}

      context.fail!(error: 'Wrong path format!')
    end
  end
end
