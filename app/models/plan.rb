class Plan < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users

  validates :size, numericality: true

  def attach(user)
    if user.join?(self)
      users.delete(user)
    else
      users << user
    end
    save
  end

  def print_detail
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, hard_wrap: true)
    markdown.render detail
  end

end
