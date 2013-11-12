class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :user_id

  belongs_to(
  :contact_owner,
  class_name: 'User',
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(
  :contact_shares,
  class_name: 'ContactShare',
  foreign_key: :contact_id,
  primary_key: :id
  )

  has_many :contact_shared_by, :through => :contact_shares, source: :sharer

  validates(
    :email,
    :name,
    :user_id,
    presence: true
    )
end
