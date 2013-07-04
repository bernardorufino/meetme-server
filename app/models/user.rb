class User < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  belongs_to :group

  def as_json(*args)
  	{id: id, name: name, latitude: latitude, longitude: longitude}
  end

end
