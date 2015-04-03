class QuotesController < Rhino::Controller

  def index
    all_quotes = FileModel.all
    render :index, all_quotes: all_quotes
  end

  def a_quote
    quote_1 = FileModel.find(1)
    render :a_quote, quote: quote_1
  end

end
