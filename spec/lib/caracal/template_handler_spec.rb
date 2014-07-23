require 'spec_helper'

describe Caracal::Rails::TemplateHandler do
  let(:template) { double('template') }
  
  #--------------------------------------------------------
  # Class Methods
  #--------------------------------------------------------
  
  describe 'class method tests' do
    subject { Caracal::Rails::TemplateHandler }
    
    # .call
    describe '#call' do
      before { template.stub(identifier: 'show.docx.caracal') }
      
      it { subject.call(template).should eq "Tilt.new('show.docx.caracal').render(self)" }
    end
    
  end
  
end