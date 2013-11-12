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
    render :json =>
      (User.find_by_id(paramd[:id]).contacts +
      User.find_by_id(paramd[:id]).contacts_shared_to_us)
  end

  def update
    contact = Contact.find_by_id(params[:id])
    contact.attributes = params[:contact]
    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    Contact.find_by_id(params[:id]).destroy
    head :ok
  end

  def show
    render :json => Contact.find_by_id(params[:id])
  end


end
