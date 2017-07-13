class MasterGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :level, type: Integer
  field :status, type: Integer
  
  has_many :company_groups, :dependent => :destroy
end
