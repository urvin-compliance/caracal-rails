# Caracal-Rails

[Caracal](https://github.com/ibpinc/caracal) is a ruby library for dynamically creating professional-quality Microsoft Word documents (.docx). 

Caracal-Rails is a drop in solution for registering the Microsoft Word mime type and for establishing a template handler in Rails for the :docx format.  All caracal documents are rendered with an explicit block passing an argument named `docx`.


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
    
    docx.file_name 'quarterly_report'
    
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
      p do
        text 'Normal text'
        link 'Link text', 'http://www.google.com/', class: 'special
        text 'More normal text'
      end
      img image_url('example.png'), width: 300, height: 200, align: 'right'
      br
      table data, border: 1 do
        cell_style  rows(0), background_color: '3366cc', color: 'ffffff', bold: true
      end
      page
      p 'This is an bulleted list'
      ul do
        li do
          strong 'Item 1'
          text   'More text'
        end
        li 'Item 2'
      end
      ...
    end

*See the [Caracal](https://github.com/ibpinc/caracal) library for more details.*  


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

Copyright (c) 2014 Trade Informatics, Inc

[MIT License](https://github.com/ibpinc/caracal-rails/blob/master/LICENSE.txt)