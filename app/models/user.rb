class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_commit :flush_cache

  def flush_cache
  	Rails.cache.clear
  end

  def cached_membee_id
  	Rails.cache.fetch([self, "membee_id"]) { self.membee_id }
  end
end
