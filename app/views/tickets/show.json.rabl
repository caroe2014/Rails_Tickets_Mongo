object @ticket

attributes :id, :name, :subname, :description, :width, :height, :qty, :single, :double, :project_id, :material_id, :equipment_id, :location_id, :created_at, :updated_at

child :job_state do
  attributes :color, :name
end

child :location do
  attributes :name
end

child :local_equipment do
  attributes :name
end

child :local_material do
  attributes :name
end    