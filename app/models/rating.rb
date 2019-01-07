class Rating < ApplicationRecord
  include Stars

  belongs_to :users, optional: true
  belongs_to :movies, optional: true

end
