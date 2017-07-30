class LocalEquipment
  include Mongoid::Document
  field :name, type: String
  field :equipment_type, type: String
  field :status, type: Integer
  field :location_id, type: String
  
  belongs_to :location
  belongs_to :printing_ticket
  
  index({ name: 1 }, { unique: true, name: "localequipment_index" }) 
end
