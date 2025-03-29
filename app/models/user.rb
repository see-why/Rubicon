class User < ApplicationRecord
    normalizes :email, with: EmailNormalizer
    validates :email, presence: true, uniqueness: true
end