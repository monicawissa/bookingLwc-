public with sharing class BookingBatchHelper
{
    
    public BookingBatchHelper(List<Schedule_setup__c> scList)
    {
        for (Schedule_setup__c sc : scList)
        {
            if(sc.Recurrence__c=='One Time'){
                try{
                    Appointment_Name__c sobj = new Appointment_Name__c(
                        Name = sc.Next_Appointment_date__c+' : '+sc.Start_time__c+' to '+sc.End_Time__c,                            
                        Agent__c = sc.Agent__c,                  
                        //?  Account__c = 'undefined',                
                        Status__c = 'Available',                 
                        //? Communication_method__c = 'Face to Face',  
                        Schedule_setup__c = sc.Id,           
                        Date__c = sc.Next_Appointment_date__c,      
                        Start_time__c = sc.Start_time__c,             
                        End_Time__c = sc.End_Time__c               
                      );
                      insert sobj;
                      sc.status__c='Closed';
                    update sc;
                }catch (System.DmlException e) 
                {
                     System.debug('we caught a dml exception: ' + e.getDmlMessage(0));
                }
            }
            if(sc.Recurrence__c=='Daily'&&(sc.Next_Appointment_date__c.daysBetween(date.today())<15||sc.Start_date__c==sc.Next_Appointment_date__c)){
                try{
                    //create Daily to 30 as limitation
                    Integer nOfDays=30;
                    if(sc.Close_date__c!=null){

                         nOfDays=sc.Next_Appointment_date__c.daysBetween(sc.Close_date__c);
                         if (nOfDays>30) {
                            nOfDays=30;
                         }
                    }
                    List<Appointment_Name__c> appointmentList= new List<Appointment_Name__c>();
                    Date nextDate=sc.Next_Appointment_date__c;
                    for(Integer cnt=0;cnt<nOfDays&&nextDate<=sc.Close_date__c;cnt++){
                        Appointment_Name__c sobj = new Appointment_Name__c(
                            Name =nextDate+' : '+sc.Start_time__c+' to '+sc.End_Time__c,                            
                            Agent__c = sc.Agent__c,                  
                            //?  Account__c = 'undefined',                
                            Status__c = 'Available',                 
                            //? Communication_method__c = 'Face to Face',  
                            Schedule_setup__c = sc.Id,           
                            Date__c = nextDate,      
                            Start_time__c = sc.Start_time__c,             
                            End_Time__c = sc.End_Time__c               
                        );
                        nextDate.addDays(1);
                        appointmentList.add(sobj);
                    }
                    insert appointmentList; 
                    sc.Next_Appointment_date__c=nextDate;
                    if(sc.Close_date__c!=null&& nextDate>sc.Close_date__c)sc.status__c='Closed';
                    update sc;
                }catch (System.DmlException e) 
                {
                     System.debug('we caught a dml exception: ' + e.getDmlMessage(0));
                }
            }
            if(sc.Recurrence__c=='Weekly'&&(sc.Next_Appointment_date__c.daysBetween(date.today())<15||sc.Start_date__c==sc.Next_Appointment_date__c)){
                try{
                    //create week to Month as limitation
                    Integer nOfWeeks=4;
                    if(sc.Close_date__c!=null){
                        nOfWeeks=sc.Next_Appointment_date__c.daysBetween(sc.Close_date__c);
                        if (nOfWeeks>4) {
                        nOfWeeks=4;
                        }
                    }
                    List<Appointment_Name__c> appointmentList= new List<Appointment_Name__c>();
                    Date nextDate=sc.Next_Appointment_date__c;
                    for(Integer cnt=0;cnt<nOfWeeks&&nextDate<=sc.Close_date__c;cnt++){
                        Appointment_Name__c sobj = new Appointment_Name__c(
                            Name =nextDate+' : '+sc.Start_time__c+' to '+sc.End_Time__c,                            
                            Agent__c = sc.Agent__c,                  
                            //?  Account__c = 'undefined',                
                            Status__c = 'Available',                 
                            //? Communication_method__c = 'Face to Face',  
                            Schedule_setup__c = sc.Id,           
                            Date__c = nextDate,      
                            Start_time__c = sc.Start_time__c,             
                            End_Time__c = sc.End_Time__c               
                        );
                        nextDate.addDays(7);
                        appointmentList.add(sobj);
                    }
                    insert appointmentList; 
                    sc.Next_Appointment_date__c=nextDate;
                    if(sc.Close_date__c!=null&& nextDate>sc.Close_date__c)sc.status__c='Closed';
                    update sc;
                }catch (System.DmlException e) 
                {
                     System.debug('we caught a dml exception: ' + e.getDmlMessage(0));
                }
            }
            if(sc.Recurrence__c=='Monthly'&&(sc.Next_Appointment_date__c.daysBetween(date.today())<15||sc.Start_date__c==sc.Next_Appointment_date__c)){
                try{Date nextDate=sc.Next_Appointment_date__c;
                    Appointment_Name__c sobj = new Appointment_Name__c(
                            Name =nextDate+' : '+sc.Start_time__c+' to '+sc.End_Time__c,                            
                            Agent__c = sc.Agent__c,                  
                            //?  Account__c = 'undefined',                
                            Status__c = 'Available',                 
                            //? Communication_method__c = 'Face to Face',  
                            Schedule_setup__c = sc.Id,           
                            Date__c = nextDate,      
                            Start_time__c = sc.Start_time__c,             
                            End_Time__c = sc.End_Time__c               
                        );
                        nextDate.addMonths(1);
                        insert sobj; 
                        sc.Next_Appointment_date__c=nextDate;
                        if(sc.Close_date__c!=null&& nextDate>sc.Close_date__c)sc.status__c='Closed';
                        update sc;
                    
                    
                }catch (System.DmlException e) 
                {
                     System.debug('we caught a dml exception: ' + e.getDmlMessage(0));
                }
            }
        }
    }

   
}