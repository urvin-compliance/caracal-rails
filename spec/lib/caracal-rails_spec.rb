require 'spec_helper'

describe Caracal::Rails::Railtie do
    
  #--------------------------------------------------------
  # Tilt Integration
  #--------------------------------------------------------
  
  describe 'tilt integration tests' do
        
    # new
    describe '#new' do
      it { Tilt.new("#{ Rails.root }/app/views/statics/show.docx.caracal").should be_a(Tilt::CaracalTemplate) }
    end
    
    # registration
    describe '#registered?' do
      it { Tilt.registered?('caracal').should be_true }
    end
    
  end
  
  
  #--------------------------------------------------------
  # Mime Type Registration
  #--------------------------------------------------------
  
  describe 'mime type tests' do
     
     # .lookup_by_extension
     describe '#lookup_by_extension' do
       it { Mime::Type.lookup_by_extension(:docx).should be_a(Mime::Type) }
     end
     
  end
  
  
  #--------------------------------------------------------
  # Template Handler Registration
  #--------------------------------------------------------
  
  describe 'template handler tests' do
     
     # .lookup_by_extension
     describe '#lookup_by_extension' do
       it { ActionView::Template.handler_for_extension(:caracal).should eq Caracal::Rails::TemplateHandler }
     end
     
  end
  
end