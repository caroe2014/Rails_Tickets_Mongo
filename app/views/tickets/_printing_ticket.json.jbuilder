json.extract! printing_ticket, :id, :name, :subname, :description, :width, :height, :qty, :single, :double, :project_id, :material_id, :equipment_id, :location_id, :created_at, :updated_at
json.job_state printing_ticket.job_state :name, :color

json.url printing_ticket_url(printing_ticket, format: :json)
