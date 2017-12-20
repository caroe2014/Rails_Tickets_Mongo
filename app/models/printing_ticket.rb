class PrintingTicket
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  
  field :name, type: String
  field :subname, type: String
  field :description, type: String, default: " "
  field :width, type: BigDecimal, default: 0.0
  field :height, type: BigDecimal, default: 0.0
  field :qty, type: Integer, default: 0
  field :single, type: Boolean, default: false
  field :double, type: Boolean, default: false
  field :started, type: Date
  field :finished, type: Date
  field :material_id, type: String
  field :equipment_id, type: String
  field :location_id, type: String
  field :project_id, type: String
  field :job_state_id, type: String
  field :workflow_state, type: String
  field :workflow_detail_id, type: String
  
  index({ project_id: 1, name: 1 }, { unique: false, name: "ticketnumber_index" })
  
  belongs_to :project
  belongs_to :location 
  belongs_to :local_material
  belongs_to :local_equipment
  belongs_to :job_state
  
  def material_idc=(material)
    self.material_id = material
  end

  def equipment_idc=(equipo)
      self.equipment_id = equipo
  end
 
  def self.search_by_project(projectid)    
      where(project_id: projectid)      
  end
 
end
