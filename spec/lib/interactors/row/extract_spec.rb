# frozen_string_literal: true

RSpec.describe Row::Extract do
  subject { described_class.call(db: [], row: line) }
  let(:line) { "#{path} #{visitor}/n" }

  describe '.call' do
    context 'when given valid context' do
      let(:path) { '/home/1' }
      let(:visitor) { '192.168.133.143' }

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context path' do
        expect(subject.path).to eq(path)
      end

      it 'contains context visitor' do
        expect(subject.visitor).to eq(visitor)
      end
    end

    context 'when given invalid context' do
      let(:line) { nil }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Row data split Failed!')
      end
    end
  end
end
