require 'json'
require 'openssl'

module Cryptoruby
  class Blockchain
    class Block
      attr_reader :blockchain, :index, :previous_hash, :data, :timestamp, :hash, :difficult, :nonce
      def initialize(args)
        setup_args(args)
        @timestamp        = Time.now.to_i
        @difficult        = difficult
        @nonce            = 0
        mine
      end

      def digest_hash
        OpenSSL::Digest::SHA512.hexdigest "#{index}#{previous_hash}#{stringfied_data}#{timestamp.to_s}#{nonce}"
      end

      private

      def mine
        loop do
          @nonce  += 1
          @hash    = digest_hash
          break if @hash[0..@difficult] =~ /^0*$/
        end
      end

      def stringfied_data
        case @data
          when String
            @data
          when Hash
            @data.to_json
          when Array
            @data.to_json
          else
            raise 'Invalid Data'
        end
      end

      def setup_args(args)
        @index          = args[:index] || 0
        @previous_hash  = args[:previous_hash] || nil
        @data           = args[:data] || 'Genesis Block'
        @difficult      = args[:difficult] || 0
        @blockchain     = args[:blockchain]
      end
    end
  end
end