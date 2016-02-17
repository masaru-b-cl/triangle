require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  context '三辺のいずれかが0なら三角形とはみなさない' do
    specify { expect(Triangle.new(0, 1, 1).validate()).to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 0, 1).validate()).to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 1, 0).validate()).to eq Result::NOT_TRIANGLE }
  end
  
  context '一辺の長さが他の二辺を合わせた長さ以下は三角形とみなさない' do
    specify { expect(Triangle.new(2, 1, 1).validate()).to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 2, 1).validate()).to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 1, 2).validate()).to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 1, 1).validate()).not_to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(1, 2, 2).validate()).not_to eq Result::NOT_TRIANGLE }
    specify { expect(Triangle.new(2, 3, 4).validate()).not_to eq Result::NOT_TRIANGLE }
  end

  context 'すべての辺の長さが同じなら正三角形とみなす' do
    specify { expect(Triangle.new(1, 1, 1).validate()).to eq Result::EQUILATERAL_TRIANGLE }
  end 
  
  context '二辺の長さが同じなら二等辺三角形とみなす' do
    specify { expect(Triangle.new(2, 2, 1).validate()).to eq Result::ISOSCELES_TRIANGLE }
    specify { expect(Triangle.new(1, 2, 2).validate()).to eq Result::ISOSCELES_TRIANGLE }
    specify { expect(Triangle.new(2, 1, 2).validate()).to eq Result::ISOSCELES_TRIANGLE }
  end

  context 'すべての辺の長さが違うなら不等辺三角形とみなす' do
    specify { expect(Triangle.new(2, 3, 4).validate()).to eq Result::SCALENE_TRIANGLE }
  end 

  context '検証結果が' do 
    it '三角形でない場合' do 
      expect(Triangle.message(Result::NOT_TRIANGLE)).to eq "三角形じゃないです＞＜"
    end
    it '正三角形の場合' do 
      expect(Triangle.message(Result::EQUILATERAL_TRIANGLE)).to eq "正三角形ですね！"
    end
    it '二等辺三角形の場合' do 
      expect(Triangle.message(Result::ISOSCELES_TRIANGLE)).to eq "二等辺三角形ですね！"
    end
    it '不等辺三角形の場合' do 
      expect(Triangle.message(Result::SCALENE_TRIANGLE)).to eq "不等辺三角形ですね！"
    end
  end
end
