module Aws
module Enhanced

module TagHashable
  def tag_hash
    @_tag_hash ||= begin
      result = {}
      self.tags.each do |tag|
        result[tag.key] = tag.value
      end
      result
    end
  end
end

end
end
