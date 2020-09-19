# frozen_string_literal: true

RSpec.describe Row::Process do
  subject { described_class.call(db: [], row: line) }

  describe '.call' do
    context 'when given valid context' do
      let(:line) { '/home/1 192.168.133.143/n' }

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context row' do
        expect(subject.row).to eq(line)
      end

      it 'contains context db' do
        expect(subject.db).to be_an_instance_of(Array)
      end
    end

    context 'when given invalid context' do
      let(:line) { 'home/1 192.168.1.1' }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to be_an_instance_of(String)
      end
    end
  end
end
