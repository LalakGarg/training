require './account_db.rb'

class Account
    extend Account_DB

    attr_accessor :id, :user_name, :name, :balance

    def initialize(id, user_name, name, balance)
        @id = id
        @user_name = user_name
        @name = name
        @balance = balance
    end

    def save
        Account.save_object(self)
    end

    def self.display_account(user_name)
        user_account = find_by_name(user_name)
    end
end