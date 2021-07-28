class BuildHdd < ApplicationRecord
  belongs_to :build
  belongs_to :hdd

  accepts_nested_attributes_for :hdd
end
