class Prototype < ActiveRecord::Base
  has_many :prototype_images, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :prototype_images, reject_if: proc { |attributes| attributes['image'].blank?}, allow_destroy: true

  def main_image
    if prototype_images.main.present?
      prototype_images.main[0].image
    end
  end
end