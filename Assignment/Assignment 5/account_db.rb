module Account_DB
    @@account_data = [
        { id: 2561, user_name: "anil123", name: "saving", balance: 1593.00 },
        { id: 2751, user_name: "mikky60", name: "current", balance: 1593.00 },
        { id: 1561, user_name: "dilip45", name: "current", balance: 1593.00 },
        { id: 1261, user_name: "mohit54", name: "saving", balance: 1593.00 }
    ]

    def find_by_name(user_name)
        user_account = @@account_data.select { |account_hash| account_hash[:user_name] == user_name }
        account = user_account.map { |account_hash| make_instance(account_hash) }
    end

    def find_by_id(id)
        account_hash = @@account_data.detect { |account_hash| account_hash[:id] == id }
        account_hash ? make_instance(account_hash) : nil
    end

    def make_instance(account_hash)
        new(account_hash[:id], account_hash[:user_name], account_hash[:name], account_hash[:balance])
    end

    def create(user_name, name, balance)
        id = new_account_number
        account_hash = { id: id, user_name: user_name, name: name, balance: balance}
        @@account_data << account_hash
        make_instance(account_hash)
    end

    def save_object(account)
        index = @@account_data.index { |account_hash| account_hash[:id] == account.id }
        @@account_data[index] = {
            id: account.id,
            user_account: account.user_name,
            name: account.name,
            balance: account.balance
        }
    end

    def new_account_number
        4.times.map { rand(0..9) }.join.to_i
    end
end