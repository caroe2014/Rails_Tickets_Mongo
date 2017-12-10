json.extract! workflow_detail, :id, :company_id, :workflow_master_id, :next, :previous, :created_at, :updated_at
json.url workflow_detail_url(workflow_detail, format: :json)
