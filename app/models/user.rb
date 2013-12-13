class User < ActiveRecord::Base

  INACTIVITY_TIME = 30.minutes

  attr_accessible :latitude, :longitude, :name
  belongs_to :group

  def as_json(*args)
  	{id: id, name: name, latitude: latitude, longitude: longitude, status: status}
  end

  def status
    (updated_at > INACTIVITY_TIME.ago) ? :active : :inactive
  end

end
