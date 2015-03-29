class QuotesController < Rhino::Controller
  def a_quote
    "There is nothing either good or bad. It's Cause and Effect" +
    "\n<pre>\n#{env}\n</pre>"
  end
end
