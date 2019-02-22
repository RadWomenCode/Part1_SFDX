/**
 * Object oriented class which provides shopping cart funtionality
 */
public with sharing class ShoppingCart {

    String cartId;
    Decimal checkoutMinimum;// The amount that must be in a cart before checkout can be completed.
    List<Item> items; //Collection of all items in the cart.
    Decimal total; //total for all items currently in the cart.  reflects any discounts applied to individual items.
    Datetime createdDT; //Datetime at which the cart was created

    public ShoppingCart(Decimal cartMinimum) {
        checkoutMinimum = cartMinimum;
        items = new List<Item>();
        createdDT = System.Now();
    }

    /**
     * @return Boolean - true if the cart minimum has been met, false if it has not.
     */
    public Boolean ableToCheckout() {
        if (total >= checkoutMinimum) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Adds one item to the cart.
     *
     * @param newItem - the item to add.
     */
    public void addItem(Item newItem) {
        //add the new item to the list of items
        items.add(newItem);
        //update the cart total
        updateCartTotal();
    }

    /**
     * Adds multiple items to the cart.
     *
     * @param newItems - the list of items to add.
     */
    public void addItems(List<Item> newItems) {
        //add the new items to the list of items
        items.addAll(newItems);
        //update the cart total
        updateCartTotal();

    }

    /**
     * Removes all items from the cart.
     */
    public void emptyCart() {
        //remove all items
        items.clear();
        //update the cart total
        updateCartTotal();
    }

    /**
     * Private method to keep the cart total updated.
     */
    private void updateCartTotal() {
        //Start at 0
        Decimal runningTotal = 0;

        //add up the final prices of each item in the cart
        for (Item i : items) {
            runningTotal += i.listPrice;
        }

        //update the total
        total = runningTotal;
    }

    public void checkout() {
        //TODO:  In a later version of this package, we will add functionality to process payment, save the transaction to our database
        //and generate a receipt


    }

}