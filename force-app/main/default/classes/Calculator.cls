/****************************************************************
 * @name:		Calculator
 * @author:		KrithikaDharmarajan (dharmarajan.krithika@gmail.com)
 * @desc:		Class to describe way to call methods and using if-else condition
 * @group RAD
 ****************************************************************/
public class Calculator {
	
    //Static final Variables will help create it as a CONSTANT, only one  
    //copy of the variable exists which cannot be reinitialized
    public static final String OPERATION_ADDITION = '+';
    public static final String OPERATION_DIVIDE = '/';
    public static final String OPERATION_MULTIPLY = '*';
    public static final String OPERATION_SUBTRACT = '-';
    
      /**************************************************************************
     * @description For Users to perform different operations on calculator
     * @param Integer num1;Interger num2;String operation
     * @param void
     * @return void
     ****************************************************************/
    public static void calculate(Integer num1,Integer num2,String operation) {
        if(operation == OPERATION_ADDITION) {
            //Call the method directly and printing the result
            System.debug('Result of Addition '+ addNumbers(num1,num2));
        }
        else if(operation == OPERATION_MULTIPLY) {
            //Storing the result in a variable and printing the result
            Integer result1 = multiplyNumbers(num1,num2);
            System.debug('Result of Multiplication '+ result1);
        }
        else if(operation == OPERATION_SUBTRACT) {
            //Storing the result in a variable and using other methods as input
            Integer result2 = subtractNumbers(addNumbers(num1,num2),multiplyNumbers(num1,num2));
            System.debug('Result of Subtraction '+ result2);
        }
        else if(operation == OPERATION_DIVIDE) {
            //Strong the result in a variable and using other inputs
            Integer result3 = divideNumbers(4,2);
            System.debug('Result of Division '+ result3);        
        }
        else{
            System.debug('wrong operation specified');
        }
    }
    
    /**************************************************************************
     * @description Addition of Two Numbers - Private Method
     * @param Integer num1;Interger num2;
     * @param void
     * @return Integer
     ****************************************************************/
    private static Integer addNumbers(Integer num1,Integer num2) {
        Integer result = num1 + num2;
        return result;
    }
    
    /**************************************************************************
     * @description Multiplication of Two Numbers - Private Method
     * @param Integer num1;Interger num2;
     * @param void
     * @return Integer
     ****************************************************************/
    private static Integer multiplyNumbers(Integer num1, Integer num2) {
        return num1 *  num2;
    }
    
    /**************************************************************************
     * @description Subtraction of Two Numbers - Private Method
     * @param Integer num1;Interger num2;
     * @param void
     * @return Integer
     ****************************************************************/
    private static Integer subtractNumbers(Integer num1, Integer num2) {
        return num1 - num2;
    }
    
    /**************************************************************************
     * @description Division of Two Numbers - Private Method
     * @param Integer num1;Interger num2;
     * @param void
     * @return Integer
     ****************************************************************/
    private static Integer divideNumbers(Integer num1, Integer num2) {
        return num1/num2;
    }
    
}