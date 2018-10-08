require "csv"

class ContactsJob < ApplicationJob
  queue_as :default

  def perform(text)
    CSV.parse(text, headers: true) do |row|
      ActionCable.server.broadcast "contacts", {id: row[0], first_name: row[1], last_name: row[2]}
      sleep(0.1)
    end

  end
end

