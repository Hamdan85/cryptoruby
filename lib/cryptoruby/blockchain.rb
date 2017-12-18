require 'cryptoruby/block'
require 'json'

module Cryptoruby
  class Blockchain
    attr_accessor :blocks, :difficult
    attr_reader :index

    def initialize(difficult = 0)
      @blocks     = []
      @index      = 0
      @difficult  = difficult
      generate_genesis_block
    end

    def add_block(data)
      @index += 1
      @blocks << Block.new(index: index, previous_hash: last_block.hash, data: data, difficult: @difficult, blockchain: self)
    end

    def <<(data)
      add_block(data)
    end

    def is_valid?
      blocks[1..-1].sort_by{|block| block.index }.each_with_index do |current_block, index|
        previous_block = blocks[index]

        if current_block.hash != current_block.digest_hash
          p 'Hash is different from digest'
          return false
        end

        if current_block.index != previous_block.index + 1
          p 'Index is not sequential'
          return false
        end
        if current_block.previous_hash != previous_block.hash
          p 'Previous hash doesnt match with the current one'
          return false
        end
      end
      return true
    end

    def export
      {
        difficult: difficult,
        blocks: blocks.map{ |block|
          {
            index: block.index,
            previous_hash: block.previous_hash,
            data: block.data,
            timestamp: block.timestamp,
            hash: block.hash,
            difficult: block.difficult,
            nonce: block.nonce
          }
        }
      }
    end

    def last_block
      @blocks.last
    end

    private

    def generate_genesis_block
      @blocks << Block.new(index: 0, blockchain: self, difficult: @difficult)
    end
  end
end