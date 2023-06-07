public with sharing class BookingLwcController {
    /// send email and update appointment
    @AuraEnabled
    public static void bookAppointment(Id appointmentID ,Id customer,String communicationMethod) {
        try {
            Appointment_Name__c appointment = new Appointment_Name__c();
                
            // get all expired cim card (Constituent/org) who has donation upcoming in next months of type credit card ()
            appointment = [
                SELECT Id, Account__c, Communication_method__c,Status__c,Account__r.Name ,Date__c,Agent__r.Agent_name__c
                  FROM Appointment_Name__c 
                WHERE Id =:appointmentID Limit 1
            ];
            if(appointment==null){
                throw new AuraHandledException('no appointment');
            }
            appointment.Account__c=customer ;
            appointment.Communication_method__c=communicationMethod;
            appointment.Status__c='Booked' ;
            update appointment;
            sendEmail(appointment);
            
        } catch (Exception err) {
            throw new AuraHandledException(err.getMessage());
        }
    }
    static void sendEmail (Appointment_Name__c appointment)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'mwissa@copticorphans.org'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Task Booked Salesforce Automation');
        mail.setSubject('Taask Finish : Booked Appointment');
        mail.setUseSignature(false);
        mail.setPlainTextBody('  Booked Appointment has been Finished ,his ID = '+appointment.Id +' between '+appointment.Account__r.Name +' and '+appointment.Agent__r.Agent_name__c +' at day '+appointment.Date__c +' \n----------------------------------------------------\n* Job: \n    ' 
                           
                              );
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}