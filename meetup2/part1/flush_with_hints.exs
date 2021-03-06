#
# Write a function which flushes the mailbox of the current process and returns
# a list with the pending messages
#

defmodule Mailbox do

  def flush() do
    collect_messages([])
  end

  defp collect_messages(messages) do
    receive do
      msg -> collect_messages([msg | messages])
    after
      0 -> messages |> Enum.reverse
    end
  end

end


ExUnit.start

defmodule MailboxTest do
   use ExUnit.Case

  test "flush returns the messages in order" do
    send self, :a
    send self, {:b, :c}
    send self, [:d]
    assert [:a, {:b, :c}, [:d]] == Mailbox.flush()
  end

  # Uncomment this test case when the first test passes
  test "flush returns an empty list when the mailbox is empty" do
    assert [] == Mailbox.flush()
  end

end
