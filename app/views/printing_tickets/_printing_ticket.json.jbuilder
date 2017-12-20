json.extract! printing_ticket, :id, :name, :subname, :description, :width, :height, :qty, :single, :double, :project_id, :job_state_id, :material_id, :equipment_id, :location_id, :created_at, :updated_at
json.url printing_ticket_url(printing_ticket, format: :json)
