class Group < ActiveRecord::Base
  
  INACTIVITY_TIME = 8.hours

  def self.clean
    where("updated_at <= ?", INACTIVITY_TIME.ago).destroy_all
  end

  attr_accessible :password
  has_many :users, dependent: :destroy
  after_initialize :generate_password

  def as_json(*args)
    {updated_at: updated_at, users: users}
  end

  protected
  def generate_password
    return unless password.nil?
    begin
      self.password = random_password
    end until Group.where(password: password).empty?
    # Ensure stored groups have passwords
    save unless new_record?
  end

  def random_password
    # Instead of concatenating letters and numbers, doing this way
    # to have a balanced password of numbers and letters (same chance)
    vocabulary = ["abcdefghijklmnopqrstuvwxyz", "0123456789"]
    length = 4
    Array.new(length) do
      omega = vocabulary[rand(vocabulary.length)]
      omega[rand(omega.length)]
    end.join
  end

end
