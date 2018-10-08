require 'rubygems'
require 'factory_bot'

I18n.locale = :en

User.destroy_all

10.times { FactoryBot.create(:user) }