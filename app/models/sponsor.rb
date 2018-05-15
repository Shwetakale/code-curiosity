class Sponsor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name           type: String
  field :start_date,    type: Date
  field :end_date,      type: Date
  field :budget,        type: Float
  field :is_individual, type: Boolean, default: false
  field :is_all_repos,	type: Boolean, default: false

  has_and_belongs_to_many :repositories

  validates :name, :start_date, :end_date, :budget, :is_all_repos, presence: true
end
