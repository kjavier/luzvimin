require 'luzvimin'

describe Luzvimin::Region do
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
