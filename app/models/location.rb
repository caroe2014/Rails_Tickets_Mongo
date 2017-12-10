class Location
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :company_id, type: String
  field :name, type: String
  field :shortname, type: String
  field :contact_name, type: String
  field :phone, type: String
  field :address1, type: String
  field :address2, type: String
  
  index({ company_id: 1, shortname: 1 }, { unique: true, name: "shortname_index" })
  
  belongs_to :company
  belongs_to :project
  has_many :local_materials
  has_many :local_equipments
  has_many :printing_tickets
end
