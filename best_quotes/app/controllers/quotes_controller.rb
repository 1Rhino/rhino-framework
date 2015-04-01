class QuotesController < Rhino::Controller

  def a_quote
    render :a_quote, hello: "Hello!"
  end

end
