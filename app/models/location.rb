class Location
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :name, type: String
  field :shortname, type: String
  field :contact_name, type: String
  field :phone, type: String
  field :address1, type: String
  field :address2, type: String
  
  index({ shortname: 1 }, { unique: true, name: "shortname_index" })
  
  belongs_to :company
  belongs_to :project
end
