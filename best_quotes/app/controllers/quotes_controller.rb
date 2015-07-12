class QuotesController < ::Rhino::Controller

  def index
    all_quotes = Quotes.all
    render :index, all_quotes: all_quotes
  end

  def a_quote
    quote_1 = Quotes.find(1)
    user_agent = request.user_agent
    render :a_quote, quote: quote_1, user_agent: user_agent
  end

  def show
    quote = Quotes.find(params["id"])
    user_agent = request.user_agent
    render :a_quote, quote: quote, user_agent: user_agent
  end

end
