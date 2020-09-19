# frozen_string_literal: true

require 'set'

RSpec.describe Row::Store do
  subject { described_class.call(db: db, path: path, visitor: visitor) }

  describe '.call' do
    let(:path) { '/home/1' }
    let(:visitor) { '133.555.222.444' }

    context 'when given valid context for new page' do
      let(:db) { [] }
      let(:expected_db) { { name: path, unique_visitors: Set[visitor], views: 1 } }
      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context path' do
        expect(subject.path).to eq(path)
      end

      it 'contains context visitor' do
        expect(subject.visitor).to eq(visitor)
      end

      it 'contains context db' do
        expect(subject.db).to contain_exactly(expected_db)
      end
    end

    context 'when given valid context for existing page' do
      let(:db) { [{ name: path, unique_visitors: Set[visitor], views: 1 }] }
      let(:expected_db) { { name: path, unique_visitors: Set[visitor], views: 2 } }
      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context path' do
        expect(subject.path).to eq(path)
      end

      it 'contains context visitor' do
        expect(subject.visitor).to eq(visitor)
      end

      it 'contains context db' do
        expect(subject.db).to contain_exactly(expected_db)
      end
    end

    context 'when given invalid context' do
      let(:db) { nil }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Storage Failed!')
      end
    end
  end
end
