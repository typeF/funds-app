class Stock < ApplicationRecord
  validates_presence_of :symbol, :function, :data
end
