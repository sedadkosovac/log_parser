# frozen_string_literal: true

RSpec.describe Log::Present do
  subject do
    described_class.call(
      sort_by_unique_views: sort_by_unique_views,
      sort_by_views: sort_by_views
    )
  end

  describe '.call' do
    context 'when given valid context' do
      let(:sort_by_views) do
        [
          {
            unique_visitors: [1],
            views: 5,
            name: 'test'
          }
        ]
      end

      let(:sort_by_unique_views) do
        [
          {
            unique_visitors: [1, 2],
            views: 4,
            name: 'foo'
          }
        ]
      end

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'prints output' do
        expect($stdout).to receive(:puts).with('=' * 100)
        expect($stdout).to receive(:puts).with('LIST OF WEBPAGES SORT DESC BY VIEW COUNT')
        expect($stdout).to receive(:puts).with('-' * 100)
        expect($stdout).to receive(:puts)
          .with("#{sort_by_views[0][:name]} #{sort_by_views[0][:views]} visits")
        expect($stdout).to receive(:puts).with('=' * 100)
        expect($stdout).to receive(:puts).with('LIST OF WEBPAGES SORT DESC BY UNIQUE VIEW COUNT')
        expect($stdout).to receive(:puts).with('-' * 100)
        expect($stdout).to receive(:puts)
          .with(
            "#{sort_by_unique_views[0][:name]} #{sort_by_unique_views[0][:unique_visitors].count} unique views"
          )
        subject
      end
    end

    context 'when given invalid context' do
      let(:sort_by_views) {}
      let(:sort_by_unique_views) {}

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Presentation Failed!')
      end
    end
  end
end
