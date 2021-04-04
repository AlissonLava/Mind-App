class Tag < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  has_many :tag_contents, dependent: :destroy
  has_many :contents, through: :tag_contents
end
