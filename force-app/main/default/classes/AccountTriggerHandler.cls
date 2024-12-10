public class AccountTriggerHandler{
    public static void setTypeProspect(List<Account> accNewList){
        List<Account> accsForUpdate = new List<Account>();
        for (Account acc : accNewList) {
            if (acc.Type == null) {
                acc.Type ='Prospect'; 
                accsForUpdate.add(acc);
            } 
        }
    }
    public static void addressCopy(List<Account> accNewList){
        List<Account> accsToUpdate = new List<Account>();
        for (Account acc : accNewList) {
            if (acc.ShippingStreet != null) {
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingState = acc.ShippingState;
                acc.BillingPostalCode = acc.ShippingPostalCode;
                acc.BillingCountry = acc.ShippingCountry;
                accsToUpdate.add(acc);
            }
        }
    }
    public static void setRating(List<Account> accNewList){
        List<Account> newAccsForUpdate = new List<Account>();
        for (Account acc : accNewList) {
            if (acc.Phone != null && acc.Website != null && acc.Fax != null) {
                acc.Rating = 'Hot';
            }
        }
    }
    public static void defaultContact(List<Account> accNewList){
        List<Contact> consToInsert = new List<Contact>();
        for (Account acc : accNewList) {
            Contact con = new Contact();
            con.LastName = 'DefaultContact';
            con.Email = 'default@email.com';
            con.AccountId = acc.Id;
            consToInsert.add(con);
        }
        insert consToInsert;
    }
    
}