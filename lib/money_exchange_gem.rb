require "money_exchange_gem/version"
require 'money_exchange_gem/exchange'

class Money
  include Comparable

  def <=>(other)
    @amount <=> other.exchange_to(@currency)
  end

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def to_s
    "#{format('%.2f', @amount)} #{@currency}"
  end

  def inspect
    "#<Money #{to_s}>"
  end

  class << self
    ["usd", "eur", "gbp"].each do |currency|
      define_method "from_#{currency}" do |amount|
        Money.new(amount, currency.upcase)
      end
    end
  end

  def self.exchange
    Exchange.new
  end

  def exchange_to(currency)
    Money.exchange.convert(self, currency)
  end

  def to_int
    @currency == "USD" ? @amount.to_int : exchange_to("USD").to_int
  end

  def method_missing(method, *arguments, &block)
    method.to_s =~ /^to_(.*)$/ && Exchange.currencies.include?($1.upcase) ? exchange_to($1.upcase) : super
  end

  def respond_to?(method)
    method.to_s =~ /^to_(.*)$/ && Exchange.currencies.include?($1.upcase) ? true : super
  end
end
