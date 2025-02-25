class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




         def update_progress(new_level)
          return if new_level <= progress_level # 進捗が戻らないようにする
          update(progress_level: new_level)
        end
end
