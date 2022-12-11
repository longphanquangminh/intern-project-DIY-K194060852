class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_filter :authenticate_user!
  has_many :favorites
  has_many :applies
  has_many :histories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :cv, CvUploader
  def favorited_job?(job)
    self.favorites.exists?(job_id: job.id)
  end
end
