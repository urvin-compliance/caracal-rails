# Caracal-Rails

[Caracal](https://github.com/ibpinc/caracal) is a ruby library for dynamically creating professional-quality Microsoft Word documents (.docx). 

Caracal-Rails is a drop in solution for registering the Microsoft Word mime type and for establishing a template handler in Rails for the :docx format.  It also provides a helper method for accessing the document object which currently has context.


## Installation

Add this line to your application's Gemfile:

    gem 'caracal-rails'

Then execute:

    $ bundle install


## Usage

Design your controller normally:

    class ReportsController < ApplicationController
      def show
        # collect your models/view models here
      end
    end
    
Then add a view file with the Caracal extension:

    apps/views/reports/show.docx.caracal
    
Inside your view, simply issue Caracal commands on the document object:
    
    docx.name     'quarterly_report'
    docx.defaults true
    
    docx.font 'Arial'
    docx.font 'Droid Serif'
    
    docx.style 'special' do
      font   'Droid Serif'
      italic true
      size   16
    end
    
    docx.content do
      h1 'Quarterly Report'
      hr
      h2 'Client A'
      p  'Lorem ipsum dolor...'
      p  'Styled paragraph text', underline: true
      p do
        text 'Normal text'
        link 'Link text', 'http://www.google.com/', class: 'special
        text 'More normal text'
      end
      img image_url('example.png'), width: 300, height: 200, align: 'right'
      br
      table data, border: 1 do
        row_style  rows(0), background_color: 'cccccc', bold: true
        col_style  cols(4), background_color: 'cccccc', bold: true
        cell_style rows(0), cols(4), background_color: '3366cc', bold: true
      end
      page
      em 'This is an bulleted list created staticly'
      ul do
        li do
          strong 'Item 1'
          text   'More text'
        end
        li 'Item 2'
      end
      p 'This is a numbered list created dynamically', italic: true
      ol list_array do |list_item|
        text list_item.name
      end
      ...
    end


### Defaults

Caracal has a pre-built set of reasonable default behaviors and styles. If you want to apply these defaults and append/modify things from there, simply enable defaults at initialization or via the `defaults` method.
  
    docx = Caracal::Document.new('Example Document', defaults: true)
    
    docx.defaults true
    
To gain more fine-grained control of the default settings, run the following command from the terminal to install a set of YAML files in `config/caracal`. The configuration files are self-documented. *Any changes to these configurations will require a restart of your application.*

    rails g caracal:config


## Contributing

1. Fork it ( https://github.com/ibpinc/caracal-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Why is It Called Caracal?

Because my son likes caracals. :)


## Inspiration

A tip of the hat to the wonderful PDF generation libraries [Prawn](https://github.com/prawnpdf/prawn) and [Prawnto](https://github.com/GetJobber/prawnto).


## License

Copyright (c) 2014 Plia Systems, Inc

[MIT License](https://github.com/ibpinc/caracal-rails/blob/master/LICENSE.txt)