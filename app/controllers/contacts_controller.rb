class ContactsController < ApplicationController

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def index
    render :json => Contact.all
  end

end
