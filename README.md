# Table Views

![Tzu](http://i.imgur.com/9k7Ar2Q.jpg?1)  

> Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step. ~[Lao Tzu](https://en.wikipedia.org/wiki/Laozi)

## Learning Objectives - The student should be able to...

* Present a data set to the user in an organized way using table views
* Know when to use table views in their iOS apps
* Understand the various components of table views: The view, controller, cells, and data source
* Understand how a table view creates and uses cells to show data
* Understand the concept of reusable table view cells and how they are created and dequeued

## What Are Table Views?

_Table views_ are one of the fundamental views that ship with Cocoa Touch and iOS. They are often used with apps that present a lot of data to the user. You're no doubt familiar with table views, even if you don't know them by name. Take a look at the Contacts app, for example: The main view, the list of contacts, is a table view. You most likely have far more contact cards than will fit on a single screen (despite getting larger and larger, iPhone screens are still pretty small, after all); table views also make it easier to present a large volume of information in an easy-to-read (and easy-to-scroll) manner.

Some examples of apps on your iPhone that use table views are the Settings app:

![Settings.app](https://s3.amazonaws.com/learn-verified/ios-settings.png)

The Mail app:

![Mail.app](https://s3.amazonaws.com/learn-verified/ios-mail.png)

And the Music app:

![Music.app](https://s3.amazonaws.com/learn-verified/ios-music.png)

Table views are made up of _cells_. Each cell represents a single piece of data in a larger data set. You can define how to draw a single cell, and the table view will take care of the work of drawing many cells and scrolling them.

Table views are backed by a _data source_. The data source provides the pieces of data that will be drawn into each individual cell of the table.

## Fundamentals of Table Views

As you've probably guessed by now, a table view is an type of _view_ that is provided by Cocoa Touch. It is an instance of the class `UITableView`, which is a _subclass_ of `UIView`. This means that it provides all the functionality of a basic view (`UIView`), along with some functionality of its own.

Namely, a table view knows how to lay out data in _rows_. It gets its data from a _source_ and draws each piece of that data set into a _cell_. Table views also allow users to scroll through the entire data set, displaying a cell for each piece of data, and can even allow the user to _select_ a cell to bring up more details for that piece of data. (Think again of the Contacts app on your iPhone: You can scroll through a _list_ of contacts' names, then select one to view more details like their telephone number and email address.)

### Powering Table Views

Table views get their data from a _data source_. A data source is typically another class that implements the [`UITableViewDataSource`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/index.html#//apple_ref/occ/intf/UITableViewDataSource) protocol, which means it provides a number of methods that the table view can call to retrieve individual pieces of data from the larger data set. Most of the methods described in the protocol are optional, but there are two that data sources are required to implement: `tableView(_:cellForRowAt:)` and `tableView(_:numberOfRowsInSection:)`.

Basically, when you set up a table view, you can designate an instance of a given class as the view's data source. The view will then call methods on the data source, asking it questions like "How many rows of data are in your data set?" and "What piece of data is on the 20th row of the table?" The table view can then use these queries to figure out how to draw the table in a neat, scrollable table.

### Drawing Cells

Table views comprise _cells_. Each cell is a single piece of data. A table view cell is also a _view_ which is configured to display a given piece of data.

You often see cells made of a custom view (such as in the Mail example above), but Cocoa Touch also comes with basic cells preconfigured with labels and images that you can use to display data points, too. For now, you'll work with these preconfigured cells; later on, you can explore creating cells with custom views so you can display data any way you want.

## Working With Table Views

An example of an app using a table view has been created for you. Open up the `TableViewFunTime.xcodeproj` file included in this repo. Select `Main.storyboard` from the file viewer to show the app's UI.

In `Main.storyboard`, you should see a single scene that includes a table view. It looks like this:

![Table view in Xcode](https://s3.amazonaws.com/learn-verified/uitableview-xcode.png)

Interface Builder only shows a basic example of how the table view will look. Notice that the table view takes up the entire UI of the application. There is also a _prototype cell_ drawn at the top of the table view. This gives you a basic idea of what the cell will look like, but it is not yet populated with any data. The table view itself has no data in Interface Builder, either, so it mostly looks blank.

Try building and running the app. In the simulator, you'll see this:

![Table view in simulator](https://s3.amazonaws.com/learn-verified/uitableview-simulator.png)

When the app is actually run, it is populated with data (in this case, some great classic examples of music). How does the app get populated with data? Is it magic?

You're about to find out!

The "magic" happens in the app's view controller. Open up `TableViewController.swift` to see the code that powers the view controller. In particular, take a look at the section marked `Table view data source`. You'll see that there are currently three methods defined:

```swift
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoriteSongs.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)

        let favoriteSong = favoriteSongs[indexPath.row]
        
        cell.textLabel?.text = favoriteSong

        return cell
    }
```

Believe it or not, these are all the methods that are required to power a table view. The table view can use these methods to get its data set, and will do all the rest of the work itself—drawing the cells, allow the user to scroll through the table view, and so on.

Let's take a look at these methods in more detail.

### Table View Methods

The first method, `numberOfSectionsInTableView(_:)`, returns the number of _sections_ in the tablew view. Many table views only have one section, including the one in this example project, so in this case, the method is simply returning `1`. Table views can be broken into sections, though. You can see this in the Settings app, which groups similar settings categories into sections. Each section is denoted with a large grey area. Sections can have titles, too, although the Settings app doesn't have titles for its sections.

![Settings.app](https://s3.amazonaws.com/learn-verified/ios-settings.png)

In future lessons, you'll deal more with dividing a table view into sections; for the time being, you'll work with table views with just one section.

The next important method is `tableView(_:numberOfRowsInSection:)`. This method gets passed an `Int` representing a particular section of the table view, and returns the number of _rows_ present in that section. Since you're working with table views with only one section in this example, `numberOfRowsInSection` will always be 0 (since sections are 0-indexed, like arrays).

The relevant bit of this method is the single line that returns the number of rows in the section. In this example app, you are creating a list of favorite songs that has been stored in the instance variable `favoriteSongs`. The number of rows—i.e., the number of pieces of data in the data set—is the number of songs stored in the `favoriteSongs` array, so this method simply returns the `count` of that array. Easy, right?

The final method, `tableView(_:cellForRowAtIndexPath:)`, is a bit more complicated. There's a lot going on in this method, so let's break it down bit by bit.

#### Getting a Cell

`tableView(_:cellForRowAtIndexPath:)` does something very important: It returns an actual _cell_ for use in the table view. The "magic" is that, given a cell, the table view will know how to draw it in amongst all the other cells. Neat, huh?

First, `tableView(_:cellForRowAtIndexPath:)` gets passed a `cellForRowAtIndexPath` parameter which lets the method know exactly which cell is being requested.

### Wiring Up the Table View

Take a look at `Main.storyboard` again. In Interface Builder, click once on the **Table View**, either in the main editor window or the object listing on the left side of Interface Builder, to select it, then bring up the Connections Inspector in the right pane.

![Table View connections](https://s3.amazonaws.com/learn-verified/uitableview-connections.png)

Notice the `dataSource` outlet? That outlet is hooked up to the **Table View Controller**, which represents the `TableViewController` you just examined earlier in this lesson. The table view is wired up to this controller, which means that it will ask the controller—by calling particular methods—for the data necessary to draw the table view. The table view itself takes care of the rest of the work—it just needs to be hooked up to the data source, and does the rest by itself.

In future lessons, you'll see how to build your own iOS app powered by a table view yourself. For now, though, you've hopefully gained insight on how table views in iOS work.

<a href='https://learn.co/lessons/TableView' data-visibility='hidden'>View this lesson on Learn.co</a>
