class Option < ApplicationRecord
  belongs_to :question
  has_many :test_results, dependent: :destroy

  validates :content, presence: true,
    length: { maximum: 50 }
end
