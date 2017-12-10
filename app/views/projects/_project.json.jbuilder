json.extract! project, :id, :name, :company_id, :nickname, :project_number, :status, :start_task, :end_task,:client, :phone, :estimate, :approved_budget, 
                       :accumulated_cost, :items_to_do, :start_project, :end_project, :register_status, :created_at, :updated_at 
                  
json.url project_url(project, format: :json)
