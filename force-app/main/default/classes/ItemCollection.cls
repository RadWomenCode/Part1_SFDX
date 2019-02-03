public with sharing class ItemCollection {

	public List < Item > itemList;

	//Constructor, takes a list of Items and assigns them to the class for processing
	public ItemCollection(List < Item > items) {
		this.itemList = items;
	}
	
	public void insertItemSobjects () {

		//New list of Stock Item objects to be inserted 
		List < Stock_Item__c > itemSobjects = new List < Stock_Item__c >();

		//Loop through the list of items, creating a coresponding SObject for each
		for (Item i: this.itemList) {
			Stock_Item__c stockItem = new Stock_Item__c();
			stockItem.Item_Name__c = i.name;
	        stockItem.List_Price__c = i.listPrice;
	        stockItem.Description__c = i.description;
	        stockItem.Minimum_Stock_Level__c = i.minimumStockNeeded;

	        //Add the object to the insert list
	        itemSobjects.add(stockItem);
		}

		//Insert the sobjects
		System.debug('objects to insert: '+itemSobjects);
		insert itemSobjects;

	}

}