class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy
  has_many :test_results, dependent: :destroy

  validates :content, presence: true,
    length: { maximum: 50 }

  accepts_nested_attributes_for :options, allow_destroy: true
end
