json.extract! local_material, :id, :company_id, :location_id, :name, :quantity, :status, :created_at, :updated_at
json.url local_material_url(local_material, format: :json)
