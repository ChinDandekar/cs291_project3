class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author

  validates :body, presence: true, length: { minimum: 10 }
  validate :no_banned_words

  def comment_count
    comments.size
  end

  def no_banned_words
    banned_words = [ "Trump", "Harris", "Walz", "Vance", "Donald", "Kamala", "Tim", "JD", "swing", "state", "election" ]  # Example banned words
    if banned_words.any? { |word| body&.include?(word) }
      errors.add(:body, ", the FEC has determined that you were trying to influence the election.")
    end
  end
end
