require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs
(the `it` statements without blocks)!
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cheesecake", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "lots", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("egg")
      expect(dessert.ingredients).to include("egg")
    end
  end

  describe "#mix!" do
    # could't figure this out by myself
    it "shuffles the ingredient array" do
      INGREDIENTS = ["egg", "flour", "creamcheese", "sugar"]

      INGREDIENTS.each { |ingredient| dessert.add_ingredient(ingredient) }

      expect(dessert.ingredients).to eq(INGREDIENTS)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(INGREDIENTS)
      expect(dessert.ingredients.sort).to eq(INGREDIENTS.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(10) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ramsay the Great Baker")
      expect(dessert.serve).to eq("Chef Ramsay the Great Baker has made 5 cheesecakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
