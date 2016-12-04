describe 'Arithmetic' do
  describe 'addition' do
    it 'adds numbers' do
      (2 + 3).should eq(5)
    end

    it 'adds numbers commutatively' do
      (3 + 2).should eq(5)
    end
  end

  describe 'subtraction' do
    it 'subtracts numbers' do
      (3 - 2).should eq(1)
    end
  end
end
