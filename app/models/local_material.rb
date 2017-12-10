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
  has_many :printing_tickets
 
  index({ location_id: 1, name: 1 }, { name: "localmaterial_index", unique: true })
  scope :with_name, ->(name) { where(name: names[name]) }
  
  def self.find_by_id(pid)
      find(pid)
  end
  
end
