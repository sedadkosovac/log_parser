# frozen_string_literal: true

require 'interactor'

module Log
  class Present
    include Interactor

    def call
      puts '=' * 100
      views
      puts '=' * 100
      unique_views
    rescue StandardError
      context.fail!(error: 'Presentation Failed!')
    end

    private

    def unique_views
      puts 'LIST OF WEBPAGES SORT DESC BY UNIQUE VIEW COUNT'
      puts '-' * 100
      context.sort_by_unique_views.each do |webpage|
        puts "#{webpage[:name]} #{webpage[:unique_visitors].count} unique views"
      end
    end

    def views
      puts 'LIST OF WEBPAGES SORT DESC BY VIEW COUNT'
      puts '-' * 100
      context.sort_by_views.each do |webpage|
        puts "#{webpage[:name]} #{webpage[:views]} visits"
      end
    end
  end
end
