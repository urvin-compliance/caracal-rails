# Caracal-Rails

[Caracal](https://github.com/trade-informatics/caracal) is a ruby library for dynamically creating professional-quality Microsoft Word documents.

Caracal-Rails is a drop in solution for registering the Microsoft Word mime type and for establishing a template handler in Rails for the :docx format.  All caracal documents are rendered with an explicit block passing a reference to the Caracal::Document object named `docx`.

```
Please see the [caracal-example](https://github.com/trade-informatics/caracal-example) repository for
a working demonstration of the library's capabilities.
```

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

    docx.font 'Droid Serif'

    docx.style 'special' do
      font   'Droid Serif'
      italic true
      size   16
    end

    docx.h1 'Quarterly Report'
    docx.hr
    @report.clients.each do |client|
      docx.h2 client.name
      docx.p  'Lorem ipsum dolor...'
      docx.p do
        text 'This is a sentence with a '
        link 'link', 'http://www.google.com/', style: 'special'
        text ' in the middle.'
      end
      docx.img image_url('https://www.example.com/logo.png'), width: 300, height: 200, align: 'right'
      docx.br
      docx.table client.tablular_data, border_size: 4 do
        cell_style  rows[0], background_color: '3366cc', color: 'ffffff', bold: true
      end
      docx.page
      docx.p 'This is an bulleted list.'
      docx.ul do
        li do
          strong 'Item 1'
          text   'More text'
        end
        li 'Item 2'
      end
    end


*See the [Caracal](https://github.com/trade-informatics/caracal) library for more details.*  


## Contributing

1. Fork it ( https://github.com/trade-informatics/caracal-rails/fork )
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

[MIT License](https://github.com/trade-informatics/caracal-rails/blob/master/LICENSE.txt)
