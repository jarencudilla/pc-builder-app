class Build < ApplicationRecord
  belongs_to :user
  belongs_to :cpus
  belongs_to :mobos
  belongs_to :psus
  belongs_to :cases
  belongs_to :cpu_fans

  has_many :build_gpus, dependent: :destroy
  has_many :gpus, through: :build_gpus
  has_many :build_rams, dependent: :destroy
  has_many :rams, through: :build_rams
  has_many :build_case_fans, dependent: :destroy
  has_many :case_fans, through: :build_case_fans
  has_many :build_ssd, dependent: :destroy
  has_many :ssds, through: :build_ssds
  has_many :build_hdds, dependent: :destroy
  has_many :hdds, through: :build_hdds

  accepts_nested_attributes_for :gpus
  accepts_nested_attributes_for :rams
  accepts_nested_attributes_for :case_fans
  accepts_nested_attributes_for :ssds
  accepts_nested_attributes_for :hdds
end
