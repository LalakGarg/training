require './user_db.rb'

class User
    extend User_DB

    attr_accessor :user_name, :name, :age, :password
    
    def initialize(user_name, name, age, password)
        @user_name = user_name
        @name = name
        @age = age
        @password = password
    end
end