# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> File Manipulation

![whats-in-the-box](https://cloud.githubusercontent.com/assets/8397980/12435032/a2707b98-bebf-11e5-9db9-f54e3b90a7a5.png)

| Objectives |
| :--- |
| Students will be able to create and write to a file. |
| Students will be able to read from a file. |
| Students will be able to close files. |
| Students will be able to see if a file exists and what properties it may have. |

## Why?

In most real-world applications, you'll be working with data sets that are too large to include in a program in a predefined string or collection.

You will also find that it's common for interviews to test your knowledge of manipulating files in the technical portion of the interview (similar to the interview question that was posed to me by Erik).

## Read from a File

Reading a file in Ruby uses the `File.open` method and takes a second argument of "w".  This allows you to open the file and be able to access it for reading.  From there you can use a variety of methods.  Here are two examples of how you can read files:  

```rb
file = File.open("sample.txt", "r")
contents = file.read
puts contents   #=> Lorem ipsum etc.

contents = file.read
puts contents   #=> ""
```

And here's an example of the block format:
```rb
contents = File.open("sample.txt", "r"){ |file| file.read }
puts contents
#=>   Lorem ipsum etc.
```

Finally, if you have a bigger file that has many lines to go through you can use the `readlines` method on the file:

```rb
File.open("sample.txt").readlines.each do |line|
   puts line
end
```

## Create and Write a file

Much like the example of how to read a file, you can also write to a file using `File.open`.  The following code is verbose so that it is broken down into smaller steps for understanding.

```rb
fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hey man, you are a file."
somefile.close
```

A few things to note here:
*  `fname` is just a string that represents the filename
*  The next line invokes the file class which then requires the two arguments (the first being the name and the second being the action we perform on the name)
*  The `puts` method actually places the contents in the file as opposed to the screen.
*  The close method closes the file and finishes the process for us.  We can always open the file again to write to it.

**If you want to add contents to a file, use the "a" ("a" stands for append) argument as opposed to the "w".  The "w" will erase the contents that exist on a file before you write to it.**

## Close a File

To close a file you can simply chain `.close` to what you are referencing the file as.  For example:

```rb
somefile.close
```

The `close` method allows the pending data from the file to be written to the hard drive once you are finished.  You will be able to access the data again if you need to.

## Check for a file and it's properties

Besides reading and writing, the File and Dir classes have methods that can determine various properties of files, including size, its directory, and whether or not a file with a given name exists.

```rb
if File.exists?(filename)
   puts "#{filename} exists"
end
```

## Challenges

Pair up with a classmate to work on these challenges:

1.  Create a file called `pair-info.txt` that contains the following information for you and your classmate:
  * first and last name
  * favorite activity
  * a country you would like to visit

2.  Create a file called `riddle.txt` that contains the following:

	```txt
	1.  You're running a race and pass the person in 2nd place.  What place are you in now?

	2.  Imagine you are in a dark room.  How you get out?

	3.  Who makes it, but has no need of it.
	    Who buys it, but has no use for it.
	    Who uses it but can neither see nor feel it.
	    What is it?
	```

	Open the `riddle.txt` file and display the contents in your terminal.  If you can read the riddles in your terminal,  append your answers to the file you created.

3.  Create a file called `favorite.html` and copy the contents of the landing page of your favorite website to that file.  (Hint:  you may have to look up how to use a gem in the terminal.  Specifically `rest-client`.)