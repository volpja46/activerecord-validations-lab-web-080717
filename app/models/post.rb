class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :clickbait?

    def clickbait?
      phrases = ["Won't Believe", "Secret", "Top", "Guess"]
      phrases.each do |phrase|
        if self.title.to_s.include?(phrase)
          return true
        end
      end
      errors.add(:title, "no bait here!")
    end


  end



  #
  # Finally, add a custom validator to Post that ensures the title is sufficiently
  # clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
  # [number]", or "Guess", the validator should return false.
