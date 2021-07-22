class BuildGpu < ApplicationRecord
  belongs_to :build
  belongs_to :gpu

  accepts_nested_attributes_for :gpu
end
