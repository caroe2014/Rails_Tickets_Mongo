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

  index({ nickname: 1 }, { unique: true, name: "nickname_index" })

  belongs_to :company
  has_many :printing_tickets
  has_many :locations
    
end