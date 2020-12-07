class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User', foreign_key: :user_id
      
  
  scope :past, -> { where('date < ?', Time.now).order('created_at DESC') }
  scope :upcoming, -> { where('date >= ?', Time.now).order('created_at DESC') }        
end
