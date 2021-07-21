class BuildSsd < ApplicationRecord
  belongs_to :build
  belongs_to :ssd

  accepts_nested_attributes_for :ssd
end
