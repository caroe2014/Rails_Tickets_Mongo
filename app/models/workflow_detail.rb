class WorkflowDetail
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :company_id, type: String
  field :workflow_master_id, type: String
  field :currect_qty, type: Integer, default: 0
  field :next, type: String
  field :previous, type: String
  
  index({ company_id: 1, workflow_master_id: 1 }, { unique: true, name: "workflow_detail_index" })
end
