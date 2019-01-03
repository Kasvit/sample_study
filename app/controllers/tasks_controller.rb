class TasksController < ApplicationController
  caches_page :caching_example

  def index
    
  end

  def own_cookie

  end

  def caching_example
    @users = User.all
    # @users = User.all_cached
    @items = Item.all
    # @items = Item.all_cached
    # @stats = Rails.cache.stats.first.last
  end

end
