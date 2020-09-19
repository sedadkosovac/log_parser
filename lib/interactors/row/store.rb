# frozen_string_literal: true

require 'set'
require 'interactor'

module Row
  class Store
    include Interactor

    def call
      if path
        increase_view_count
        update_visitor_list
      else
        context.db << new_path
      end
    rescue StandardError
      context.fail!(error: 'Storage Failed!')
    end

    private

    def path
      @path ||= context.db
                       .detect { |w| w[:name] == context.path }
    end

    def new_path
      { name: context.path, unique_visitors: Set[context.visitor], views: 1 }
    end

    def increase_view_count
      path[:views] = path[:views].next
    end

    def update_visitor_list
      path[:unique_visitors] << context.visitor
    end
  end
end
