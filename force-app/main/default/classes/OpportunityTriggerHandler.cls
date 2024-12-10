public with sharing class OpportunityTriggerHandler {
    public static void amountValidation(List<Opportunity> oppoNewList){
        List<Opportunity> oppoListForUpdate = new List<Opportunity>();
        for (Opportunity oppo : oppoNewList) {
            if (oppo.Amount < 5000) {
                oppo.Amount.addError('Opportunity amount must be greater than 5000');
            }
        }
    }
    public static void deleteCloseWonOpportunity(List<Opportunity> oppoDelList){
        List<Opportunity> preventOppoList = new List<Opportunity>();

        Map<Id, Opportunity> oppoMap = new Map<Id, Opportunity>();
        for (Opportunity oppo : oppoDelList) {
            oppoMap.put(oppo.AccountId, oppo);
        }
        Map<Id, String> accsMap = new Map<Id, String>();
        List<Account> accList = [SELECT Industry FROM Account WHERE Id IN : oppoMap.keySet()];
        for (Account acc : accList) {
            accsMap.put(acc.Id, acc.Industry);
        }
        for (Opportunity oppo : oppoMap.values()) {
            if (oppo.StageName == 'Closed Won' && accsMap.get(oppo.AccountId) == 'Banking') {
                oppo.StageName.addError('Cannot delete closed opportunity for a banking account that is won');
            }
        }
        
    }
    public static void setPrimaryContact(List<Opportunity> oppoUpdatedList){
        List<Opportunity> oppoListForUpdate = new List<Opportunity>();
        Map<Opportunity, Id> oppoMap = new Map<Opportunity, Id>();
        for (Opportunity oppo : oppoUpdatedList) {
            oppoMap.put(oppo, oppo.AccountId);
        }
        Map<Id, Id> conAccMap = new Map<Id, Id>();
        List<Contact> conList = [SELECT Id, AccountId, Title FROM Contact WHERE AccountId IN : oppoMap.values() AND Title ='CEO'];
        for (Contact con : conList) {
            conAccMap.put(con.AccountId, con.Id);
        }
        System.debug('conAccMap '+ conAccMap);
        for (Opportunity oppoRec : oppoMap.keySet()) {
                oppoRec.Primary_Contact__c = conAccMap.get(oppoRec.AccountId);
                oppoListForUpdate.add(oppoRec);
                System.debug('oppoRec ID '+ oppoRec.Id +' OPPO AccountID ' +oppoRec.AccountID+' oppoRec.Primary_Contact__c '+ oppoRec.Primary_Contact__c + ' conAccMap.get(oppoRec.AccountId) ' + conAccMap.get(oppoRec.AccountId));
        }
    }
}