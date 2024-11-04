class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  validates :body, presence: true
  validate :no_banned_words
  private

  # Define the custom validation logic
  def no_banned_words
    banned_words = [ "Trump", "Harris", "Walz", "Vance", "Donald", "Kamala", "Tim", "JD", "swing", "state", "election" ]  # Example banned words
    if banned_words.any? { |word| body&.include?(word) }
      errors.add(:body, "The FEC has determined that you were trying to influence the election.")
    end
  end
end
