class ContactsController < ApplicationController

  before_filter :authenticate_user! , :except =>:home


  def index
    #@contacts=Contact.find_by_user_id(current_user.id)
    @contacts=Contact.find(:all, :conditions=> ["user_id=?",current_user.id])
  end

  def home

  end


  def new
    @contact = Contact.new
    render :partial => 'edit'
  end

  def create
    contact=Contact.new(params[:contact])
    contact.user_id=current_user.id
    if contact.save
      flash[:notice]="New Contact has been created sucessfully."
      redirect_to contacts_path
    end
  end

  def edit
    @contact=Contact.find(params[:id])
    render :partial => 'edit'
  end

  def show

    @contact=Contact.find(params[:id])
    render :partial => 'show'

  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:contact])
      flash[:notice]="Contact has been updated sucessfully."
      redirect_to contacts_path
    end
  end


  def delete_contact
    contact = Contact.find(params[:id])
    contact.destroy
    flash[:notice]="Contact has been deleted sucessfully."
    redirect_to contacts_path
  end

end
