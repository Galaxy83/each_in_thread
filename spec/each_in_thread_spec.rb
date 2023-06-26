require 'spec_helper'
require 'each_in_thread'
require 'thread/pool'

RSpec.describe Enumerable do
  describe '#each_in_thread' do
    let(:enumerable) { [1, 2, 3, 4, 5] }

    before do
      allow(Thread).to receive(:pool) do |concurrency|
        double('ThreadPool').tap do |pool|
          allow(pool).to receive(:process) do |&block|
            block.call
          end
          allow(pool).to receive(:shutdown)
        end
      end
    end

    it 'runs each item in a separate thread' do
      results = []

      enumerable.each_in_thread(concurrency: 2) do |item|
        results << item * 2
      end

      expect(results.sort).to eq(enumerable.map { |i| i * 2 }.sort)
    end

    it 'does not output progress by default' do
      expect {
        enumerable.each_in_thread(concurrency: 2) { |_| }
      }.not_to output.to_stdout
    end

    it 'outputs progress if verbose is true' do
      expect {
        enumerable.each_in_thread(concurrency: 2, verbose: true) { |_| }
      }.to output(/completed \d+ \/ \d+/).to_stdout
    end
  end
end
