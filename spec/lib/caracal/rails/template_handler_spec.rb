require 'spec_helper'

describe Caracal::Rails::TemplateHandler do

  #--------------------------------------------------------
  # Class Methods
  #--------------------------------------------------------

  describe 'class method tests' do

    # .call
    describe '#call' do
      let(:template) { double('template', identifier: 'show.docx.caracal') }
      let(:actual)   { Caracal::Rails::TemplateHandler.call(template, nil) }

      it { expect(actual).to eq "Tilt.new('show.docx.caracal').render(self)" }
    end

  end

end
