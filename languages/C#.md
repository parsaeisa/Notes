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

First interaction to files is to write a word in a file:
```C#
string stdid = Console.ReadLine();
File.WriteAllText("stdlist.txt", stdid + "\n");
```

To read content from a file:
```C#
string content = File.ReadAllText(filename);
System.Console.WriteLine(content);
```
> Write `cw` and then vscode will print the `System.Console.WriteLine()` 

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

## Teaching roadmap 

Write an application that users can buy musical instruments in.

Put two files, each file represents something like table in database :
* Users
* Instruments
* Orders

For choosing instument , first put strings in uppercase format (e.g GUITAR) then put enum.