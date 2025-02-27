class User < ApplicationRecord
  has_one :hayato
  has_one :keisuke
  has_one :line_group
  has_one :bakusai
  has_one :google

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




         def update_progress(new_level)
          return if new_level <= progress_level # 進捗が戻らないようにする
          update(progress_level: new_level)
        end


        after_create :create_default_records

        private
      
        def create_default_records
          create_hayato!    # hayatoレコードを1つ作成（user_idを自動セット）
          create_keisuke!
          create_line_group!
          create_bakusai!
          create_google!
        end

end
