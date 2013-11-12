class User < ActiveRecord::Base
   attr_accessible :name, :email

   validates(
   :name,
   :email,
   presence: true)

   validates(
   :email,
   uniqueness: true)

   has_many(
   :contact_shares,
   class_name: 'ContactShare',
   foreign_key: :user_id,
   primary_key: :id
   )

   has_many(
   :contacts,
   class_name: 'Contact',
   foreign_key: :user_id,
   primary_key: :id
   )

   #lists the users we shared contacts with others
   has_many :users_we_shared_with, :through => :contact_shares, source: :shared_with

   #lists the users that shared contacts with me
   has_many :contacts_shared_to_us, :through => :contact_shares, source: :shared_contact


   def show_name
     self.name
   end


end
