#! /usr/bin/crystal

def concatenate(a)
  ax = a.map { |x| x.to_s }
  ax.join("").to_i
end

def threedigitseven(a)
  s = Set(Int32).new
  1.upto(3) do |d|
    a.permutations(d).each do |px|
      c = concatenate(px)
      if c >= 100 && c <= 999 && c % 2 == 0
        s.add(c)
      end
    end
  end
  s.to_a.sort
end

require "spec"
describe "threedigitseven" do
  it "test_ex1" do
    threedigitseven([2, 1, 3, 0]).should eq [102, 120, 130, 132, 210, 230, 302, 310, 312, 320]
  end
  it "test_ex2" do
    threedigitseven([2, 2, 8, 8, 2]).should eq [222, 228, 282, 288, 822, 828, 882]
  end
end
