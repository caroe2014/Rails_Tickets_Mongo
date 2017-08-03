class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String, default: "Company Testing LLC" 
  field :nickname, type: String, default: "comptest"
  field :phone, type: String, default: "555-444-1234"
  field :webpage, type: String, default: "www.company.testing.com"
  field :contact, type: String, default: "Mami Caro"
  field :address1, type: String, default: "1234 Nothing St"
  field :address2, type: String, default: ""
  field :city, type: String, default: "Caracas"
  field :state, type: String, default: "DF"
  field :country, type: String, default: "VZL"
  field :tokenId, type: String
  field :verified, type: Integer, default: 0
  field :status, type: Integer, default: 0
  
  has_many :projects, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  has_many :projects
  has_many :company_groups, :dependent => :destroy
#  has_many :users, through: :company_groups 
   
  validates_presence_of :name, :phone
    
end
