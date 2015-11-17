class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates_inclusion_of :sex, in: %w(M F)
end
