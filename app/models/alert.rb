class Alert < ApplicationRecord
  validates_presence_of :reference_id, :delay, :description
end
