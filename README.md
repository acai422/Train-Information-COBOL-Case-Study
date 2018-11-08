# Train
## Purpose: A Case Study developed by IBM to test our COBOL knowledge
#### TASKS: ####
* Create 3 PS files
  * "USER-ID.INPUT.SEQFILE" for storing detailed information of train .
  * "USER-ID.COMPARE.SEQFILE" used to store the primary key values.
  * "USER-ID.RESULT.PS" used to storing the result of comparison.
* Create 1 VSAM Master File called "USER-ID.VSAM.KSDS99".
* Load the train information from "USER-ID.INPUT.SEQFILE" and load it to "USER-ID.VSAM.KSDS99". 
* In COBOL program:
  1. Declare TRAIN-NUMBER as *primary key* and TRAIN-ARR-STN as *alternative key*
  2. Compare the TRAIN-NUMBERs in "USER-ID.COMPARE.SEQFILE" to the TRAIN-NUMBERs in "USER-ID.VSAM.KSDS99". If a matching train is available write all of the train's information (TRAIN-NUMBER, TRAIN-TYPE, TRAIN-NAME, ECT.) into "USER-ID.RESULT.PS".
  3. If the TRAIN-NUMBER is not found, display an error message.
  4. Get the System Date and Time
  5. Check the file status after each OPEN, READ, and CLOSE.
  
All records are in the following format:

**MASTER VSAM FILE RECORD LAYOUT:**

NAME           | FIELD TYPE
---------------|--------------
TRAIN-NUMBER   | 9(6)
TRAIN-NAME     | X(20)
TRAIN-TYPE     | X(01)
TRAIN-DEP-STN  | X(10)
TRAIN-DEP-TIME | X(05)
TRAIN-ARR-STN  | X(10)
TRAIN-ARR-TIME | X(05)
TRAIN-CURR-DATE| X(10)
TRAIN-DEP-LATE | X(03)
TRAIN-ARR-LATE | X(03)


**INPUT FILE RECORD LAYOUT:**

NAME           | FIELD TYPE          | RECORD 1 VALUE | RECORD 2 VALUE  | RECORD 3 VALUE | RECORD 4 VALUE
---------------|---------------------|----------------|-----------------|----------------|----------------
TRAIN-NUMBER   | 9(6) (Primary Key)  | 123456         | 23456           | 523456         | 723456
TRAIN-NAME     | X(20)               | S              | S               | M              | M
TRAIN-TYPE     | X(01)               | MYSORE EXPRESS | CHENNAI EXPRESS | BANGALORE MAIL | MYSORE MAIL
TRAIN-DEP-STN  | X(10)               | MYSORE         | CHENNAI         | BANGALORE      | MYSORE
TRAIN-DEP-TIME | X(05)               | 18:30          | 18:30           | 18:30          | 12:30
TRAIN-ARR-STN  | X(10)               | CHENNAI        | MYSORE          | MYSORE         | BANGALORE
TRAIN-ARR-TIME | X(05)               | 04:30          | 04:30           | 20:30          | 16:30
TRAIN-FARE     | X(10)               | 400            | 400             | 120            | 120


**COMPARE FILE LAYOUT**

NAME         | FIELD TYPE | RECORD 1 | RECORD 2 | RECORD 3 | RECORD 4 | RECORD 5 | RECORD 6 | RECORD 7
-------------|------------|----------|----------|----------|----------|----------|----------|----------
TRAIN-NUMBER | 9(6)       | 123456   | 23456    | 323456   | 423456   | 523456   | 623456   | 523456
