# BMSTU 3 sem Laboratory works

<br><br/>
## Labs 1-4 CSS & HTML & JavaScript

* Lab 1
    > The simplest html page

* Lab 2
    > Lab1 with CSS

* Lab 3
    > Javascript. Adding dynamic
HTML behavior. Debugging tools.
    > Javascript code for displaying the tree of elements of the page from which this
code is running.

* Lab 4
    > Using JavaScript DOM & HTML & CSS 
    
    > Form for entering goods and their cost, adding to the order with the ability to calculate the total cost. Ability to select from the database of products to add to the cart, with a background change when hovering over the product. 

<br><br/>
## Labs 5-7 Ruby
#### All labs with RSpec tests
* Lab 5 Simple Ruby programs
    * Part 1
        > Calculate: y = cos(x + 3.1 z)/tg(x/r)
    * Part 2
        > Lines of the form are given (“IU6-31B Ivanov Ivan”, “IU6-32B Petrova Katya"...). Find the number of students in each of the mentioned groups.
    * Part 3
        > An integer array and the number K are entered from the keyboard. Find the K largest and K smallest elements in this array and output them.

* Lab 6 Arrays methods

    * Part 1
        > Calculate the sum of the series
    * Part 2
        > Part 1 with using Enumerable or Enumerator
    * Part 3
        > Create a method for calculating a certain integral using the rectangle formula:. Implement passing a function through a lambda expression, proc and block of code

* Lab 7 Files & Objects
    * Part 1
        > Programmatically organize the file F, the components of which are integers. Get in file G all the components of file F, divisible by 3 and not divisible by 7. The order of the numbers is preserved.
    * Part 2
        > Develop and implement a class hierarchy for the described domain objects
using inheritance mechanisms. Test it on a test example,
with a demonstration of all the features of the developed classes on specific
data.
Object — "triple" — string — two numbers of operands and an operation between them,
for example "2+3". The object is able to display its own line and result on the screen.
The object is a "three" in parentheses. The object can display a string and
a result on the screen.
In the testing program, provide automatic verification that
the created objects really correspond to the specified class hierarchy.
<br><br/>
## Labs 8-12 Ruby on Rails - 7.0.4
#### All laboratory works are aimed at studying the framework. The initial task for them:
> Write an Euclid program  

* Lab 8 Simple Rails app
    > It is necessary to develop a Rails application, form
controller, fill it with the appropriate logic and form
representation. Check the results with a functional test of the controller.

* Lab 9 Ajax requests/turbo_stream
    > Using Javascript, modify the LR 8 code in such a way that for
display results of the calculation, the browser did not perform a full reload
pages.Cabybara tests.

* Lab 10 XML & XSLT transformation on server/client side
    ##### This task requires 2 apps
    * First app - xml-api
        > Modify the Lab 8 so that, upon request with the indicated
parameters, the result was given in XML format (using the standard
serialization of ActiveSupport). Create xslt file transform xml to html. 

    * Second app - xml-proxy
        > Develop a second application that is an intermediary between the client and
the first application whose task is to convert XML to HTML
or passed unchanged to the browser for display by the browser.
The application must run with a TCP port number other than
port number of the first application

        > The final parameter input form must contain buttons or a selector,
    allowing you to check two conversion options:
        >* Server xml+xslt->html
        >* Client xml+xslt->html

* Lab 11 ORM, models, database
    > Modify the Lab 9 so that requests that were previously
completed, saved in the database and did not require repetition at the next request
computing. 

* Lab 12 User sessions, authorization, integration tests
    > Modify the Lab 9 so that the calculation is
not possible without user registration and authentication using
login/password.
