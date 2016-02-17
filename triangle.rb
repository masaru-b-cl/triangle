module Result
  NOT_TRIANGLE = -1
  SCALENE_TRIANGLE = 0
  EQUILATERAL_TRIANGLE = 1
  ISOSCELES_TRIANGLE = 2
end

class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def validate
    if !isTriangle then
      return Result::NOT_TRIANGLE
    end
    if @a == @b && @b == @c then
      return Result::EQUILATERAL_TRIANGLE
    end
    if @a == @b || @b == @c || @c == @a then
      return Result::ISOSCELES_TRIANGLE
    end
    return Result::SCALENE_TRIANGLE
  end
  
  def self.message(result)
    if result == Result::NOT_TRIANGLE then
      return "三角形じゃないです＞＜"
    elsif result == Result::EQUILATERAL_TRIANGLE then
      return "正三角形ですね！"
    elsif result == Result::ISOSCELES_TRIANGLE then
      return "二等辺三角形ですね！"
    else
      return "不等辺三角形ですね！"
    end
  end
  
  private

    def isTriangle
      if (@a + @b) <= @c then
        return false
      end
      if (@b + @c) <= @a then
        return false
      end
      if (@c + @a) <= @b then
        return false
      end
      return true
    end
end

def main(args)
  if args.size != 3 then
    puts "arguments size is not 3."
    exit
  end
  triangle = Triangle.new(args[0], args[1], args[2])
  result = triangle.validate()
  puts Triangle.message(result)
end

unless ARGV[0].nil? then
  main(ARGV.join.split(",").map(&:to_i))
end
