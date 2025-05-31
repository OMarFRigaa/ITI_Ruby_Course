require_relative 'logger'
require_relative 'bank'

class CBABank < Bank
  include Logger

  def initialize(users)
    @users = users
  end

  def process_transactions(transactions)
    list = transactions.map(&:to_s).join(", ")
    log_info("Processing Transactions #{list}...")

    transactions.each do |transaction|
      begin
        user = transaction.user
        value = transaction.value

        unless @users.include?(user)
          raise "#{user.name} not exist in the bank!!"
        end

        if user.balance + value < 0
          raise "Not enough balance"
        end

        user.balance += value
        log_info("#{transaction} succeeded")

        if user.balance == 0
          log_warning("#{user.name} has 0 balance")
        end

        yield :success, transaction
      rescue => e
        log_error("#{transaction} failed with message #{e.message}")
        yield :failure, transaction, e.message
      end
    end
  end
end
