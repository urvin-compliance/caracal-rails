require 'spec_helper'

describe Caracal::Rails::Railtie do
    
  #--------------------------------------------------------
  # Tilt Integration
  #--------------------------------------------------------
  
  describe 'tilt integration tests' do
        
    # new
    describe '#new' do
      let(:actual) { Tilt.new("#{ Rails.root }/app/views/statics/show.docx.caracal") }
      
      it { expect(actual).to be_a(Tilt::CaracalTemplate) }
    end
    
    # registration
    describe '#registered?' do
      let(:actual) { Tilt.registered?('caracal') }
      
      it { expect(actual).to eq true }
    end
    
  end
  
  
  #--------------------------------------------------------
  # Mime Type Registration
  #--------------------------------------------------------
  
  describe 'mime type tests' do
     
     # .lookup_by_extension
     describe '#lookup_by_extension' do
       let(:actual) { Mime::Type.lookup_by_extension(:docx) }
       
       it { expect(actual).to be_a(Mime::Type) }
     end
     
  end
  
  
  #--------------------------------------------------------
  # Template Handler Registration
  #--------------------------------------------------------
  
  describe 'template handler tests' do
     
     # .handler_for_extension
     describe '#handler_for_extension' do
       let(:actual) { ActionView::Template.handler_for_extension(:caracal) }
       
       it { expect(actual).to eq Caracal::Rails::TemplateHandler }
     end
     
  end
  
end