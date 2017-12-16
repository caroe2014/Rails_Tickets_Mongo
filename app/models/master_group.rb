class MasterGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :level, type: Integer
  field :status, type: Integer
  
  validates_presence_of :name
  
  has_many :company_groups, :dependent => :destroy
end
