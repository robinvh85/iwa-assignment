class Test < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :name, presence: true,
    length: { maximum: 50 }

  accepts_nested_attributes_for :questions, allow_destroy: true

  validate :validate_options

  def validate_options
    self.questions.each do |question|
      return if question.content.strip.empty?

      is_has_item = false
      is_has_correct_answer = false
      question.options.each do |option|
        unless option.marked_for_destruction?
          is_has_item = true
          is_has_correct_answer = true if option.is_correct
        end
      end

      errors.add(:question, "\"#{question.content}\" must has at least one Option") unless is_has_item
      errors.add(:question, "\"#{question.content}\" must has at least one Option is marked correct answer") if !is_has_correct_answer && is_has_item
    end

  end
end
