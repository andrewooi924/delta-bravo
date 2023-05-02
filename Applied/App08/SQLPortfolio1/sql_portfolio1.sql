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
    ADD CONSTRAINT chk_policy_length CHECK (policy_length >= 6);

ALTER TABLE policy
    ADD CONSTRAINT policy_startdate_uq UNIQUE (policy_startdate);

/*Task 1: Add FK constraints*/
ALTER TABLE policy
    ADD CONSTRAINT prop_no_fk FOREIGN KEY (prop_no) 
        REFERENCES property (prop_no);
        
ALTER TABLE policy
    ADD CONSTRAINT prop_no_uq UNIQUE (prop_no);
        
ALTER TABLE policy
    ADD CONSTRAINT policy_typecode_uq UNIQUE (policy_type_code);    
    
ALTER TABLE policy
    ADD CONSTRAINT policy_typecode_fk FOREIGN KEY (policy_type_code)
        REFERENCES policy_type (policy_type_code);
    
ALTER TABLE policy
    ADD CONSTRAINT insurer_code FOREIGN KEY (insurer_code)
        REFERENCES insurer (insurer_code);
        
/*Task 2*/
INSERT INTO policy VALUES (
    policy_seq.NEXTVAL,
    7145,
    to_date('21-Apr-2023', 'dd-Mon-yyyy'),
    ( SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Building')),
    12,
    ( SELECT insurer_code FROM insurer WHERE upper(insurer_name) = upper('Landlord Association'))
);

ALTER TABLE policy DISABLE CONSTRAINT policy_startdate_uq;
ALTER TABLE policy DISABLE CONSTRAINT policy_typecode_uq;

INSERT INTO policy VALUES (
    policy_seq.NEXTVAL,
    9346,
    to_date('21-Apr-2023', 'dd-Mon-yyyy'),
    ( SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Building')),
    12,
    ( SELECT insurer_code FROM insurer WHERE upper(insurer_name) = upper('Landlord Association'))
);

--ALTER TABLE policy ENABLE CONSTRAINT policy_startdate_uq;
--ALTER TABLE policy ENABLE CONSTRAINT policy_typecode_uq;

COMMIT;

/*Task 3*/

UPDATE policy
SET policy_length = policy_length + 6 WHERE prop_no = 7145 AND policy_type_code = (SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Building'));

ALTER TABLE policy DISABLE CONSTRAINT prop_no_uq;

INSERT INTO policy VALUES (
    policy_seq.NEXTVAL,
    7145,
    to_date('01-May-2023', 'dd-Mon-yyyy'),
    ( SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Contents')),
    12,
    ( SELECT insurer_code FROM insurer WHERE upper(insurer_name) = upper('Landlord Association'))
);

--ALTER TABLE policy ENABLE CONSTRAINT prop_no_uq;

COMMIT;

/*Task 4*/

UPDATE policy
SET policy_length = policy_length - 6 WHERE prop_no = 7145 AND policy_type_code = (SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Building'));

DELETE FROM policy
WHERE prop_no = 7145 AND policy_type_code = (SELECT policy_type_code FROM policy_type WHERE upper(policy_type_desc) = upper('Contents'));

COMMIT;
--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF