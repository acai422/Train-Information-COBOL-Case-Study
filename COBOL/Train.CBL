         IDENTIFICATION DIVISION.                                         
         PROGRAM-ID. TRAIN.                                               
         ENVIRONMENT DIVISION.                                            
         CONFIGURATION SECTION.                                           
         INPUT-OUTPUT SECTION.                                            
         FILE-CONTROL.                                                    
             SELECT COMPAREFILE ASSIGN COMPFILE                           
                    ORGANIZATION IS SEQUENTIAL                            
                    ACCESS MODE IS SEQUENTIAL                             
                    STATUS IS FS1.                                        
             SELECT RESULTSFILE ASSIGN RESFILE                            
                    ORGANIZATION IS SEQUENTIAL                            
                    ACCESS MODE IS SEQUENTIAL                             
                    STATUS IS FS2.                                        
             SELECT MASTERFILE ASSIGN MASTFILE                            
                    ORGANIZATION IS INDEXED                               
                    ACCESS MODE IS RANDOM                                 
                    RECORD KEY IS TRAIN-NUMBER                            
                    STATUS IS FS3.                                        
         DATA DIVISION.                                                  
         FILE SECTION.                                                    
         FD  COMPAREFILE RECORDING MODE IS F                              
             RECORD CONTAINS 100.                                         
         01  TRAIN-NUM-COMP    PIC X(6).                                  
         FD  RESULTSFILE RECORDING MODE IS F                                                                         
             RECORD CONTAINS 100.                                         
         01  RESULTS           PIC X(100).                                
         FD  MASTERFILE.                                                  
         01  MASTER-REC.                                                  
             02 TRAIN-NUMBER   PIC X(6).                                  
             02 FILLER         PIC X VALUE SPACES.                        
             02 TRAIN-TYPE     PIC X.                                     
             02 FILLER         PIC X VALUE SPACES.                        
             02 TRAIN-NAME     PIC X(20).                                 
             02 TRAIN-DEP-STN  PIC X(10).                                 
             02 TRAIN-DEP-TIME PIC X(5).                                  
             02 FILLER         PIC X VALUE SPACES.                        
             02 TRAIN-ARR-STN  PIC X(10).                                 
             02 TRAIN-ARR-TIME PIC X(5).                                  
             02 FILLER         PIC X(2) VALUE SPACES.                     
             02 TRAIN-FARE     PIC X(10).                                 
             02 FILLER         PIC X(28) VALUE SPACES.                    
         WORKING-STORAGE SECTION.                                         
        01 STAR-LINE PIC X(100) VALUE '********************************  
       -    '**********************************************************'.
         01 DATE-LINE.                                                    
            02  FILLER           PIC X(8) VALUE 'DATE: - '.               
            02  HDR-DATE.                                                 
                05  HDR-DATE-MM   PIC XX.                                  
                05  FILLER        PIC X VALUE '/'.                         
                05  HDR-DATE-DD   PIC XX.                                  
                05  FILLER        PIC X VALUE '/'.                         
                05  HDR-DATE-YYYY PIC X(4).                                
         01 HOLD-DATE.                                                    
             02 HOLD-DATE-YYYY   PIC 9(4).                                
             02 HOLD-DATE-MM     PIC 99.                                  
             02 HOLD-DATE-DD     PIC 99.                                  
             02 HOLD-TIME-HH     PIC 99.                                  
             02 HOLD-TIME-MM     PIC 99.                                  
         01 TIME-LINE.                                                    
             02 FILLER           PIC X(8) VALUE 'TIME: - '.               
             02 HDR-TIME.                                                 
                05 HDR-TIME-HH    PIC XX.                                  
                05 FILLER         PIC X VALUE ':'.                         
                05 HDR-TIME-MM    PIC XX.                                  
         01 HDR-LINE-1.                                                   
             02 FILLER PIC X(40) VALUE SPACES.                            
             02 FILLER PIC X(18) VALUE 'REPORT GENERATION'.               
         01 HDR-LINE-2.                                                   
             02 FILLER PIC X(40) VALUE SPACES.                            
             02 FILLER PIC X(18) VALUE 'PREPARED BY AARON'.               
         01 COL-LINE-1.                                                   
             02 FILLER PIC X(5) VALUE 'TRAIN'.                            
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'TRAIN'.                             
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'TRAIN'.                            
             02 FILLER PIC X(12) VALUE SPACES.                            
             02 FILLER PIC X(7) VALUE 'TRAIN'.                            
             02 FILLER PIC X(8) VALUE SPACES.                             
             02 FILLER PIC X(8) VALUE 'TRAIN'.                            
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(8) VALUE 'TRAIN'.                            
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'TRAIN'.                            
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'TRAIN'.                            
         01 COL-LINE-2.                                                   
             02 FILLER PIC X(5) VALUE 'NUMB'.                             
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'TYPE '.                            
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'NAME '.                            
             02 FILLER PIC X(12) VALUE SPACES.                            
             02 FILLER PIC X(7) VALUE 'DEP-STN'.                          
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(8) VALUE 'DEP-TIME'.                         
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(8) VALUE 'ARR-STN '.                         
             02 FILLER PIC X(5) VALUE SPACES.                             
             02 FILLER PIC X(8) VALUE 'ARR-TIME'.                         
             02 FILLER PIC X(2) VALUE SPACES.                             
             02 FILLER PIC X(5) VALUE 'FARE '.                            
         01 PRINT-LINE.                                                   
             02 TRAIN-NUM-P      PIC X(6).                                
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 TRAIN-TYPE-P     PIC X.                                   
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 TRAIN-NAME-P     PIC X(20).                               
             02 TRAIN-DEP-STN-P  PIC X(10).                               
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 TRAIN-DEP-TIME-P PIC X(8).                                
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 TRAIN-ARR-STN-P  PIC X(10).                               
             02 FILLER           PIC X(3)  VALUE SPACES.                  
             02 TRAIN-ARR-TIME-P PIC X(5).                                
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 TRAIN-FARE-P     PIC X(10).                               
             02 FILLER           PIC X(3)  VALUE SPACES.                  
         01 REC-ERROR.                                                    
             02 NUM-ERROR        PIC X(6).                                
             02 FILLER           PIC X(5)  VALUE SPACES.                  
             02 ERROR-M          PIC X(16) VALUE 'RECORD NOT FOUND'.      
         01 EOF1-SWITCH          PIC X.                                   
            88 EOF1                       VALUE '1'.                      
            88 NOT-EOF1                   VALUE '0'.                      
         01 EOF2-SWITCH          PIC X.                                     
            88 EOF2                       VALUE '1'.                      
            88 NOT-EOF2                   VALUE '0'.                      
         01 RECORD-FOUND         PIC X.                                   
            88 NOT-FOUND                  VALUE 'N'.                      
            88 FOUND                      VALUE 'Y'.                      
         01 FS1                  PIC XX.                                  
         01 FS2                  PIC XX.                                  
         01 FS3                  PIC XX.                                  
         PROCEDURE DIVISION.                                              
         MAIN-LINE.                                                       
             PERFORM INITIALIZATION.                                      
             PERFORM WRITE-HEADER.                                        
             PERFORM READ-COMPARE UNTIL EOF1.                             
             PERFORM FINALIZATION.                                        
             STOP RUN.                                                    
         READ-COMPARE.                                                    
             READ COMPAREFILE                                             
                 AT END SET EOF1 TO TRUE                                  
             END-READ.                                                    
             IF (FS1 = 10) GO TO FINALIZATION.                            
             MOVE TRAIN-NUM-COMP TO TRAIN-NUMBER.                         
             PERFORM COMP-PARA.                                           
         COMP-PARA.                                                       
             READ MASTERFILE KEY IS TRAIN-NUMBER                          
                  INVALID KEY SET NOT-FOUND TO TRUE                       
                  NOT INVALID KEY SET FOUND TO TRUE                        
             END-READ.                                                    
             IF FS3 NOT = 0                                               
               DISPLAY 'ERROR'                                           
               EVALUATE TRUE                                                
               WHEN FOUND                                                 
                   PERFORM WRITE-RECORD                                  
               WHEN NOT-FOUND                                             
                   MOVE TRAIN-NUMBER TO NUM-ERROR                        
                   WRITE RESULTS FROM REC-ERROR                          
               END-EVALUATE.                                              
          WRITE-RECORD.                                                   
             MOVE TRAIN-NUMBER TO TRAIN-NUM-P.                            
             MOVE TRAIN-TYPE TO TRAIN-TYPE-P.                             
             MOVE TRAIN-NAME TO TRAIN-NAME-P.                             
             MOVE TRAIN-DEP-STN TO TRAIN-DEP-STN-P.                       
             MOVE TRAIN-DEP-TIME TO TRAIN-DEP-TIME-P.                     
             MOVE TRAIN-ARR-STN TO TRAIN-ARR-STN-P.                       
             MOVE TRAIN-ARR-TIME TO TRAIN-ARR-TIME-P.                     
             MOVE TRAIN-FARE TO TRAIN-FARE-P.                             
             WRITE RESULTS FROM PRINT-LINE.                               
         INITIALIZATION.                                                  
             OPEN INPUT COMPAREFILE.                                      
             IF (FS1 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
             OPEN INPUT MASTERFILE.                                       
             IF (FS2 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
             OPEN OUTPUT RESULTSFILE.                                     
             IF (FS3 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
         WRITE-HEADER.                                                    
             MOVE FUNCTION CURRENT-DATE(1:12) TO HOLD-DATE.               
             MOVE HOLD-DATE-YYYY TO HDR-DATE-YYYY.                        
             MOVE HOLD-DATE-MM TO HDR-DATE-MM.                            
             MOVE HOLD-DATE-DD TO HDR-DATE-DD.                            
             MOVE HOLD-TIME-HH TO HDR-TIME-HH.                            
             MOVE HOLD-TIME-MM TO HDR-TIME-MM.                            
             WRITE RESULTS FROM STAR-LINE.                                
             WRITE RESULTS FROM DATE-LINE.                                
             WRITE RESULTS FROM TIME-LINE.                                
             WRITE RESULTS FROM HDR-LINE-1.                               
             WRITE RESULTS FROM HDR-LINE-2.                               
             WRITE RESULTS FROM STAR-LINE.                                
             WRITE RESULTS FROM COL-LINE-1.                               
             WRITE RESULTS FROM COL-LINE-2.                               
             WRITE RESULTS FROM STAR-LINE.                                
         FINALIZATION.                                                    
             WRITE RESULTS FROM STAR-LINE.                                
             CLOSE COMPAREFILE.                                           
             IF (FS1 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
             CLOSE MASTERFILE.                                            
             IF (FS2 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
             CLOSE RESULTSFILE.                                           
             IF (FS3 = 0) DISPLAY 'SUCCESS'                               
             ELSE DISPLAY 'ERROR'                                         
             END-IF.                                                      
             STOP RUN.                                                    
         END PROGRAM TRAIN.                                                                                                                                                
