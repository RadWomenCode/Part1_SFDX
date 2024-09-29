public with sharing class WeekTwoClassExercises {
    //Another demo class that we will use to work through new concepts in-Class


    public static void salesforceOperators() {
        //Conditionals and logical operators are an important part of coding.  You may already be familiar with them in concept from formula fields and other
        //declarative tools in Salesforce that use conditional logic.

        /*
            Comparison operators to be familiar with are
            == Two equals signs indicate you are comparing two values to see if they are the same
            < less than
            <= less than or equal to
            >= greater than or equal to
            != not equal (evaluates whether the two values are NOT Equal)  Sometimes you will see/hear the ! symbol called "bang"
            for example, you could read the above as "bang equal" or "not equal"
    
            Logical Operators allow you to build out the logic of complex comparisons
            && signifies AND
            || signifies OR

			There are other more advanced operators like Ternary operators and Bitwise operators but for this course we will work with the ones above.            
            
        */

        Boolean isGreater = 4 > 6;  // Our isGreater variable must be false, since 4 is not greater than 6

        Boolean isLess = 2 < 4;  //our isLess must be true, since 2 is less than 4

        Boolean areEquivalent = (5 == 2 + 3);  //areEquivalent must be true, since 5 is equivalent to 2+3. The parenthesis here aren't necessary, 
                                               //but do make the code more readable. Note that the single equals sign is to assign a value to our boolean variable, 
                                               //whereas the double equals sign is a comparison operator

        Boolean result = (5 > 2 && (10 == 5 * 2)); //result must be true since 5 is greater than 2 AND 10 is equivalent to 5 times 2

        Boolean anotherResult = 2 != 3;  //again, true since 2 does not equal 3
        
        Boolean bool = true;

        String isBool;
        //conditional statement example
        if(bool) {
            isBool = 'value is true';
        }
        else {
            isBool = 'value is false'; 
        }

        //Hopefully this gave you a quick look at the syntax

    }

    public static void introToLists() {

        //Let's declare and initalize a list of strings
        List<String> listOfStrings = new List<String>();

        //Ok, we have a list declared, but we haven't yet put anything in it. let's put some stuff in those lists
        listOfStrings.add('EntryA');
        listOfStrings.add('EntryB');
        listOfStrings.add('EntryC');

        //Great, now listOfStrings has three strings in it. Let's prove it by printing out the list size using System.debug
        System.debug('Size of listOfStrings: ' + listOfStrings.size());

        //What's this whole .size() business?  Part of the Apex language is the built-in methods provided.  We'll talk
        //more about what methods are later, but for now, know that they are bits of funtionality you can use to do
        //fun stuff like get the size of a list

        //Let's declare a list and add values all in the same line
        List<Integer> listOfIntegers = new List<Integer>{ 1, 2, 3 };

        //And to see the values in the debug log:
        System.debug('Contents of listOfIntegers: ' + listOfIntegers);

        //Same idea with a list of strings
        List<String> firstNames = new List<String>{
            'Stephanie', 'Pierre', 'Frank', 'Mary', 'Mario'
        };
        System.debug('Contents of firstNames ' + firstNames);

        //As we saw in our reading, you can refer to the value of an item in a list by using its index, or the order in which it appears in the list
        System.debug('Value of 0 Index:' + firstNames[0]);

        //Let's do one together!  Using System.debug, print out the value Frank by referencing its index


    }

	public static void allAboutSets() {

        //Let's make a set
        Set<String> cuisineTypes = new Set<String>();

        //Why a set instead of a list?  Usually because we need each entry in the collection to be unique.
        //Perhaps we're creating a list of cuisines and it's possible we'll encounter the same one twice, but we don't want it to appear twice

        cuisineTypes.add('Chinese');
        cuisineTypes.add('Thai');
        cuisineTypes.add('Italian');
        cuisineTypes.add('Balkan');
        cuisineTypes.add('American Diner');

        //we now have a set of the above cusines.  What's important to know is that they are not guaranteed to be in the same
        //order that we put them in: Sets are unordered

        //And if we try and add a duplicate to the set?
        //To start we have how many in the set?
        System.debug('Size of our set before trying to re-add Balkan ' + cuisineTypes.size());

        cuisineTypes.add('Balkan');

        System.debug('Size of our set after trying to re-add Balkan ' + cuisineTypes.size());

        //Run this method and check the debug log, no change in size!  Sets are unique, but you won't get an error when you re-ad a duplicate element.
        //Under the hood, when you try to add a duplicate, you're replacing it, but with the very same value

    }

    public static void muchAdoAboutMaps() {
        //Maps are incredibly useful, but they work a little differently than other collections.

        //From your reading you know that they are key-value pairs.  So each key, which must be unique, 'maps' to a value.
        //Use a map when you want to be able to quickly get a value based on a key.  Let's look at an example.

        //A map of the names of our restaurant customers, indexed by a custom Id number
        //In this hypothetical, we're not using a Salesforce Id, just a fake Id stored as an integer.
        Map<Integer, String> restaurantsById = new Map<Integer, String>();

        //Let's add some entries in the format of: map.put(key, value)
        restaurantsById.put(1234, 'Pok Pok');
        restaurantsById.put(8438, 'Toro Bravo');
        restaurantsById.put(6784, 'Daruma Sushi');
        restaurantsById.put(48929, 'Moon and Sixpence');
        restaurantsById.put(89453, 'St. Jacks');

        //Ok, as we can see, maps use .put() whereas sets and lists use .add()

        //Now that we have a map, how can we get at the data?

        //You can use .keySet() to get a Set of the keys in the map (It's a set, since the Keys are unique!)
        Set<Integer> mapKeysSet = restaurantsById.keySet();
        System.debug('The KeySet of our Map: ' + mapKeysSet);

        //Or, you can use .values() to get a list of all the values in the map (It's a list, since there may be duplicates!)
        List<String> mapValuesList = restaurantsById.values();
        System.debug('The values in our Map: ' + mapValuesList);

        //Ok, now one of the most common uses of a map is when you have a key but need to get the value.  For example
        //let's say we have a list of our ids, and need to fetch the restaurant name
        //Let's make a list of Ids and then loop through, fetching the restaurant name.
        List<Integer> idList = new List<Integer>{ 1234, 6784, 89453 };

        // for loops are just ways to "loop" through a collection. We will cover this in more detail in Week 3
        for (Integer i : idList) {
            //When we use the get method on a map, and pass in the Id, we get back the value which is associated with that Id.
            //We will cover Maps and Methods in the next few weeks so don't worry if you don't fully understand yet.
            String restaurantName = restaurantsById.get(i);
            System.debug('restaurantName: ' + restaurantName);
        }

        //You'll see a lot more of maps when we work on Triggers in the comming weeks!

    }

}