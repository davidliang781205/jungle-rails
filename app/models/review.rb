class Review < ActiveRecord::Base
  validates_presence_of :product, :user
  validate :rating_description
  belongs_to :user
  belongs_to :product

  def rating_description
    if ((description == nil) && (rating == nil))
      errors.add(:must_have_either_rate_or_description)
    end
  end
end
