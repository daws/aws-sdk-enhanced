module Aws
module EC2

  class Instance
    include Aws::Enhanced::TagHashable

    def running?
      state.name == 'running'
    rescue Aws::EC2::Errors::InvalidInstanceIDNotFound
      false
    end
  end

end
end
