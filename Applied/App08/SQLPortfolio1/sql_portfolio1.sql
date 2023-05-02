--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio1_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio1.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Tutorial Class No: 3

DROP TABLE policy PURGE;

/*Task 1: CREATE table POLICY and non FK constraints*/
CREATE TABLE policy( 
    policy_id           NUMBER(7) NOT NULL,
    prop_no             NUMBER(4) NOT NULL,
    policy_startdate    Date      NOT NULL,
    policy_type_code    CHAR(1)   NOT NULL,
    policy_length       NUMBER(3) NOT NULL,
    insurer_code        CHAR(3)   NOT NULL
);

COMMENT ON COLUMN policy.policy_id IS
    'Policy ID (unique for each policy record)';

COMMENT ON COLUMN policy.prop_no IS
    'Property number';
    
COMMENT ON COLUMN policy.policy_startdate IS
    'Policy start date';
    
COMMENT ON COLUMN policy.policy_type_code IS
    'Policy type code';
    
COMMENT ON COLUMN policy.policy_length IS
    'Policy length';
    
COMMENT ON COLUMN policy.insurer_code IS
    'Insurer code';
    
ALTER TABLE policy
    ADD CONSTRAINT policy_pk PRIMARY KEY (policy_id);
    
ALTER TABLE policy
    ADD CONSTRAINT unique_policy_startdate UNIQUE (policy_startdate);
    
ALTER TABLE policy
    ADD CONSTRAINT check_policy_length CHECK (policy_length >= 6);

/*Task 1: Add FK constraints*/
ALTER TABLE policy
    ADD CONSTRAINT prop_no_fk FOREIGN KEY (prop_no) 
        REFERENCES property (prop_no);
        
ALTER TABLE policy
    ADD CONSTRAINT unique_prop_no UNIQUE (prop_no);
    
ALTER TABLE policy
    ADD CONSTRAINT policy_typecode_fk FOREIGN KEY (policy_type_code)
        REFERENCES policy_type (policy_type_code);
        
ALTER TABLE policy
    ADD CONSTRAINT unique_policy_typecode UNIQUE (policy_type_code);
    
ALTER TABLE policy
    ADD CONSTRAINT insurer_code FOREIGN KEY (insurer_code)
        REFERENCES insurer (insurer_code);
        
/*Task 2*/



/*Task 3*/



/*Task 4*/



--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF