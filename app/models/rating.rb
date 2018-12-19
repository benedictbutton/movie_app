class Rating < ApplicationRecord
  belongs_to :users
  belongs_to :movies
end
