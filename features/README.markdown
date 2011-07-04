![RiverGlide logo](http://riverglide-live.heroku.com/attachments/branding/riverglide_logo.png)

# cukesalad - a cucumber extension

_Cucumber, washed and ready to eat for friction-free ATDD/BDD_

* [Get the Gem](https://rubygems.org/gems/cukesalad)
* [Find it on Github](http://github.com/RiverGlide/CukeSalad)

## Synopsis

Cukesalad is an extension to cucumber that allows you to write scenarios without regular expression.
It encourages you to separte your code in neat, organised and focused parts.

You can combine cukesalad with your regular step definitions.

There are no step-definitions required for this to work:

    When I attempt to add, the number '1' to the number '2'

Instead, you write a **Task**:
                                      
    in_order_to 'add', the_number: :first_number, and_the_number: :second_number do
        enter the :first_number 
        press :plus
        enter the :second_number 
        press :equals
    end

Each of the above methods `enter` and `press` must be implemented in a role.

Among these examples you will find a simple tutorial and a variety examples of using cukesalad.

_Cukesalad uses cukesalad to express all of its own examples._

## Why use cukesalad?

CukeSalad allows you to _focus on the task at hand_ - expressing examples, the roles involved in those examples and what those roles can do with the product under development.

cukesalad encourages you to write only the code that expresses:

* the roles and the actions they can perform
* the tasks and the actions involved in completing that task

cukesalad helps you focus on expressions of intent rather than regular expressions.

[More about why you would use cuke salad on the project wiki](https://github.com/RiverGlide/CukeSalad/wiki/Who-is-this-for)

## Goals->Tasks->Actions
The terms *"actions"* and *"tasks"* above come from Task Analysis, as used in User Centred Design (UCD) of Human Computer Interfaces (HCI) a.k.a. User Experience (UX):

* *Goal:* What we’re trying to achieve which has one or more…
* *Tasks:* The high-level work-item that we complete to fulfil the goal, each having one or more…
* *Actions:* The specific steps or interactions we execute to complete the task.

More information about Goals, Tasks and Actions can be found in this [blog post](http://antonymarcano.com/blog/2011/03/goals-tasks-action/)

## Feedback
This project is 'always in beta' - feedback welcome

* You can send us a [pull request](https://github.com/RiverGlide/CukeSalad/).
* Or, log a [feature request](https://github.com/RiverGlide/CukeSalad/issues?labels=Feature)
* Or e-mail feedback to <talktous@riverglide.com>
