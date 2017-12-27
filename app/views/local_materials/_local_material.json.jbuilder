json.extract! local_material, :id, :company_id, :location_id, :name, :quantity, :production_cost, :status, :created_at, :updated_at
json.url local_material_url(local_material, format: :json)
