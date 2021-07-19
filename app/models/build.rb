class Build < ApplicationRecord
  belongs_to :user
  belongs_to :cpus
  belongs_to :mobos
  belongs_to :psus
  belongs_to :cases
  belongs_to :cpu_fans
  belongs_to :hdds
  belongs_to :ssds
  has_many :build_gpus, dependent: :destroy
  has_many :gpus, through: :build_gpus
  has_many :build_rams, dependent: :destroy
  has_many :rams, through: :build_rams
  has_many :build_storages, dependent: :destroy
  has_many :storages, through: :build_storages
  has_many :build_case_fans, dependent: :destroy
  has_many :case_fans, through: :build_case_fans
  has_many :build_ssd, dependent: :destroy
  has_many :builds, through: :build_ssds
  has_many :build_hdds, dependent: :destroy
  has_many :builds, through: :build_hdds
end
