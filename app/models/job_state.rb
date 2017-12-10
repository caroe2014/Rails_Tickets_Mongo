class JobState
  include Mongoid::Document
  field :step_number, type: String
  field :name, type: String
  field :status, type: Integer
end
