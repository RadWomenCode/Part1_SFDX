public class FibonacciList {

    public static void myMethodThatCallsFibonacciLoop() {
        fibonacciLoop(12);
    }

    public static List<Integer> fibonacciLoop(Integer listIndex) {

        List<Integer> numberList = new List<Integer>();

        if (listIndex == 1 || listIndex == 2) {
            numberList.add(1);
            return numberList;
        }
        Integer firstNumber = 1, secondNumber = 1, nNumber = 1;

        for (Integer i = 3; i <= listIndex; i++) {
            nNumber = firstNumber + secondNumber;
            firstNumber = secondNumber;
            secondNumber = nNumber;
            numberList.add(nNumber);
        }

        System.debug('This is the list: ' + numberList);
        System.debug('This number should be 12: ' + numberList.size());

        return numberList;
    }

}