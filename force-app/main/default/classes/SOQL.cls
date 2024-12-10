/**
* The SOQL class serves as a primer into the Salesforce Object Query Language in Apex.
* It covers fundamental aspects such as SELECT statements, WHERE clauses, Relationship queries, and LIMIT keyword.
*
* This class introduces developers to the concept of retrieving data from Salesforce using SOQL. It provides
* a step-by-step guide on how to construct SOQL queries, filter results using WHERE clause, retrieve related
* records, and manage data volume using the LIMIT keyword.
* 
* Topics covered in this class include:
* - Understanding the structure of a SOQL query.
* - Crafting basic SELECT statements in SOQL.
* - Applying filters using the WHERE clause in SOQL.
* - Fetching related records using Relationship queries.
* - Controlling the amount of data retrieved using the LIMIT keyword.
* 
* Users of this class can expect to gain a solid understanding of SOQL in Apex and
* be prepared to handle data retrieval tasks in Salesforce development.
* 
* @author Your Name
*/

public with sharing class SOQL {
    
    /**
     * Question 1
     * Update/Uncomment the template code to create a method
     * Returns all leads from Salesforce Org
     * @return List of all leads with Id, LastName, Company, Phone, Email
     * Update the corresponding test class and testGetAllLeads method to cover this method
     */
    public static List<Lead> getAllLeads () {
        List<Lead> leadList = [SELECT LastName, Company, Phone, Email FROM Lead];
        return leadList;
    }

    /**
     * Question 2
     * Update/Uncomment the template code to create a method
     * Returns all contacts with first name of John.
     * @return A list of Contact records.
     * Update the corresponding test class and testGetContactsByFirstName method to cover this method
     */
    public static List<Contact> GetContactsByFirstName () {
        List<Contact> consList = [SELECT Name FROM Contact LIMIT 2];
        return consList;
    }

    /**
     * Question 3
     * Update/Uncomment the template code to create a method
     * Returns the Contact Id for all contacts with last name of Smith or Jones
     * @return A list of Contact Ids.
     * Update the corresponding test class and testGetContactIdsByLastName method to cover this method
     */
    public static List<Id> getContactIdsByLastName () {
        List<Id> consIds = new List<Id>();
        List<Contact> consList = [SELECT Id FROM Contact LIMIT 2];
        for (Contact con : consList) {
            consIds.add(con.Id);
        }
        return consIds;
    }

    /**
     * Question 4
     * Update/Uncomment the template code to create a method
     * Returns List of closed won opportunities for a specific Account.
     * Example: yourMethodName('001XXXXXXXXXXXX') should return the list of closed won opportunities for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A list of Opportunities with important opportunities fields
     * Update the corresponding test class and testGetClosedWonOpportunityCountByAccount method to cover this method
     */
    public static List<Opportunity> getClosedWonOpportunityCountByAccount(Id accountId){
        List<Opportunity> oppoList = [SELECT Name, StageName, AccountId, CloseDate, Amount FROM Opportunity WHERE StageName = 'Closed Won' AND AccountId = : accountId];
        return oppoList;
    }

    /**
     * Question 5
     * Update/Uncomment the template code to create a method
     * Returns the total count of Account records.
     * @return The Integer count of Account records.
     * Update the corresponding test class and testGetAccountCount method to cover this method
     */
    public static Integer getAccountCount () {
        List<Account> accList = [SELECT Id FROM Account];
        Integer accCount = accList.size();
        return accCount;
    }

    /**
     * Question 6
     * Update/Uncomment the template code to create a method
     * Return Key Value pair of Task Id and Task records for any tasks due date within the next 7 days.
     * @return A map of Task Ids to Task records.
     * Update the corresponding test class and testGetTasksDueNextWeek method to cover this method
     */
    public static Map<Id,Task> getTasksDueNextWeek () {
        Map<Id,Task> tasksMap = new Map<Id,Task>([SELECT Id FROM Task WHERE ActivityDate = NEXT_N_DAYS:7]);
        return tasksMap;
    }

    /**
     * Question 7
     * Update/Uncomment the template code to create a method
     * Retrieves all Contacts that have a example.com domain in their Email.
     * @return A list of Contact records.
     * Update the corresponding test class and testGetContactsByEmailDomain method to cover this method
     */
    public static List<Contact> getContactByEmailDomain() {
        List<Contact> conList = [SELECT Id, Name, Email FROM Contact WHERE Email LIKE '%example.com'];
        return conList;
    }

    /**
     * Question 8
     * Retrieves all Opportunities that have a specific keyword in their Name.
     * Example: getOpportunitiesByNameKeyword('keyword') should return all Opportunities that have 'keyword' in their Name.
     * @param keyword The keyword to search for in the Opportunity Name.
     * @return A list of Opportunity records.
     */
    public static List<Opportunity> getOpportunitiesByNameKeyword(String keyword) {
        List<Opportunity> oppList = [SELECT Id, Name FROM Opportunity WHERE Name LIKE :'%'+keyword+'%'];
        return oppList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 9
     * Retrieves all Cases that Case Origin is not Web or Email or Blank
     * @return A list of Case records.
     */
    public static List<Case> getFilterCaseOrigins() {
        List<Case> caseList = [SELECT Id, Origin FROM Case WHERE (NOT Origin IN ('Web', 'Email', NULL))];
        return caseList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 10
     * Update/Uncomment the template code to create a method
     * Retrieves all Leads that have a specific Lead Source or contain a specific keyword in their Title.
     * Example: yourMethodName('Web', 'Engineer') should return all Leads that have 'Web' in their Lead Source or 'Engineer' in their Title.
     * @param leadSource The Lead Source to search for.
     * @param keyword The keyword to search for in the Lead Title.
     * @return A list of Lead records.
     * Update the corresponding test class and testGetLeadsBySourceOrTitle method to cover this method
     */
    public static List<Lead> getLeadsBySourceOrTitle(String param1, String param2) {
        List<Lead> leadsList = [SELECT Id, LastName, Company, Phone, Email FROM Lead WHERE (LeadSource LIKE : '%'+param1+'%') OR (Title LIKE : '%'+param2+'%')];
        return leadsList;

    }    

    /**
     * Question 11
     * Returns the names of all Contacts associated with an Account.
     * Example: getContactNamesByAccount('001XXXXXXXXXXXX') should return the list of Contact LastNames for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A list of Contact LastName.
     */
    public static List<String> getContactNamesByAccount(Id accountId) {
        // Create a list to hold the Contact LastNames
        List<String> lastNames = new List<String>();
        // Query the Contacts
        List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE AccountId =: accountId];
        // Loop through each Contact and add the LastName to the list
        for (Contact con : conList) {
            lastNames.add(con.LastName);
        }

        return lastNames;
    }

    /**
     * Question 12
     * Returns the total revenue for all Opportunities in a specific Stage or if the amount is greater than 10000.
     * Example: getTotalRevenueByStage('Closed Won') should return the total revenue for the found opportunities
     * @param stage The Stage value to filter Opportunities.
     * @return The total revenue.
     */
    public static Decimal getTotalRevenueByStage(String stage) {
        // Use AggregateQuery to get the total revenue
        AggregateResult[] agResults = [SELECT SUM(Amount) amountSum FROM Opportunity WHERE StageName =: stage OR Amount > 10000];
        Integer totalRevenue = Integer.valueOf(agResults[0].get('amountSum'));
        // Return the total revenue
        Decimal decTotalRevenue = Decimal.valueOf(totalRevenue);
        return decTotalRevenue; // Replace null with the variable you used to store the result
    }

    /**
     * Question 13
     * Retrieves the first 10 Accounts ordered by Name.
     * @return A list of the first 10 Accounts ordered by Name.
     */
    public static List<Account> getFirstTenAccounts() {
        List<Account> accList = [SELECT Id, Name FROM Account Order BY Name ASC LIMIT 10];
        return accList; // Replace null with the variable you used to store the result
    }
    
    /**
     * Question 14
     * Retrieves the Opportunities with an Amount greater than 100,000, ordered by CloseDate, and limited to 5 records.
     * @return A list of Opportunities with an Amount greater than 100,000, ordered by CloseDate, and limited to 5 records.
     */
    public static List<Opportunity> getHighValueOpportunities() {
        List<Opportunity> oppList = [SELECT Id, CloseDate, Amount FROM Opportunity WHERE Amount >100000 ORDER BY CloseDate LIMIT 5];
        return oppList; // Replace null with the variable you used to store the result
    }
    
    /**
     * Question 15
     * Retrieves the Contacts with the most recent Birthdate, ordered by Birthdate, and limited to 3 records.
     * @return A list of Contacts
     */
    public static List<Contact> getBirthdateContacts() {
        List<Contact> conList = [SELECT Id,BirthDate FROM Contact ORDER BY BirthDate DESC LIMIT 3];
        return conList; // Replace null with the variable you used to store the result
    }
    
    /**
     * Question 16
     * Retrieves the Cases in the Open Status, ordered by CreatedDate, and limited to 10 records with an offset of 5.
     * @return A list of Cases
     */
    public static List<Case> getCasesWithStatus() {
        List<Case> caseList = [SELECT Id, CreatedDate FROM Case WHERE Status ='Open' ORDER BY CreatedDate LIMIT 10 OFFSET 5];
        return caseList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 17
     * Returns Set of Case Ids for a specific Account.
     * Example: getCaseIdsByAccount('001XXXXXXXXXXXX') should return the set of Case Ids for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A set of Case Ids.
     */
    public static Set<Id> getCaseIdsByAccount(Id accountId) {
        // Create a set to hold the Case Ids
        Set<Id> caseSet = new Set<Id>();
        // Query the Cases
        List<Case> caseList = [SELECT Id FROM Case WHERE AccountId =: accountId];
        // Loop through each Case and add the Id to the set
        for (Case caseRecord : caseList) {
            caseSet.add(caseRecord.Id);
        }

        return caseSet; // Replace null with the variable you used to store the result
    }

    /**
     * Question 18
     * Return Map of Account Ids to Account Names Not in a specific Country.
     * Example: getAccountIdsToNamesNotInCountry('United States') should return the map of Account Ids to Account Names for Accounts that are not in the United States.
     * @param country The country to filter Accounts.
     * @return A map of Account Ids to Account Names.
     */
    public static Map<Id, String> getAccountIdsToNamesNotInCountry(String country) {
        // Create a map to hold the Account Ids to Account Names
        Map<Id, String> accountIdsToNames = new Map<Id, String>();

        // Query the Accounts
        List<Account> accList = [SELECT Id, Name FROM Account WHERE BillingCountry !=: country];
        // Loop through each Account and add the Id and Name to the map
        for (Account acc : accList) {
            accountIdsToNames.put(acc.Id, acc.Name);
        }
        return accountIdsToNames; // Replace null with the variable you used to store the result
    }

    /**
     * Question 19
     * Retrieves the Account Name for a given Contact.
     * Example: getAccountNameForContact('003XXXXXXXXXXXX') should return the Account Name for the Contact with the Id
     * @param contactId The Id of the Contact.
     * @return The Account Name of the Contact.
     */
    public static String getAccountNameForContact(String contactId) {
        List<Account> accList = [SELECT Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE Id =: contactId) LIMIT 1];
        String accName = accList[0].Name;
        return accName; // Replace null with the variable you used to store the result
    }    

    /**
     * Question 20
     * Returns single Account that has related opportunities in the same query
     * Example: getAccountAndOpportunitiesFromAccountId('001XXXXXXXXXXXX') should return the Account Name for the Account with the Id and all related Opportunities
     * @param accountId The ID of the Account.
     * @return An Account record with related Opportunities.
     */
    public static Account getAccountAndOpportunitiesFromAccountId(Id accountId) {
        Account acc = [SELECT Name, (SELECT Id, Name FROM Opportunities) FROM Account WHERE Id =: accountId LIMIT 1];
        return acc; // Replace null with the variable you used to store the result
    }

    /**
     * Question 21
     * Retrieves all contacts that have the Mailing State similar to the Account Billing State.
     * Example: getAccountsWithContactsByState('001XXXXXXXXXXXX') should return a list of Contacts that have the same Mailing State as the Account with the Id
     * @param Account Id
     * @return List of contacts with the same Mailing State as the Account Billing State
     */
    public static List<Contact> getAccountsWithContactsByState(Id accountId) {
        // Query the Account
        Account acc = [SELECT Id, BillingState FROM Account WHERE Id =: accountId];
        // Store the Account's BillingState
        List<Contact> conList = [SELECT Id, MailingState FROM Contact WHERE MailingState =: acc.BillingState];

        // Query the Contacts
        return conList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 22
     * Extracts email domains from them leads, then finds Accounts with matching website domains
     * If Lead Email = test@test.com return account with website = www.test.com
     * Example: findAccountsByLeadEmailDomains([set of lead ids]) should return a list of Accounts with matching email domains
     * @param A set of Lead Ids.
     * @return A list of Accounts with matching email domains.
     */
    public static List<Account> findAccountsByLeadEmailDomains(Set<Id> leadIds) {
        // Query the Leads
        List<Lead> leadList = [SELECT Id, Email FROM Lead WHERE Id IN : leadIds];
        // Create a set of email domains from the Leads
        Set<String> emailDomainSet = new Set<String>();
        // Loop through each Lead
        for (Lead ld : leadList) {
            if (ld.Email != null) {
                emailDomainSet.add('www.'+ld.Email.substringAfter('@'));
            }
        }

        // Query the Accounts
        List<Account> accList = [SELECT Name, Website FROM Account WHERE Website IN : emailDomainSet];
        return accList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 23
     * Clones and Inserts Opportunity Line Items from an original Opportunity to a list of cloned Opportunities.
     * Adds a randomized number between 1 to 3 to the quantity of each line item.
     * Example: cloneLineItems('001XXXXXXXXXXXX', [list of opportunity ids]) should clone the line items from the Opportunity with the Id to each Opportunity in the list
     * @param Original Opportunity Id
     * @param List of cloned Opportunity Ids
     */
    public static void cloneLineItems(Id origOppId, List<Id> cloneOppIds) {
        // Query the original Opportunity Line Items
        List<OpportunityLineItem> oppoLineItems = [SELECT Id, ListPrice, Product2Id, ProductCode, UnitPrice, PricebookEntryId FROM OpportunityLineItem WHERE OpportunityId = : origOppId];
        // Create a list to hold the new line items
        List<OpportunityLineItem> newOppoLineItems = new List<OpportunityLineItem>();
        // Generate a random number between 1 and 3
        Integer randomNumber = Integer.valueOf((Math.random()*10)/3);
        // Loop through each cloned Opportunity Id
        for (Id oppoId : cloneOppIds) {
            for (opportunityLineItem oppoLineItem : oppoLineItems) {
                OpportunityLineItem newOppoLineItem = new OpportunityLineItem();
                newOppoLineItem.UnitPrice = oppoLineItem.UnitPrice;
                newOppoLineItem.PricebookEntryId = oppoLineItem.PricebookEntryId;
                newOppoLineItem.Quantity = randomNumber;
                newOppoLineItem.OpportunityId = oppoId;
                newOppoLineItems.add(newOppoLineItem);
            }
        }  
            if (!newOppoLineItems.isEmpty()) {
                insert newOppoLineItems;
            }
    }
    
    /**
     * Question 24
     * Retrieves the Opportunity Name, Account Name, and Owner Name for Opportunities that have a Stage of 'Closed Won'.
     * Example: getOpportunityDetailsForClosedWon()
     * @return A list of filtered Opportunity
     */
    public static List<Opportunity> getOpportunityDetailsForClosedWon() {      
        List<Opportunity> oppoList = [SELECT Id, StageName, Name, Account.Name, Owner.Name, AccountId FROM Opportunity WHERE StageName = 'Closed Won'];  
        return oppoList; // Replace null with the variable you used to store the result
    }

    /**
     * Question 25
     * Sets the 'Primary_Contact__c' field for all Closed Won Opportunities to first Contact on the Account.
     * Example: setPrimaryContact() should set the 'Primary_Contact__c' field for every Opportunity in the org
     */
    public static void setPrimaryContact() {
        //Use the getOpportunityDetailsForClosedWon() method to get the Opportunities
        List<Opportunity> oppoList= SOQL.getOpportunityDetailsForClosedWon();
        // Create a set of Account Ids from the Opportunities
        Map<Id,Account> accsSet = new Map<Id, Account>([SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE Id IN: oppoList)]);
        // Query the Contacts
        List<Contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN: accsSet.keySet()];
        // Loop through each Contact and add the Account Id and Contact to the map
        Map<Id, Id> accIdConIdMap = new Map<Id, Id>();
        List<Opportunity> updatedOppos = new List<Opportunity>();
        for (Contact con : conList) {
            accIdConIdMap.put(con.AccountId, con.Id);
        }
        // Loop through each Opportunity
        for (Opportunity oppo : oppoList) {
            oppo.Primary_Contact__c = accIdConIdMap.get(oppo.AccountId);
            updatedOppos.add(oppo);
        }
                // Update the Opportunity primary contact from accountToContactMap
        update updatedOppos;
        // Update the Opportunities
    }
}