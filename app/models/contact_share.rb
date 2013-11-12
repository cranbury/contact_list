class ContactShare < ActiveRecord::Base
  attr_accessible :contact_id, :user_id

  belongs_to(
  :sharer,
  class_name: 'User',
  foreign_key: :user_id,
  primary_key: :id
  )

  belongs_to(
  :shared_contact
  class_name: 'Contact',
  foreign_key: :contact_id,
  primary_key: :id
  )

  validates(
    :contact_id,
    :user_id,
    presence: true
    )
end
