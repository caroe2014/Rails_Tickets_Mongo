json.extract! printing_ticket, :id, :name, :description, :width, :height, :qty, :single, :double, :material, :location_id, :printer_id, :created_at, :updated_at
json.url printing_ticket_url(printing_ticket, format: :json)
