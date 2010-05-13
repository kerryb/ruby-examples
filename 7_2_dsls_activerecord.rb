# The ActiveRecord DSL from Rails. Note the declarative relationships and
# constraints (has_many etc), which are actually class methods.

class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :forum_subscriptions, :dependent => :destroy
  validates_presence_of :name
  validates_length_of :name, :in => 1..50, :if => Proc.new { |f| !f.name.blank? }
  validates_uniqueness_of :name
  validates_presence_of :description
  validates_length_of :description, :in => 1..255, :if => Proc.new { |f| !f.description.blank? }

  def subscribed? user
    ForumSubscription.find_by_forum_id_and_user_id(id, user.id)
  end

  def self.subscribed_to_all? user
    AllForumsSubscription.find_by_user_id(user.id)
  end

  def last_post_at
    topics.inject nil do |latest, topic|
      latest.nil? || topic.last_post_at > latest ? topic.last_post_at : latest
    end
  end
end
