# frozen_string_literal: true

require 'interactor'

module Row
  class Extract
    include Interactor

    def call
      context.visitor = data[1].delete('/n')
      context.path = data[0]
    rescue StandardError
      context.fail!(error: 'Row data split Failed!')
    end

    private

    def data
      context.row.split(' ')
    end
  end
end
