class Build < ApplicationRecord
  belongs_to :user
  belongs_to :cpu
  belongs_to :mobo
  belongs_to :psu
  belongs_to :case
  belongs_to :cpu_fan

  has_many :build_gpus, dependent: :destroy
  has_many :gpus, through: :build_gpus
  has_many :build_rams, dependent: :destroy
  has_many :rams, through: :build_rams
  has_many :build_case_fans, dependent: :destroy
  has_many :case_fans, through: :build_case_fans
  has_many :build_ssds, dependent: :destroy
  has_many :ssds, through: :build_ssds
  has_many :build_hdds, dependent: :destroy
  has_many :hdds, through: :build_hdds

  accepts_nested_attributes_for :build_gpus
  accepts_nested_attributes_for :build_rams
  accepts_nested_attributes_for :build_case_fans
  accepts_nested_attributes_for :build_ssds
  accepts_nested_attributes_for :build_hdds
end
