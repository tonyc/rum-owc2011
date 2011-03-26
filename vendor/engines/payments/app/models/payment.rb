class Payment < ActiveRecord::Base
  attr_accessor :transaction_amount
  
  acts_as_indexed :fields => [:transaction_id]

  belongs_to :recipient
  
  validates :transaction_id, :presence => true, :uniqueness => true

  def transaction_amount=(currency_and_amount)
    currency = parse(currency_and_amount).first
    if currency == 'USD'
      amount = parse(currency_and_amount).last.to_f
    else
      amount = currency.to_f
    end
    self.amount = amount unless amount == 0.0
  end

  def parse(currency_and_amount)
    @parsed ||= currency_and_amount.split
  end

end
