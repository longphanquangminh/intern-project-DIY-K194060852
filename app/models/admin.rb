class Admin < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # before_filter :authenticate_admin!
    
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable, :confirmable
  end
  