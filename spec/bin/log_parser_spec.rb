# frozen_string_literal: true

require_relative '../../bin/log_parser'

RSpec.describe '#parse' do
  context 'when file path nil' do
    let(:file_path) { nil }

    it 'prints error message' do
      expect(parse(file_path)).to eq('Please provide path to log file!')
    end
  end

  context 'when file path is from non existing file' do
    let(:file_path) { 'not_found.log' }

    it 'prints error message' do
      expect(parse(file_path)).to eq('File not Found!')
    end
  end

  context 'when file path is from file with invalid path' do
    let(:file_path) { 'spec/support/logs/invalid_path.log' }

    it 'prints error message' do
      expect(parse(file_path)).to eq('Wrong path format!')
    end
  end

  context 'when file path is from file with invalid visitor' do
    let(:file_path) { 'spec/support/logs/invalid_visitor.log' }

    it 'prints error message' do
      expect(parse(file_path)).to eq('Wrong visitor format!')
    end
  end

  context 'when file path is from valid log' do
    let(:file_path) { 'spec/support/logs/valid.log' }

    it 'prints correct data' do
      expect($stdout).to receive(:puts).with('=' * 100)
      expect($stdout).to receive(:puts).with('LIST OF WEBPAGES SORT DESC BY VIEW COUNT')
      expect($stdout).to receive(:puts).with('-' * 100)
      expect($stdout).to receive(:puts).with('/help_page/1 1 visits')
      expect($stdout).to receive(:puts).with('=' * 100)
      expect($stdout).to receive(:puts).with('LIST OF WEBPAGES SORT DESC BY UNIQUE VIEW COUNT')
      expect($stdout).to receive(:puts).with('-' * 100)
      expect($stdout).to receive(:puts).with('/help_page/1 1 unique views')
      parse(file_path)
    end
  end
end
