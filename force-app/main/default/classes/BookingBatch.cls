global class BookingBatch implements Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions   
    global Iterable<sObject> start(Database.BatchableContext bc)
    {
        System.debug('Begining of Start Method');
        
        // Date today;
        // if (Test.isRunningTest()){
        //     today = Date.newInstance(2023, 03, 20);
        // } else{
        //     today = Date.today();
        // }
        List<Schedule_setup__c> scList = new List<Schedule_setup__c>();
        
        // get all expired cim card (Constituent/org) who has donation upcoming in next months of type credit card ()
        scList = [
            SELECT Id, Agent__c,status__c, Recurrence__c, Start_date__c,
            Next_Appointment_date__c, Close_date__c, End_Time__c, Start_time__c FROM Schedule_setup__c
            where status__c='Open'
            
        ]; 
       
        return scList;      
    }

    global void execute(Database.BatchableContext bc, List<Schedule_setup__c> scope)
    {
        System.debug('# BookingBatch - execute - * Started');
        //call About Expire Batch Helper Class
        BookingBatchHelper BookingBatchHelper = New BookingBatchHelper(scope);
    }

    //finish Method Call Send Email to Support
    global void finish(Database.BatchableContext bc)
    {
        System.debug('# BookingBatch - finish - * Started');

        //Select Batch Job Data
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug('finish Method - jobs : '+job);

        // call send email Method
        
        if (Test.isRunningTest()){
            sendEmail(job);
        }
        else if (job.NumberOfErrors>0)
        {sendEmail(job);}
    }    

    //Send Email Method to Support
    private void sendEmail (AsyncApexJob job)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'mwissa@copticorphans.org'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Task Salesforce Automation');
        mail.setSubject('Batch Finish : BookingBatch');
        mail.setUseSignature(false);
        mail.setPlainTextBody('  BookingBatch has been Finished.\n----------------------------------------------------\n* Job: \n    ' 
                              + job
                              );
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}