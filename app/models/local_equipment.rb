class LocalEquipment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :equipment_type, type: String
  field :status, type: Integer
  field :production_per_hour, type: BigDecimal, default: 0.0
  field :location_id, type: String
  
  belongs_to :location 
  has_many :printing_tickets
  
  def self.find_by_id(pid)
      find(pid)
  end
  
  index({ location_id: 1, name: 1 }, { name: "localequipment_index" }) 
end
