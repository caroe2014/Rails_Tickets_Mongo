class WorkflowMaster
  include Mongoid::Document
  field :company_id, type: Integer
  field :name, type: String
  field :status, type: Integer
  
  index({ company_id: 1, name: 1 }, { unique: true, name: "workflow_master_index" })
end
