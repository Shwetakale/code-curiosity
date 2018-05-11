class Sponsor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :start_date,    type: Date
  field :end_date,      type: Date
  field :budget,        type: Float
  field :is_individual, type: Boolean, default: false

  has_and_belongs_to_many :repositories

  validates :name, presence: true
end
