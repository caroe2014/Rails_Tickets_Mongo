class MasterMaterial
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :material_type, type: String
  field :width, type: Integer
  field :length, type: Integer
  field :units, type: String
  field :unit_cost, type: BigDecimal
  field :quantity, type: Integer
  field :quantity_cost, type: BigDecimal
  field :status, type: Integer
end
