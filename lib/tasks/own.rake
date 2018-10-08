namespace :own do

  desc "say hello"
  task :hello do
    puts 'Hello World!'
  end

  desc "Hello Igor"
  task :hello_igor do
    puts 'Hello Igor'
  end

  desc "Calculator"
  task :calculate do
    puts 1 + 2
  end

  desc "Users count"
  task users_count: :environment do
    count = User.all.count
    puts "Users count: #{count}"
  end

  desc "say goodbye"
  task :bye do
    say_bye
  end

  desc "all own tasks"
  task all: [:hello, :hello_igor, :calculate, :users_count, :bye]

  desc "result of the own tasks"
  task summ_all_tasks: %i[hello_igor calculate hello] do
    puts "result"
  end

  def say_bye
    puts "Goodbye!"
  end
end
