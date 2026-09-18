require 'spec_helper'

describe Caracal::Rails::TemplateHandler do
    
  #--------------------------------------------------------
  # Class Methods
  #--------------------------------------------------------
  
  describe 'class method tests' do
    
    # .call
    describe '#call' do
      let(:template) { double('template', identifier: 'show.docx.caracal') }
      let(:actual)   { Caracal::Rails::TemplateHandler.call(template) }

      it { expect(actual).to eq %q{Tilt.new("show.docx.caracal").render(self)} }

      describe 'when the path contains a quote' do
        let(:template) { double('template', identifier: %q{/views/o'brien/show.docx.caracal}) }

        it 'escapes it rather than breaking out of the string' do
          expect(actual).to eq %q{Tilt.new("/views/o'brien/show.docx.caracal").render(self)}
        end

        it 'produces source that still parses as ruby' do
          expect { RubyVM::InstructionSequence.compile(actual) }.not_to raise_error
        end
      end

      describe 'when the path is hostile' do
        let(:template) { double('template', identifier: %q{/tmp/x'); system('id'); ('}) }

        it 'keeps the whole path inside the string literal' do
          expect(actual).to eq %q{Tilt.new("/tmp/x'); system('id'); ('").render(self)}
        end
      end
    end
    
  end
  
end