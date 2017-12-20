class JobState
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :step_number, type: String
  field :name, type: String
  field :color, type: String
  field :status, type: Integer
  
  has_many :printing_tickets

  validates_presence_of :name, :color, :status, :step_number
  
end
