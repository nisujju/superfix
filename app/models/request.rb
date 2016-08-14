class Request < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :request_type,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    case_sensitive: false 
  validates :phone, presence: true, length: { minimum: 10 }
  validates :day, presence: true
  validates :time, presence: true
end

