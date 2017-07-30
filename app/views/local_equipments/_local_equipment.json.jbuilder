json.extract! local_equipment, :id, :name, :equipment_type, :status, :location_id, :created_at, :updated_at
json.url local_equipment_url(local_equipment, format: :json)
