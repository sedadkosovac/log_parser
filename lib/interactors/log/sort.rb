# frozen_string_literal: true

require 'interactor'

module Log
  class Sort
    include Interactor

    def call
      sort_by_views
      sort_by_unique_views
    rescue StandardError
      context.fail!(error: 'Sort Failed!')
    end

    private

    def sort_by_unique_views
      context.sort_by_unique_views = context.db
                                            .sort_by { |path| path[:unique_visitors].count }.reverse!
    end

    def sort_by_views
      context.sort_by_views = context.db
                                     .sort_by { |path| path[:views] }.reverse!
    end
  end
end
