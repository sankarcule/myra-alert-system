class Alert < ApplicationRecord
  validates_presence_of :reference_id, :delay, :description
  validates_uniqueness_of :reference_id
end
