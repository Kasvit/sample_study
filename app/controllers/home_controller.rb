class HomeController < ApplicationController
  def index
    @messages = Message.order(created_at: "desc").joins(:user).limit(20)
    @messages = @messages.includes(:user)
    @message = Message.new
  end
end
