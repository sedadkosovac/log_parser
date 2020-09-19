# frozen_string_literal: true

require_relative '../../../lib/log_parser/version'

RSpec.describe LogParser::VERSION do
  it 'has a version number' do
    expect(LogParser::VERSION).not_to be nil
  end
end
