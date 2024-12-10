/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author Buyan Suvan
 */

public with sharing class ClassesObjectsMethods {
    
    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
        // Initialize a String with 'Hello, Salesforce!'
        String helloSalesforce ='Hello, Salesforce!';
        // Get the length of the String
        Integer length = helloSalesforce.length();
        String lengthString = String.valueOf(length);
        // Get a substring of the String of the first 5 characters
        String subString = helloSalesforce.left(5);
        // Convert the String to lower case
        String loweredString = helloSalesforce.toLowerCase();
        // Return the list with the string data
        List<String> stringResults = new List<String>();
        stringResults.add(lengthString);
        stringResults.add(subString);
        stringResults.add(loweredString);
        // In the first position add the string length
        // In the second position add the substring
        // In the third position add the string in lower case

        return stringResults;
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        // Initialize a list to store the results
        List<Boolean> checkList = new List<Boolean>();
        // Check if the string starts with 'Sales'
        Boolean startsWith = input.startsWith('Sales');
        // Check if the string ends with 'Force'
        Boolean endsWith = input.endsWith('Force');
        // Check if the string contains 'Awesome'
        Boolean contains = input.contains('Awesome');
        checkList.add(startsWith);
        checkList.add(endsWith);
        checkList.add(contains);
        return checkList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        // Split the sentence into words
        List<String> words = sentence.split(' ');
        // Create a set to store the unique words
        Set<String> uniqueWords = new Set<String>();
        // Add each word to the set
        for (String word : words) {
            uniqueWords.add(word);
        }
        // Join the unique words back into a sentence
        String joinedString = String.join(uniqueWords, ' ');
        // Return the sentence with unique words
        return joinedString; // Replace null with the variable you used to store the result
    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param s The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        // Initialize the result Integer
        Integer vowelsCount = 0;
        List<String> characters = str.split('');
        for (String splittedChar : characters) {
            if (splittedChar.containsIgnoreCase('a') ) {
                vowelsCount++;
            } else if (splittedChar.containsIgnoreCase('e')) {
                vowelsCount++;
            } else if (splittedChar.containsIgnoreCase('i')) {
                vowelsCount++;
            } else if (splittedChar.containsIgnoreCase('o')) {
                vowelsCount++;
            } else if (splittedChar.containsIgnoreCase('u')) {
                vowelsCount++;
            }
        }
            // get individual characters from the string - hint use substring or split
            // check if the character is a vowel
            // if it is a vowel, increment the result Integer
        
        

        return vowelsCount; // Replace null with the variable you used to store the result
    }

    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        // The list of scientists' names
        List<String> scientistNames = new List<String>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};

        // The variable to store the concatenated string
        String filteredScientists ='';
        List<String> filteredList = new List<String>();
        // Loop through the list of scientists' names
        for (String name : scientistNames) {
            
                if (name.containsIgnoreCase('g')) {
                    filteredList.add(name);
                }    
    }
        filteredScientists = String.join(filteredList, ',');
        String finalFilteredString = filteredScientists.removeEnd(',');
    return finalFilteredString; 
}

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {
        // Square the input numbers using the Math.pow() function
        Double powA = Math.pow(a, 2);
        Double powB = Math.pow(b, 2);
        Double differenceOfSquares = 0;
        // Calculate the absolute difference using Math.abs() function
        if (a>b) {
            differenceOfSquares = Math.abs(powA - powB);
        } else {
            differenceOfSquares = Math.abs(powB - powA);
        }
        
        // Return the result
        return differenceOfSquares; // Replace null with the variable you used to store the result
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        // Use Math class to generate number between 50 and 100
        Boolean validNumber = false;
        Double randomDouble = 0;
        Integer randomNumber = 0;

        do {
            randomDouble = Math.random()* 100;
            randomNumber = randomDouble.intValue();
        } while (randomNumber < 50);

        // Return the random integer
        return randomNumber; 
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {
        // Get the todays date
        Date todaysDate = System.today();
        // Format the current date
        String formattedDate = todaysDate.format();
        // Return the result
        return formattedDate; // Replace null with the variable you used to store the result
    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {
        // Define a map of day of the week as a key and day number as the value
        // Monday = 1, Tuesday = 2, etc.
        Map<String, Integer> weekDays = new Map<String, Integer>();
        weekDays.put('Monday', 1);
        weekDays.put('Tuesday', 2);
        weekDays.put('Wednesday', 3);
        weekDays.put('Thursday', 4);
        weekDays.put('Friday', 5);
        weekDays.put('Saturda', 6);
        weekDays.put('Sunday', 7);
        // Get the day name using .format('EEEE');
        String weekDay = dt.format('EEEE');
        // Get the day number from the map using the day name
        Integer weekDayNumber = weekDays.get(weekDay);
        // Return the result as a string
        String weekDayNumberString = String.valueOf(weekDayNumber);
        return weekDayNumberString; // Replace null with the variable you used to store the result
    }


    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {
        Integer subOfYears = null;
        if (d1 != null && d2 != null) {
            Integer yearOfDate1 = d1.year();
            Integer yearOfDate2 = d2.year();
            if (yearOfDate1 > yearOfDate2) {
                subOfYears = yearOfDate1 - yearOfDate2;
            } else {
                subOfYears = yearOfDate2 - yearOfDate1;
            }
        }
     
        return subOfYears; // Replace null with the variable you used to store the result
    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book { 
        // Declare three public instance variables - title, author, pages
        // title
        public String title;
        // author
        public String author;
        // pages
        public Integer pages;
        // Book constructor to initialize the title and author
        public Book(String title, String author) {
            this.title = title;
            this.author = author;
        }
    
        // Method that returns the details of the book
        public String getBookDetails() {
            // return A string containing the details of the book in the format "Title: <title>, Author: <author>"
            String bookDetails = 'Title: ' + title + ', ' + 'Author: ' + author;
            return bookDetails;
        }
    }
    

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        // Create a Book object with title "A Brief History of Time" and author "Stephen Hawking"
        
        ClassesObjectsMethods.Book newBook = new ClassesObjectsMethods.Book('A Brief History of Time', 'Stephen Hawking');
        // Call the getBookDetails method on the book object to get the details of the book
        String bookDetails = newBook.getBookDetails();
        // Return the details of the book
        return bookDetails; // Replace null with the variable you used to store the result
    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        // Create a list of books
        List<Book> listOfBooks = new List<Book>();
        // Update the title and author of myBook1
        myBook1.title = 'Harry Potter and the Chamber of Secrets';
        myBook1.author = 'J.K. Rowling';
        // Update the pages for myBook1 to 352
        myBook1.pages = 352;      
        listOfBooks.add(myBook1);
        // Create a new Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book book2 = new Book('A Brief History of Time', 'Stephen Hawking');
        // Update the pages for A Brief History of Time to 256
        book2.pages = 256;
        // Add the book to the list
        listOfBooks.add(book2);
        return listOfBooks; // Replace null with the variable you used to store the result      
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Declare private two instance variables - (TEXT) name and (Number) age
        public String name;
        public Integer age;
        // Constructor to initialize the name and age
        public Person(String name, Integer age){
            this.name = name;
            this.age = age;
        }
        // Method introduceYourself that returns the details of the person  
        // Return a string in the format "Hello, my name is <name> and I am <age> years old."
        // For example, introduceYourself() should return a string like "Hello, my name is John Doe and I am 28 years old."
        public String introduceYourself(){
            String personDetails = 'Hello, my name is ' + name + ' and I am ' + age + ' years old.';
            return personDetails;
        }
        // Getter method that returns the name of the person
        public String getName () {
            return name;
        }
        // Getter method that returns the age of the person
        public Integer getAge () {
            return age;
        }
        // Setter method that sets the name of the person
        public void setName(String name){
            this.name = name;
        }
        // Setter method that sets the age of the person
        public void setAge(Integer age){
            this.age = age;
        }
    }

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        List<String> results = new List<String>();
        // Create a new instance of Person class
        // Name the person 'John Doe' and set the age to 28
        // Add the details of the person using the introduceYourself method
        ClassesObjectsMethods.Person newPerson = new ClassesObjectsMethods.Person('John Doe', 28);
        String personDetails = newPerson.introduceYourself();
        results.add(personDetails);
        // Get the name of the person using the getter method and add it to the list
        String nameOfPerson = newPerson.getName();
        results.add(nameOfPerson);
        // Get the age of the person using the getter method and add it to the list
        Integer ageOfPersonInteger = newPerson.getAge();
        String ageOfPersonString = String.valueOf(ageOfPersonInteger);
        results.add(ageOfPersonString);
        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {
        // Create a new instance of the Person class using the provided name and age
        ClassesObjectsMethods.Person newPerson = new ClassesObjectsMethods.Person(name, age);
        // Return the new instance of the Person class
        return newPerson; // Replace null with the variable you used to store the result
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {
        List<Person> listOfPersons = new List<Person>();
        // Loop through each name in the provided list of names
        for (String name : names) {
            Person newPerson = new Person(name, age);
            listOfPersons.add(newPerson);
        }
        return listOfPersons; 
    }


    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        Integer ageOfFirstPerson = person1.getAge();
        Integer ageOfSecondPerson = person2.getAge();
        if (ageOfFirstPerson > ageOfSecondPerson) {
            return person1;
        } else {
            return person2;
        }
    }
}