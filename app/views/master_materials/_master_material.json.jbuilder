json.extract! master_material, :id, :name, :description, :material_type, :width, :length, :units, :unit_cost, :quantity, :quantity_cost, :status, :created_at, :updated_at
json.url master_material_url(master_material, format: :json)
