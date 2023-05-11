# C - sharp

Here you can see topics of advanced programming course which I am a member in the TA team. 

The stack that courses was based on was **dotnet** and **C#** .

## Creating a project 

The command for starting a new dotnet project is dotnet new <template> . The template used in this course is `console`.

```bash
dotnet new console
```

After making a project try the command to check every thing is ok or not ( in the project directory ) : 
```bash
dotnet build
```

To run the project: 
```bash
dotnet run
```

Then in the another directory :

```bash
dotnet new sln --name MySolution
```

> In a directory you should have just one solution file or project. solution file and projects are the files that need to be built.

Then for adding the project to the solution : 
``` bash
dotnet sln MySolution.sln add .
```
## Strings 

String is an array of characters. You can apply any operation on strings using this fact. But using implemented methods is always a better idea.

Neat functions:
- ToUpper, ToLower
- Split
- Substring
- Replace
- Index of
- accessing individual character

The `String` class in `System` has some operator overloadings.

> Null is not empty string.

any attempt to call a method on a null string causes a `NullReferenceException`.

> There is something called `StringBuilder` for fast string creation. (Search about this item, read from documentaion)

```C#
var s = "Helloo world!!";
Console.WriteLine(s.ToUpper());   // Outputs "HELLO WORLD"
Console.WriteLine(s.ToLower());

string s3 = "Visual C# Express C#";
System.Console.WriteLine(s3.Substring(7, 2));
// Output: "C#"

System.Console.WriteLine(s3.Replace("C#", "Basic"));
// Output: "Visual Basic Express"

// Index values are zero-based
int index = s3.IndexOf("C");
// index = 7
System.Console.WriteLine(index);
```

Split method :
```C#
var a = "pisazadeh@outlook.com";
string[] subs = a.Split('@', '.');
foreach (string item in subs)
{
    System.Console.WriteLine(item);
}
```

## File IO

For working with files, you should use the package below : 
```C#
using System.IO ;
```

### Basic operations 

Creating file (this method returns you a fileStream):
```C#
FileStream fs = File.Create(pathName);
```
`File.Exists(path)` and `File.Delete(pathname)` are other methods that you can use.



First interaction to files is to write a word in a file:
```C#
string stdid = Console.ReadLine();
File.WriteAllText("stdlist.txt", stdid + "\n");
```

The method above overwrites the content in a file, but the method below just appends it's input to
the end of file: 
```C#
File.AppendAllText("stdlist.txt", stdid + "\n");
```

To read content from a file:
```C#
string content = File.ReadAllText(filename);
System.Console.WriteLine(content);
```
> Write `cw` and then vscode will print the `System.Console.WriteLine()` 

### Stream

C# creates a stream for getting a connection to operating system. Through these connections, C# program interacts with
files(reading and writing).

```C#
StreamWriter writer ;
writer = new StreamWriter("users.txt");
writer.WriteLine("Hello world 2");
writer.Close();
```
If the file already existed in the pathfile, the stream will overwrite it. 

We also have a StreamReader : 
```C#
StreamReader reader ;
reader = new StreamReader("users.txt");

while (reader.EndOfStream == false)
{
    System.Console.WriteLine(reader.ReadLine());
}
reader.Close();
```

using a filestream : 
```C#
byte[] info = new UTF8Encoding(true).GetBytes("Hellooooooooo");
fs.Write(info, 0, info.Length);
fs.Close();
```

## Exception handling

Errors happen all the time, an error can be a fatal error and cause suspension in our app which is not good. 

There is other things that we can do with errors, we can raise an exception for them and then handle them. 

### Keywords
* raise
* try
* except
* exception
* catch
* finally
* throw

### Try, catch, finally
Consider you called a method, which an exception was raised in because the behaviour that we didn't want to happen , happened.

Now we have an exception and we must catch it. We do it using try, except :
```C#
try
{
    method()
}
catch
{

}
finally
{

}

```
The `finally` section is the section that is executed anyway.

### Exception
C# is an object oriented language, like java. Almost every entity you see is a class, And so the Exception. 

Exception has some behaviors that we can override them using inheritence . 

We can define our custom exception . 

There are some pre-defined exceptions in C#.

![](https://github.com/parsaeisa/Notes/blob/main/languages/exceptions_c%23.png)

There is no need to define these exceptions : 
```C#
var num = Convert.ToInt32(System.Console.ReadLine());
int a = 0 ;
try
{
    a = 255/num ;            
}
catch (DivideByZeroException e)
{
    System.Console.WriteLine("exception caught {0}", e);
    // throw;
}
finally
{
    System.Console.WriteLine("result {0}", a);
}
```

### Throw
What do we do with exceptions ? we raise them and catch them in another place in the code. 

When an error is happening or an unwanted cyclomathic path has been taken, instead of halting the application we raise an exception.

You can throw these exceptions by your self. For example if you have a system that someone with the age under 10 cannot access you can use the code below : 
```C#
static void checkAge(int age)
{
  if (age < 18)
  {
    throw new ArithmeticException("Access denied - You must be at least 18 years old.");
  }
  else
  {
    Console.WriteLine("Access granted - You are old enough!");
  }
}
```

Then you catch it's exception using try, catch.If you don't catch it your app gonna take Unhandled exception error 
which is critical.

## Enumeration


One of the main purposes of using enums is to limit the values that a variable can take .

For example in a music instrument shopping application the type of product could be typed "guitar" or "guiiitar" or " guitar" and etc. This is problematic so we use enums to only have a single value that is compatible to guitar.

They are of type int and they start from 0. But we can assign them other types : 
```C#
enum ErrorCode : ushort
{
    None = 0,
    Unknown = 1,
    ConnectionLost = 100,
    OutlierReading = 200
}
```

We can convert a number to enum like this : 
```C#
public enum Season
{
    Spring,
    Summer,
    Autumn,
    Winter
}
var c = (Season)4;
```

### Flag enum
C# has two types of enum, normal enum and flag enum. 

With flag enum you can combine values together using binary operands.
```C#
[Flags]
public enum Days
{
    None      = 0b_0000_0000,  // 0
    Monday    = 0b_0000_0001,  // 1
    Tuesday   = 0b_0000_0010,  // 2
    Wednesday = 0b_0000_0100,  // 4
    Thursday  = 0b_0000_1000,  // 8
    Friday    = 0b_0001_0000,  // 16
    Saturday  = 0b_0010_0000,  // 32
    Sunday    = 0b_0100_0000,  // 64
    Weekend   = Saturday | Sunday
}

Days meetingDays = Days.Monday | Days.Wednesday | Days.Friday;
Days workingFromHomeDays = Days.Thursday | Days.Friday;
bool isMeetingOnTuesday = (meetingDays & Days.Tuesday) == Days.Tuesday;
// Is there a meeting on Tuesday: False
```

A variable can contain multiple values from flag enums. For example the number 37 which is `0b_0010_0101` is 
saturday, monday and wednesday which can act as an array for example.

Flag enums can be converted to like other enums : 
```C#
var a = (Days)37 ;
```

## Teaching roadmap - Session 1

Write an application that users can buy musical instruments in.

Put two files, each file represents something like table in database :
* Users
* Instruments
* Orders

For choosing instrument , first put strings in uppercase format (e.g GUITAR) then put enum.

### Category option
Enum defines the categories of instruments.Choosing the category of insturments at first is handled by string, If the category didn't exist on categories list, it returns an exception.

### Pre-processing data
Finding firstname and last name by string split .Finding username from email (everything before `@`).

<!-- --------------------------------------------------------------------------------------------- -->
## Interface 

##### The only constant is change

### Implementing an interface on a class
Bring an example of implementing an interface with class. 
```C#
interface ICar
{
    void  Drive();    
}

class BMW : ICar 
{
    public void Drive(){
        System.Console.WriteLine("BMW is moving ...");
    }
}

class Benz : ICar
{
    public void Drive(){
        System.Console.WriteLine("Benz is moving ...");
    }
}
```

* Implemented methods should be public. Don't make them public at first and let students see the error.

In next stage, pass an interface to a method, in that method call a method from that interface and show that we can pass any class to that method only if that class implement the specific interface.

This the abstraction layer.

When writing a classes methods, you can do this:
```C#
int summ(int a, int b) => a + b ;
```

### Taking an interface as an argument

We use interface when we want to adapt a method, but we don't care how that method is done. 

For example, if we write a system like IMDB

```C#
static void DrawShapesWithStats(IShape shape)
{
    shape.Draw();
    Console.WriteLine(shape.GetArea());
}
```

### Useful interfaces

* IComparable
* IEnumerable 
* IDisposable 

#### IComparable 
C# is an object oriented programming language. Anything that you see can be implemented for your defined class.

* `object` is the class that all other classes inherit from.

This interface has method called `CompareTo`:

```C#
public int CompareTo(object incomingobject)
{
    // Storing incoming object in temp variable of 
    // current class type
    Employee incomingemployee = incomingobject as Employee;

    return this.ID.CompareTo(incomingemployee.ID);
}
```

> Use this example for an interface called **Shape** that is implemented by **rectangle** and **square**. A shape is bigger than another if it's area is bigger.

#### IDisposable


#### IEnumerable

for iterating a **custom** collection by implementing the IEnumerable and IEnumerator interfaces. 

For making a custom collection we need two interfaces. `IEnumerable` and `IEnumerator`.
<!-- --------------------------------------------------------------------------------------------- -->
## Collection

`System.Collections` has three sub packages : 

* `System.Collections.Generic` 
* `System.Collections.Concurrent` 
* `System.Collections` 

Common Data structures in C3 : 
![](https://github.com/parsaeisa/Notes/blob/main/languages/DataStructure.png)


### List
There are some handy methods on `List` that you can use.

* `Count` : returns the count of elements in array. 
* `ForEach` : ForEach is method that you can use (You will learn more about it on lambda)

```C#
numbers.ForEach(
    number => Console.Write(number + " "));
```


### Foreach
It is for loop just in another syntax.

Write a method that takes a list of ICar and calls Drive method on all of them.

<!-- --------------------------------------------------------------------------------------------- -->
## Generic
A generic that accepts an interface. 

### Method

Write a method that swaps the value of two variables of any type.
```C#
static void Swap<T>(ref T a, ref T b)
{
    T temp = a;
    a = b;
    b = temp;
}
```

You can write a method taking arguments from classes that implement a certain Interface. 

```C#
static void DrawShapesWithStats<T>(T shape) where T: IShape, new()
{
    T s1 = new T();
    shape.Draw();
    Console.WriteLine(shape.GetArea());            
}
```
`Draw` method is in IShape interface.


### Class

ArrayList belongs to when C# didn't have generics.

`List` is a generic class. It implements `IEnumerable<T>`.