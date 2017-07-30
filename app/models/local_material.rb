class LocalMaterial
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :location_id, type: String
  field :name, type: String
  field :minimum, type: Integer
  field :maximum, type: Integer
  field :quantity, type: Integer
  field :status, type: Integer
  
  belongs_to :location
  belongs_to :printing_ticket
 
  index({ name: 1 }, { unique: true, name: "localmaterial_index" })
  scope :with_name, ->(name) { where(name: names[name]) }
end
