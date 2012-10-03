require 'luzvimin'

describe Luzvimin::Region do
  describe 'all' do
    subject { Luzvimin::Region.all }
    it { should be_an(Array) }
    it { should have(17).regions }

    it { Luzvimin::Region.all.first.should be_an(Array) }
  end

  describe 'select_regions' do
    context 'all' do
      subject { Luzvimin::Region.select_regions }
      it { should be_an(Array) }
      it { should have(17).items }
    end

    context 'first region' do
      subject { Luzvimin::Region.select_regions.first }
      it { should be_an(Array) }
      it { should_not be_empty }
      it { should have(2).items }
    end
  end

  describe 'specific region' do
    context 'when valid' do
      region = Luzvimin::Region.new('NCR')
      it { region.code.should == 'NCR' }
      it { region.name.should == 'National Capital Region' }
      it { region.position.should == 1 }
    end

    context 'when invalid' do
      region = Luzvimin::Region.new('NONE')
      it { region.code.should == nil }
      it { region.name.should == nil } 
      it { region.position.should == nil }
    end
  end
end
