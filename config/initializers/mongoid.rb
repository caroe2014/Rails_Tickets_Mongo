# convert object key "_id" to "id" and remove "_id" from displayed attributes on mongoid documents when represented as JSON
module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      id = {id: attrs["_id"].to_s}
      attrs.delete("_id")
      id.merge(attrs)
    end
  end
end

# converts object ids from BSON type object id to plain old string
module BSON
  class ObjectId
    alias :to_json :to_s
    alias :as_json :to_s
  end
end



#module BSON
#  class ObjectId
#    def to_json(*args)
#      to_s.to_json
#    end

#    def as_json(*args)
#      to_s.as_json
#    end
#  end
#end