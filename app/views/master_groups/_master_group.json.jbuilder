json.extract! master_group, :id, :name, :level, :status, :created_at, :updated_at
json.url master_group_url(master_group, format: :json)
