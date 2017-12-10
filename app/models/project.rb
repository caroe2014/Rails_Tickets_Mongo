class Project
  include Mongoid::Document
  include Mongoid::Timestamps
#  include Mongoid::Paranoia

  field :name, type: String
  field :company_id, type: String
  field :nickname, type: String
  field :project_number, type: Integer, :default => 0
  field :status, type: Integer
  field :start_task, type: Date
  field :end_task, type: Date
  field :client, type: String
  field :phone, type: String, :default => "XXX-XXX-XXXX"
  field :estimate, type: BigDecimal
  field :approved_budget, type: BigDecimal, :default => 0.0
  field :accumulated_cost, type: BigDecimal, :default => 0.0
  field :items_to_do, type: Integer, :default => 0
  field :start_project, type: Date
  field :end_project, type: Date
  field :porcentage_done, type: BigDecimal, :default => 0.0
  field :register_status, type: Integer, :default => 0
  field :sign_off, type: String
  field :ship_date, type: String
  field :project_manager, type: String
  field :paperwork_rcvd_date, type: String 
  index({ company_id: 1, nickname: 1 }, { unique: true, name: "project_index" })

  belongs_to :company
  has_many :printing_tickets
  has_many :locations
 
  validates_presence_of :company_id, :name, :project_number, :nickname
 
 
  def self.search_by_nickname(cia, search)
     
     if search  
          where(company_id: cia, nickname: /^#{search}*/i)      
     end     
  end

  def self.search_by_name(cia, search)
     
     if search  
          where(company_id: cia, name: /#{search}*/i)      
     end     
  end

  def self.search_by_number(cia, search)
     
     if search     
          where(company_id: cia, project_number: "#{search}") 
     end     
  end
  
end