class Review < ActiveRecord::Base
  validates_presence_of :product, :user
  validate :rating_description
  belongs_to :user
  belongs_to :product

  def rating_description
    if (description == "") && !(rating == nil)
      errors.add(:must_have_either_rate_or_description, "Must have either rate or description")
    end
  end
end
