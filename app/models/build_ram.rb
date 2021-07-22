class BuildRam < ApplicationRecord
  belongs_to :build
  belongs_to :ram

  accepts_nested_attributes_for :ram
end
