# frozen_string_literal: true

RSpec.describe Log::Process do
  subject { described_class.call(file: file) }

  describe '.call' do
    context 'when given valid context' do
      let(:file) { 'spec/support/logs/valid.log' }

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context db' do
        expect(subject.db).to be_an_instance_of(Array)
      end

      it 'contains context file' do
        expect(subject.file).to eq(file)
      end
    end

    context 'when given invalid context' do
      let(:file) { 'spec/support/logs/invalid_path.log' }

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to be_an_instance_of(String)
      end
    end
  end
end
