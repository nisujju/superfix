class Request < ActiveRecord::Base
  validates :request_type,  presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :phone, presence: true, length: { minimum: 10 }
  validates :day, presence: true
  validates :time, presence: true
end

