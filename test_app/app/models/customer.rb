class Customer < ApplicationRecord

  def fullname
    "Sr. #{name}"
  end
  

end
