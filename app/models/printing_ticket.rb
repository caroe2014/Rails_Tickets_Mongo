class PrintingTicket
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :width, type: String
  field :height, type: String
  field :qty, type: String
  field :single, type: String
  field :double, type: String
  field :material_id, type: String
  field :location_id, type: String
  field :printer_id, type: String
  field :project_id, type: String
  
  belongs_to :project
  belongs_to :location
end
