# frozen_string_literal: true

RSpec.describe Row::Validate do
  subject { described_class.call(path: path, visitor: visitor) }

  describe '.call' do
    context 'when given valid context' do
      let(:path) { '/home/1' }
      let(:visitor) { '192.168.133.143' }

      it 'succeeds' do
        expect(subject).to be_a_success
      end
    end

    context 'when visitor invalid' do
      let(:path) { '/home/1' }
      let(:visitor) { '192.1.1.1' }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Wrong visitor format!')
      end
    end

    context 'when path invalid' do
      let(:path) { 'home' }
      let(:visitor) { '192.168.133.143' }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Wrong path format!')
      end
    end
  end
end
