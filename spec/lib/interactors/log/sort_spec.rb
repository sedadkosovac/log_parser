# frozen_string_literal: true

RSpec.describe Log::Sort do
  subject { described_class.call(db: db) }

  describe '.call' do
    context 'when given valid context' do
      let(:db) do
        [
          {
            unique_visitors: [1],
            views: 5
          },
          {
            unique_visitors: [1, 2, 3],
            views: 3
          },
          {
            unique_visitors: [1, 2],
            views: 4
          }
        ]
      end

      let(:sort_by_views) do
        [
          {
            unique_visitors: [1],
            views: 5
          },
          {
            unique_visitors: [1, 2],
            views: 4
          },
          {
            unique_visitors: [1, 2, 3],
            views: 3
          }
        ]
      end

      let(:sort_by_unique_views) do
        [
          {
            unique_visitors: [1, 2, 3],
            views: 3
          },
          {
            unique_visitors: [1, 2],
            views: 4
          },
          {
            unique_visitors: [1],
            views: 5
          }
        ]
      end

      it 'succeeds' do
        expect(subject).to be_a_success
      end

      it 'contains context db' do
        expect(subject.db).to be_an_instance_of(Array)
      end

      it 'sorts by views' do
        expect(subject.sort_by_views).to eq(sort_by_views)
      end

      it 'sorts by unique views' do
        expect(subject.sort_by_unique_views).to eq(sort_by_unique_views)
      end
    end

    context 'when given invalid context' do
      let(:db) do
        [
          {
            unique: [1, 2, 3],
            v: 3
          },
          {
            views: 4
          }
        ]
      end

      it 'fails' do
        expect(subject).to be_a_failure
      end

      it 'provides a failure message' do
        expect(subject.error).to eq('Sort Failed!')
      end
    end
  end
end
