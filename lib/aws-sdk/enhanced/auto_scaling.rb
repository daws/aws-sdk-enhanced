module Aws
module AutoScaling

  class Group

    include Aws::Enhanced::TagHashable

    def initialize(name, options = {})
      options = {
        client: Aws::AutoScaling::Client.new
      }.merge(options)

      @client = options[:client]
      response = @client.describe_auto_scaling_groups(auto_scaling_group_names: [ name ])
      @group = response.auto_scaling_groups.first
    end

    def exists?
      !@group.nil?
    end

    def respond_to?(sym, include_all = false)
      has_method?(sym) || super(sym, include_all)
    end

    def method_missing(sym, *args, &block)
      if has_method?(sym)
        @group.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    private

    def has_method?(m)
      exists? && @group.respond_to?(m)
    end

  end

end
end
