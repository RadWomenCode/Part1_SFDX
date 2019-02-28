public class myControllerExtension {

    private final Account acct;

    /**
     * Extension constructor initializes the private member
     * variable acct by using the getRecord method from the standard
     * controller.
     */
    public myControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
}