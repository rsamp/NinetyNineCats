class CatRentalRequest < ActiveRecord::Base

  STATUS = ['PENDING', 'APPROVED', 'DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates_inclusion_of :status, in: STATUS

  belongs_to :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "Cat"

  def overlapping_requests
    CatRentalRequest.find_by_sql "SELECT * FROM cat_rental_requests WHERE
    (start_date, end_date) OVERLAPS (DATE '#{self.start_date}', DATE '#{self.end_date}') AND id != #{self.id}
    AND cat_id = #{self.cat_id}"
  #   CatRentalRequest.all.where("(start_date BETWEEN to_date(#{self.start_date},
  #   AND #{self.end_date.strftime("%d-%m-%y")})
  #     OR (end_date BETWEEN #{self.start_date} AND #{self.end_date}) AND cat_id = #{self.cat_id}")
  # end
  end

  def overlapping_approved_requests
    CatRentalRequest.find_by_sql "SELECT * FROM cat_rental_requests WHERE
    (start_date, end_date) OVERLAPS (DATE '#{self.start_date}', DATE '#{self.end_date}') AND id != #{self.id}
    AND cat_id = #{self.cat_id} AND status = 'APPROVED'"
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = 'APPROVED' unless self.overlapping_approved_requests
      self.save!
      self.overlapping_requests.each {|request| request.deny!}
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end
end
