// @isTest
// public class TestAboutExpiry {
//     @testSetup
//     static void dataSetup() {
//         Id recordTypeIdHouseholdAccount = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Household Account').getRecordTypeId();  
//         Id recordTypeIdGateway = Schema.SObjectType.ChargentBase__Gateway__c.getRecordTypeInfosByName().get('Authorize.net').getRecordTypeId();

//         ChargentBase__Gateway__c sGateway = new ChargentBase__Gateway__c(
//             RecordTypeId = recordTypeIdGateway,                                                                 
//             ChargentBase__Active__c = true,                                                                
//             Name = 'Gateway test USD CC'  ,
//             ChargentBase__Available_Card_Types__c = 'Visa; Mastercard; Discover; American Express',         // Available Card Types
//             ChargentBase__Available_PR_Transaction_Types__c = 'Charge Full Amount; Authorize Full Amount',  // Available PR Transaction Types
//             ChargentBase__Credit_Card_Data_Handling__c = 'Never Clear',                                     // Credit Card / Bank Account Data Handling
//             ChargentBase__Available_Payment_Methods__c = 'Credit Card',                                     // Available Payment Methods
//             ChargentBase__Inherit_Chargent_Currency__c = true,
//             ChargentBase__Accounting_Seed_Integration__c = true,
//             ChargentBase__Test_Mode__c = true,
//             ChargentBase__Require_CVV__c = true                                                                   
//         );
//         insert sGateway;
//         List<Account> housHoldList = new List<Account>();
//         account cchousehold=new account(
//             Name = 'housHoldAcctest',
//             CurrencyIsoCode = 'USD',
//             DR_Region__c = 'Australia-No Postal Code',
//             RecordTypeId = recordTypeIdHouseholdAccount,
//             Organization_Email__c = 'mwissa@copticorphans.org'
//         );
//         housHoldList.add(cchousehold);
       
//         Database.insert(housHoldList);
        
//         Id recordTypeIdConstituents = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Constituents').getRecordTypeId();
//         List<Contact> constituentList = new List<Contact>();
//         Contact cconstituent = new contact(
//             FirstName='Testt',
//             LastName='constituent',
//             CurrencyIsoCode='USD',
//             Salutation='Mr.',
//             Email = 'mwissa@copticorphans.org',
//             DR_Region__c = 'Australia-No Postal Code',
//             recordtypeid = recordTypeIdConstituents,
//             AccountId = cchousehold.Id,
//             Family_Relationship_Role__c = 'Head of Household',
//             Constituent_Status__c = 'Active',
//             npsp__Primary_Affiliation__c=cchousehold.Id
//         );
//         ConstituentList.add(cconstituent);
//         Contact cconstituentNoEmail = new contact(
//             FirstName='Testt',
//             LastName='constituent',
//             CurrencyIsoCode='USD',
//             Salutation='Mr.',
//             //Email = 'mwissa@copticorphans.org',
//             DR_Region__c = 'Australia-No Postal Code',
//             recordtypeid = recordTypeIdConstituents,
//             AccountId = cchousehold.Id,
//             Family_Relationship_Role__c = 'Head of Household',
//             Constituent_Status__c = 'Active',
//             npsp__Primary_Affiliation__c=cchousehold.Id
//         );
//         ConstituentList.add(cconstituentNoEmail);
//         // contact constituentEmail = new contact(
//         //     FirstName = 'ccexptest',
//         //     LastName = 'ccexptest',
//         //     Email = 'mwissa@copticorphans.org',
//         //     CurrencyIsoCode = 'USD', 
//         //     DR_Region__c = 'Australia-No Postal Code',
//         //     recordtypeid = recordTypeIdConstituents,
//         //     AccountId = cchousehold.Id,
//         //     Family_Relationship_Role__c = 'Head of Household',
//         //     Constituent_Status__c = 'Active',
//         //     Salutation = 'Mr.'
//         // );
//         //ConstituentList.add(constituentEmail);
//         Database.insert(ConstituentList);
         
//         List<CIM_Data__c> cIMlist = new List<CIM_Data__c>();
//         // Id recordTypeIdGateway = Schema.SObjectType.gateway.getRecordTypeInfosByName().get('Authorize.net Sandbox Acc USD').getRecordTypeId();
//         CIM_Data__c constCIM =new CIM_Data__c(
//             Constituent__c= cconstituent.Id,
//             Billing_Email__c='mwissa@copticorphans.org',
//             Card_Expiration_Month__c='04',
//             Card_Expiration_Year__c='2023',
//             Gateway__c =sGateway.Id,
//             Name='Visa 4242--11/21 USD',
//             Expiry_Automation_fullfiled__c = FALSE,
//             Deactivated_Card__c = FALSE,
//             CC_Name__c='Mina Ragaee',
//             CC_Last_4__c='4242',
//             CC_Type__c='Visa'
            
//         );
//         cIMlist.add(constCIM);
//         CIM_Data__c constCIMnoBilling =new CIM_Data__c(
//             Constituent__c= cconstituentNoEmail.Id,
//             //Billing_Email__c='mwissa@copticorphans.org',
//             Card_Expiration_Month__c='04',
//             Card_Expiration_Year__c='2023',
//             Gateway__c =sGateway.Id,
//             Name='Visa 4242--11/21 USD',
//             Expiry_Automation_fullfiled__c = FALSE,
//             Deactivated_Card__c = FALSE,
//             CC_Name__c='Mina Ragaee',
//             CC_Last_4__c='4242',
//             CC_Type__c='Visa'
//         );
//         cIMlist.add(constCIMnoBilling);
//         CIM_Data__c orgCIM =new CIM_Data__c(
//             Organization__c= cchousehold.Id,
//             Billing_Email__c='mwissa@copticorphans.org',
//             Card_Expiration_Month__c='04',
//             Card_Expiration_Year__c='2023',
//             Gateway__c = sGateway.Id,
//             Name='Visa 4242--11/21 USD',
//             CC_Name__c='Mina Ragaee',
//             CC_Last_4__c='4242',
//             CC_Type__c='Visa'
//         );
//         cIMlist.add(orgCIM);
//         CIM_Data__c OrgCIMnoBillingHasOrgEmail =new CIM_Data__c(
//             Organization__c= cchousehold.Id,
//             //Billing_Email__c='mwissa@copticorphans.org',
//             Card_Expiration_Month__c='04',
//             Card_Expiration_Year__c='2023',
//             Gateway__c =sGateway.Id,
//             Name='Visa 4242--11/21 USD',
//             Expiry_Automation_fullfiled__c = FALSE,
//             Deactivated_Card__c = FALSE,
//             CC_Name__c='Mina Ragaee',
//             CC_Last_4__c='4242',
//             CC_Type__c='Visa'
//         );
//         cIMlist.add(OrgCIMnoBillingHasOrgEmail);
       
//         Database.insert(cIMlist);
//         System.debug('test class - cIMlist : ' + cIMlist.size());
        
//         List<opportunity> opportunitiesList = new List<opportunity>();
//         Id recordTypeIdDonation = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Donation').getRecordTypeId();
        
//         opportunity constDonat = new opportunity(
//             One_Time_Gift_Type__c = 'One-Time Gift to Child',             
//             RecordTypeId = recordTypeIdDonation,                               
//             // AccountId=cconstituent.Id,
//             // npsp__Primary_Contact__c = cconstituent.Id,
//             amount=10,
//             //PayRequest__c = true,
//             Gift_Type__c='Pledged',
//             Name=cconstituentNoEmail.Full_Name__c + ' Test ',
//             StageName='Pledged',
//             CHG_Card_DD_to_Use__c=constCIMnoBilling.Id,
//             CurrencyIsoCode='USD',
//             CloseDate=date.today()
//             //Currency_Is_Correct__c=true,
//             //Automation__c='About to expire process'
//         );
//         opportunitiesList.add(constDonat);
//         opportunity constDonat1 = new opportunity(
//             One_Time_Gift_Type__c = 'One-Time Gift to Child',             
//             RecordTypeId = recordTypeIdDonation,                               
//             // AccountId=cconstituent.Id,
//             // npsp__Primary_Contact__c = cconstituent.Id,
//             amount=10,
//             //PayRequest__c = true,
//             Gift_Type__c='Pledged',
//             Name=cconstituent.Full_Name__c + ' Test ',
//             StageName='Pledged',
//             CHG_Card_DD_to_Use__c=constCIM.Id,
//             CurrencyIsoCode='USD',
//             CloseDate=date.today()
//             //Currency_Is_Correct__c=true,
//             //Automation__c='About to expire process'
//         );
//         opportunitiesList.add(constDonat1);
//         // opportunity constDonat2 = new opportunity(
//         //     One_Time_Gift_Type__c = 'One-Time Gift to Child',             
//         //     RecordTypeId = recordTypeIdDonation,                               
//         //     // AccountId=cconstituent.Id,
//         //     // npsp__Primary_Contact__c = cconstituent.Id,
//         //     amount=10,
//         //     //PayRequest__c = true,
//         //     Gift_Type__c='Pledged',
//         //     Name=cconstituent.Full_Name__c + ' Test ',
//         //     StageName='Pledged',
//         //     CHG_Card_DD_to_Use__c=constCIMnoBillingHasConstEmail.Id,
//         //     CurrencyIsoCode='USD',
//         //     CloseDate=date.today()
//         //     //Currency_Is_Correct__c=true,
//         //     //Automation__c='About to expire process'
//         // );
//         // opportunitiesList.add(constDonat2);
        
//         opportunity orgDonat = new opportunity(
//             One_Time_Gift_Type__c = 'One-Time Gift to Child',             
//             RecordTypeId = recordTypeIdDonation,                               
//            amount=10,
//             //PayRequest__c = true,
//             Gift_Type__c='Pledged',
//             Name=cconstituent.Full_Name__c + ' Test ',
//             StageName='Pledged',
//             Card_DD_to_Use_Organization__c=orgCIM.Id,
//             CurrencyIsoCode='USD',
//             CloseDate=date.today()
//         );
//         opportunitiesList.add(orgDonat);
//         opportunity orgDonat1 = new opportunity(
//             One_Time_Gift_Type__c = 'One-Time Gift to Child',             
//             RecordTypeId = recordTypeIdDonation,                               
//            amount=10,
//             //PayRequest__c = true,
//             Gift_Type__c='Pledged',
//             Name=cconstituent.Full_Name__c + ' Test ',
//             StageName='Pledged',
//             Card_DD_to_Use_Organization__c=orgCIMnoBillingHasOrgEmail.Id,
//             CurrencyIsoCode='USD',
//             CloseDate=date.today()
//         );
//         opportunitiesList.add(orgDonat1);
        
//         Database.insert(opportunitiesList);
//         system.debug('CIM List ' +cIMlist);
//     }
    
//     @isTest
//     static void testInvokingBookingBatchCon()
//     {
//         System.Test.startTest();
//         InvokingBookingBatch IAE= new InvokingBookingBatch();
//         IAE.execute(null);
//         System.Test.stopTest();
//     }
    

// }