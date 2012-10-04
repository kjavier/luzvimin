require 'luzvimin'

describe Luzvimin do
  describe 'region' do
    context 'when valid' do
      region = Luzvimin.region('NCR')
      it { region.code.should == 'NCR' }
      it { region.name.should == 'National Capital Region' }
      it { region.position.should == 1 }
    end

    context 'when invalid' do
      region = Luzvimin.region('NONE')
      it { region.code.should == nil }
      it { region.name.should == nil } 
      it { region.position.should == nil }
    end
  end

  describe 'regions' do
    subject { Luzvimin.regions }
    it { should be_an(Array) }
    it { should have(17).regions }

    it { Luzvimin.regions.first.should be_an(Array) }
  end

  describe 'select_regions' do
    context 'all' do
      subject { Luzvimin.select_regions }
      it { should be_an(Array) }
      it { should have(17).items }
    end

    context 'first region' do
      subject { Luzvimin.select_regions.first }
      it { should be_an(Array) }
      it { should_not be_empty }
      it { should have(2).items }
    end
  end
end