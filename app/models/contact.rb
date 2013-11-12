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

  has_many :contact_shared_with, :through => :contact_shares, source: :shared_with

  validates(
    :email,
    :name,
    :user_id,
    presence: true
    )


    def self.contacts_for_user_id(user_id)
      Contact.find_by_sql "SELECT * FROM contacts LEFT OUTER JOIN contact_shares
      ON contacts.id = (contact_shares.contact_id) WHERE contact_shares.user_id = #{user_id}
      OR contacts.user_id = #{user_id}"
    end
end
