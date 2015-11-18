class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates_inclusion_of :sex, in: %w(M F)

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "CatRentalRequest",
    dependent: :destroy

  def age
    Time.now.to_date.year - birth_date.year
  end
end
