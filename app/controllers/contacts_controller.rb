class ContactsController < ApplicationController
  def index
  end

  def create
    uploaded_file = params[:file]
    ContactsJob.perform_later(uploaded_file.read)
  end
end
