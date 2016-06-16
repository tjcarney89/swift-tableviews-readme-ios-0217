# TableViews

![Tzu](http://i.imgur.com/9k7Ar2Q.jpg?1)  

> Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step. ~[Lao Tzu](https://en.wikipedia.org/wiki/Laozi)

## Learning Objectives - The student should be able to..

* Create content here when lesson is complete


## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.
* Can create and use Arrays.
* Can iterate over an Array using a for-in loop.
* Can iterate over an Array calling enumerate().
* Work with the following methods on arrays:
	* append()
	* insert(_:atIndex:)
	* removeAtIndex()
	* subscript syntax with arrays
	* count
	* isEmpty
* Can work with dictionaries 
* Can iterate over a dictionary
* Knows how to work with optionals
* Classes
* Structs
* Properties


## Outline / Notes

* Take a look through Unit 4's readings/labs for a feel at what the student has been exposed to so far with respect to views, interface builder and navigating around Xcode.
* The various readings/labs in Unit 4 are a good reference for how to go about creating the various readings/labs in this unit.
* Build up to what makes a tableView useful. We have phones with screen sizes that aren't that large and there are times where we need to list information (whether it be our contacts, messages, music, e-mail) in a manner that makes it easy for us to view, but also easy for us to scroll up and down using our thumbs. The answer is Table Views.  

![settings](http://i.imgur.com/ZFNqvkf.png?1)            ![email](http://i.imgur.com/UVuVn9i.png?1) 


 ![music](http://i.imgur.com/uyKasU6.png?1)       ![music2](http://i.imgur.com/Onhfg5v.png?1)

* OK, so know we know what a table view looks like, and examples of apps that we're familiar with that use table views.  
* Take them through a step by step explanation with screenshots of how they can go about creating a table view.  
* Walk them through the necessary methods required to power a table view.
* Feel free to have them follow along by producing a tableview alongside you or at the end of the lesson.
* Anytime something is shown to them here that is new, we need to be explicit in how we explain it - being very thorough/detailed. As if it was being explained to a 5 year old.
* They need to know what a Table View Cell is, the various styles and what is provided to them when they choose a particular style.
* Never just show them something and be done with it. In anything that is shown to them, ease into it.. as well as being very explicit with what you're doing, this will help create a lesson that starts off with something they know and we just keep building on that where complexity is added on as we move further into the lesson but in a clear way that makes sense and is explained well.
* Custom Class has to be set to a UITableViewController, I first want them to see this. In a future lesson, we can have them hook up a UITableViewController to a UIViewController (thus having them set the delegate themselves)
* Reuseidentifier will need to be talked about.
* IndexPath will need to be talked about.
* This line of code will need to be explained and how powerful it is

```swift
let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
```

* **NOTE** this is a huge lesson to take in, I'm inclined to include a project with a completed project where within this reading.. we explain things in detail but make them open the xcode project and reference WHAT it is we're explaining.. that way they can explore around and see how this thing works and how it's hooked up.
* I've included an Xcode project the student can reference as we discuss what it is they need to know in setting up a TableViewController.
* I would not talk about or include the Navigation Controller in this reading, it will be its own reading after this.


<a href='https://learn.co/lessons/TableView' data-visibility='hidden'>View this lesson on Learn.co</a>
