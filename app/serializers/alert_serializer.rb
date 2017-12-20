class AlertSerializer < ActiveModel::Serializer
  attributes :reference_id, :delay, :description
end
