require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    new_amount = @register.total_money
    assert_equal(previous_amount + 20, new_amount)
  end

  def test_change
    @transaction.amount_paid = 30
    change = @register.change(@transaction)
    assert_equal(10, change)
  end

  def test_give_receipt
    assert_output("You've paid $20.\n") { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new('30\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end

  # def test_prompt_for_payment
  #   input = StringIO.new('20\n')
  #   capture_io { @transaction.prompt_for_payment(input: input) }
  #   assert_equal(20, @transaction.amount_paid)
  # end
end