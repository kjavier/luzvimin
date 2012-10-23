require 'luzvimin'

describe Luzvimin::Region do
  let(:region) { Luzvimin::Region.new('NCR') }
  let(:invalid_region) { Luzvimin::Region.new('NONE') }

  describe 'specific region' do
    context 'when valid' do
      it { region.id.should == 'NCR' }
      it { region.code.should == 'NCR' }
      it { region.name.should == 'National Capital Region' }
      it { region.position.should == 1 }
    end

    context 'when invalid' do
      it { invalid_region.id.should == nil }
      it { invalid_region.code.should == nil }
      it { invalid_region.name.should == nil } 
      it { invalid_region.position.should == nil }
    end
  end

  describe 'provinces' do
    context 'when valid' do
      subject { region.provinces }
      it { should be_an(Array) }
      it { should have(1).provinces }

      it { region.provinces.first.should be_an(Array) }
    end
  end

  describe 'provinces_options_for_select' do
    context 'all' do
      subject { region.provinces_options_for_select }
      it { should be_an(Array) }
      it { should have(1).items }
    end

    context 'first province' do
      subject { region.provinces_options_for_select.first }
      it { should be_an(Array) }
      it { should_not be_empty }
      it { should have(2).items }
    end
  end
end
