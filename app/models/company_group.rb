class CompanyGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :company_id, type: String
  field :user_id, type: String
  field :mastergroup_id, type: String
  field :status, type: Integer

  belongs_to :user
  belongs_to :company
  belongs_to :master_group

  validates_presence_of :company_id, :user_id, :mastergroup_id
  
  def self.search_by_user(cia, username)
      
       where(company_id: cia, user_id: username)
   
  end
  
  
end
