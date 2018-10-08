class ProgressBarJob < ApplicationJob
  queue_as :default

  def perform
    number = 0
    puts number
    while number < 100
      sleep(0.1)
      number += 10
      puts number
      ActionCable.server.broadcast "status_bar", width: number 
    end

  end
end