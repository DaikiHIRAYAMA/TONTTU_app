module SessionsHelper

    # 省略
  
    def current_user?(user)
      user == current_user
    end
  end