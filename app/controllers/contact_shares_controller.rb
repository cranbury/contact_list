class ContactSharesController < ApplicationController
  def create
    contact_share = ContactShare.new(params[:contact_share])
    if contact_share.save
      render :json => contact_share
    else
      render :json => contact_share.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    ContactShare.find_by_id(params[:id]).destroy
    head :ok
  end

end
