require 'aws-sdk/enhanced/modules/tag_hashable'

RSpec.describe Aws::Enhanced::TagHashable do

  let(:tag_class) do
    Class.new do
      attr_reader :key, :value
      def initialize(key, value)
        @key = key
        @value = value
      end
    end
  end

  let(:test_class) do
    Class.new do
      include Aws::Enhanced::TagHashable
      attr_reader :tags
      def initialize(tag_class, *tags)
        @tags = tags.collect do |tag|
          if tag.is_a?(Array)
            tag = tag_class.new(*tag)
          end
          tag
        end
      end
    end
  end

  context 'test instance with tags' do

    let(:test_instance) { test_class.new(tag_class, ['foo', 'bar'], ['baz', 'qux']) }

    subject { test_instance }

    %w( foo baz ).each do |key|

      it %{should have "#{key}" in tag_hash} do
        expect(subject.tag_hash).to have_key(key)
      end

    end

    %w( bar qux asdf ).each do |key|

      it %{should not have "#{key}" in tag_hash} do
        expect(subject.tag_hash).not_to have_key(key)
      end

    end

  end

end
