# frozen_string_literal: true

require "spec_helper"

RSpec.describe Combinatorics do
  subject(:solver) { described_class.new }

  describe "#factorial" do
    it "returns 1 for 0!" do
      expect(solver.factorial(0)).to eq(1)
    end

    it "returns 1 for 1!" do
      expect(solver.factorial(1)).to eq(1)
    end

    it "computes 5!" do
      expect(solver.factorial(5)).to eq(120)
    end

    it "computes 10!" do
      expect(solver.factorial(10)).to eq(3_628_800)
    end

    it "raises for negative input" do
      expect { solver.factorial(-1) }.to raise_error(ArgumentError)
    end
  end

  describe "#permutations" do
    it "computes P(5, 2)" do
      expect(solver.permutations(5, 2)).to eq(20)
    end

    it "computes P(4, 4)" do
      expect(solver.permutations(4, 4)).to eq(24)
    end

    it "computes P(n, 0) = 1" do
      expect(solver.permutations(5, 0)).to eq(1)
    end

    it "computes P(n, 1) = n" do
      expect(solver.permutations(7, 1)).to eq(7)
    end

    it "raises when r > n" do
      expect { solver.permutations(3, 5) }.to raise_error(ArgumentError)
    end
  end

  describe "#combinations" do
    it "computes C(5, 2)" do
      expect(solver.combinations(5, 2)).to eq(10)
    end

    it "computes C(10, 3)" do
      expect(solver.combinations(10, 3)).to eq(120)
    end

    it "computes C(n, 0) = 1" do
      expect(solver.combinations(5, 0)).to eq(1)
    end

    it "computes C(n, n) = 1" do
      expect(solver.combinations(5, 5)).to eq(1)
    end

    it "satisfies symmetry: C(n, r) = C(n, n-r)" do
      expect(solver.combinations(10, 3)).to eq(solver.combinations(10, 7))
    end

    it "raises when r > n" do
      expect { solver.combinations(3, 5) }.to raise_error(ArgumentError)
    end
  end

  describe "#combinations_with_repetition" do
    it "computes choosing 2 from 3 types" do
      expect(solver.combinations_with_repetition(3, 2)).to eq(6)
    end

    it "computes choosing 0 items" do
      expect(solver.combinations_with_repetition(5, 0)).to eq(1)
    end

    it "computes choosing 3 from 4 types" do
      expect(solver.combinations_with_repetition(4, 3)).to eq(20)
    end
  end

  describe "#derangements" do
    it "returns 1 for D(0)" do
      expect(solver.derangements(0)).to eq(1)
    end

    it "returns 0 for D(1)" do
      expect(solver.derangements(1)).to eq(0)
    end

    it "returns 1 for D(2)" do
      expect(solver.derangements(2)).to eq(1)
    end

    it "returns 2 for D(3)" do
      expect(solver.derangements(3)).to eq(2)
    end

    it "returns 44 for D(5)" do
      expect(solver.derangements(5)).to eq(44)
    end
  end

  describe "#stirling_second" do
    it "returns 1 for S(0, 0)" do
      expect(solver.stirling_second(0, 0)).to eq(1)
    end

    it "returns 0 for S(n, 0) when n > 0" do
      expect(solver.stirling_second(3, 0)).to eq(0)
    end

    it "returns 1 for S(n, 1)" do
      expect(solver.stirling_second(4, 1)).to eq(1)
    end

    it "returns 1 for S(n, n)" do
      expect(solver.stirling_second(5, 5)).to eq(1)
    end

    it "computes S(3, 2) = 3" do
      expect(solver.stirling_second(3, 2)).to eq(3)
    end

    it "computes S(4, 2) = 7" do
      expect(solver.stirling_second(4, 2)).to eq(7)
    end
  end

  describe "#catalan" do
    it "returns 1 for C(0)" do
      expect(solver.catalan(0)).to eq(1)
    end

    it "returns 1 for C(1)" do
      expect(solver.catalan(1)).to eq(1)
    end

    it "returns 5 for C(3)" do
      expect(solver.catalan(3)).to eq(5)
    end

    it "returns 42 for C(5)" do
      expect(solver.catalan(5)).to eq(42)
    end

    it "returns 14 for C(4)" do
      expect(solver.catalan(4)).to eq(14)
    end
  end

  describe "#pigeonhole_min_items" do
    it "computes minimum for 10 items in 3 containers" do
      expect(solver.pigeonhole_min_items(10, 3)).to eq(4)
    end

    it "returns 1 when items equal containers" do
      expect(solver.pigeonhole_min_items(7, 7)).to eq(1)
    end

    it "handles exact division" do
      expect(solver.pigeonhole_min_items(9, 3)).to eq(3)
    end

    it "handles 0 items" do
      expect(solver.pigeonhole_min_items(0, 5)).to eq(0)
    end

    it "raises when containers is 0" do
      expect { solver.pigeonhole_min_items(5, 0) }.to raise_error(ArgumentError)
    end
  end
end
