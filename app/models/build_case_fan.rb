class BuildCaseFan < ApplicationRecord
  belongs_to :build
  belongs_to :case_fan

  accepts_nested_attributes_for :case_fan
end
