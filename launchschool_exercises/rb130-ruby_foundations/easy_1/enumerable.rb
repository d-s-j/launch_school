class Tree
  include Enumerable

  def each; end # yields successive members of the collection

  def <=>; end # #min, #max, and #sort rely on <=> operator
end