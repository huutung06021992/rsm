class EmailSent < ApplicationRecord
  belongs_to :apply_status, class_name: ApplyStatus.name, foreign_key: :type_id, optional: true
  belongs_to :user

  delegate :picture, :name, to: :user, prefix: true, allow_nil: true

  self.inheritance_column = nil

  validates :title, presence: true
  validates :content, presence: true
  validates :sender_email, presence: true
  validates :receiver_email, presence: true
  validates :type, presence: true
end