# frozen_string_literal: true

require_relative "each_in_thread/version"

require 'thread'
require 'thread/pool'

module Enumerable
  def each_in_thread(concurrency: 10, log_each: 1, verbose: false)
    pool      = Thread.pool(concurrency)
    mutex     = Mutex.new
    completed = 0

    each_with_index do |item, i|
      pool.process do
        begin
          yield item, i
        rescue => e
          puts "Exception in thread:"
          puts e.message
          puts e.backtrace if verbose
        end

        if verbose
          mutex.synchronize do
            print "completed #{completed += 1} / #{size}\r" if completed % log_each == 0
          end
        end
      end
    end

    pool.shutdown
  end
end
