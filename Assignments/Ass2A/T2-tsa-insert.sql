/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-tsa-insert.sql

--Student ID: 32713339
--Student Name: Ooi Yu Zhang
--Unit Code: FIT2094
--Applied Class No: 3

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--------------------------------------
--INSERT INTO cabin
--------------------------------------
INSERT INTO cabin VALUES (
    1,
    1,
    1,
    1,
    'C',
    29,
    'This cabin has 1 bedroom with a sleeping capacity of 1 person, an outside common bathroom and costs 29 member points per day.'
);

INSERT INTO cabin VALUES (
    1,
    2,
    2,
    2,
    'I',
    77,
    'This cabin has 2 bedrooms with a sleeping capacity of 2 people, an inside cabin bathroom and costs 77 member points per day.'
);

INSERT INTO cabin VALUES (
    1,
    3,
    3,
    6,
    'I',
    113,
    'This cabin has 3 bedrooms with a sleeping capacity of 6 people, an inside cabin bathroom and costs 113 member points per day.'
);

INSERT INTO cabin VALUES (
    1,
    4,
    4,
    8,
    'C',
    128,
    'This cabin has 4 bedrooms with a sleeping capacity of 8 people, an outside common bathroom and costs 128 member points per day.'
);

INSERT INTO cabin VALUES (
    1,
    5,
    3,
    8,
    'C',
    103,
    'This cabin has 3 bedrooms with a sleeping capacity of 8 people, an outside common bathroom and costs 103 member points per day.'
);

INSERT INTO cabin VALUES (
    1,
    6,
    2,
    2,
    'I',
    77,
    'This cabin has 2 bedrooms with a sleeping capacity of 2 people, an inside cabin bathroom and costs 77 member points per day.'
);

INSERT INTO cabin VALUES (
    2,
    1,
    1,
    3,
    'I',
    44,
    'This cabin has 1 bedroom with a sleeping capacity of 3 people, an inside cabin bathroom and costs 44 member points per day.'
);

INSERT INTO cabin VALUES (
    2,
    2,
    4,
    8,
    'C',
    142,
    'This cabin has 4 bedrooms with a sleeping capacity of 8 people, an outside common bathroom and costs 142 member points per day.'
);

INSERT INTO cabin VALUES (
    3,
    1,
    2,
    5,
    'C',
    80,
    'This cabin has 2 bedrooms with a sleeping capacity of 5 people, an outside common bathroom and costs 80 member points per day.'
);

INSERT INTO cabin VALUES (
    4,
    1,
    3,
    7,
    'C',
    80,
    'This cabin has 3 bedrooms with a sleeping capacity of 7 people, an outside common bathroom and costs 80 member points per day.'
);

INSERT INTO cabin VALUES (
    5,
    1,
    4,
    7,
    'C',
    80,
    'This cabin has 4 bedrooms with a sleeping capacity of 7 people, an outside common bathroom and costs 80 member points per day.'
);

INSERT INTO cabin VALUES (
    6,
    1,
    4,
    12,
    'I',
    89,
    'This cabin has 4 bedrooms with a sleeping capacity of 12 people, an inside cabin bathroom and costs 89 member points per day.'
);

INSERT INTO cabin VALUES (
    6,
    2,
    1,
    1,
    'I',
    44,
    'This cabin has 1 bedroom with a sleeping capacity of 1 pepole, an inside cabin bathroom and costs 44 member points per day.'
);

INSERT INTO cabin VALUES (
    7,
    1,
    1,
    2,
    'I',
    47,
    'This cabin has 1 bedroom with a sleeping capacity of 2 people, an inside cabin bathroom and costs 47 member points per day.'
);

INSERT INTO cabin VALUES (
    8,
    1,
    3,
    6,
    'C',
    113,
    'This cabin has 3 bedrooms with a sleeping capacity of 6 people, an outside common bathroom and costs 113 member points per day.'
);

INSERT INTO cabin VALUES (
    8,
    2,
    2,
    5,
    'I',
    96,
    'This cabin has 2 bedrooms with a sleeping capacity of 5 people, an inside common bathroom and costs 96 member points per day.'
);

INSERT INTO cabin VALUES (
    8,
    3,
    1,
    4,
    'C',
    58,
    'This cabin has 1 bedroom with a sleeping capacity of 4 people, an outside common bathroom and costs 58 member points per day.'
);

INSERT INTO cabin VALUES (
    9,
    1,
    4,
    9,
    'C',
    142,
    'This cabin has 4 bedrooms with a sleeping capacity of 9 people, an outside common bathroom and costs 142 member points per day.'
);

INSERT INTO cabin VALUES (
    10,
    1,
    2,
    4,
    'C',
    80,
    'This cabin has 2 bedrooms with a sleeping capacity of 4 people, an outside common bathroom and costs 80 member points per day.'
);

INSERT INTO cabin VALUES (
    10,
    2,
    3,
    9,
    'I',
    98,
    'This cabin has 3 bedrooms with a sleeping capacity of 9 people, an inside cabin bathroom and costs 98 member points per day.'
);

--------------------------------------
--INSERT INTO booking
--------------------------------------
INSERT INTO booking VALUES (
    1,
    1,
    1,
    TO_DATE('01-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('05-Mar-2023', 'dd-Mon-yyyy'),
    1,
    0,
    116,
    8,
    1
);

INSERT INTO booking VALUES (
    2,
    1,
    1,
    TO_DATE('06-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('08-Mar-2023', 'dd-Mon-yyyy'),
    1,
    0,
    58,
    9,
    1
);

INSERT INTO booking VALUES (
    3,
    1,
    1,
    TO_DATE('10-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('17-Mar-2023', 'dd-Mon-yyyy'),
    1,
    0,
    203,
    8,
    1
);

INSERT INTO booking VALUES (
    4,
    1,
    3,
    TO_DATE('02-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('14-Mar-2023', 'dd-Mon-yyyy'),
    2,
    4,
    1356,
    2,
    2
);

INSERT INTO booking VALUES (
    5,
    1,
    5,
    TO_DATE('14-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('18-Mar-2023', 'dd-Mon-yyyy'),
    8,
    0,
    412,
    2,
    2
);

INSERT INTO booking VALUES (
    6,
    1,
    4,
    TO_DATE('18-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('24-Mar-2023', 'dd-Mon-yyyy'),
    8,
    0,
    768,
    9,
    2
);

INSERT INTO booking VALUES (
    7,
    1,
    6,
    TO_DATE('18-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('21-Mar-2023', 'dd-Mon-yyyy'),
    1,
    1,
    231,
    8,
    1
);

INSERT INTO booking VALUES (
    9,
    2,
    2,
    TO_DATE('21-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('22-Mar-2023', 'dd-Mon-yyyy'),
    4,
    4,
    142,
    4,
    4
);

INSERT INTO booking VALUES (
    10,
    3,
    1,
    TO_DATE('23-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('30-Mar-2023', 'dd-Mon-yyyy'),
    2,
    3,
    560,
    10,
    5
);

INSERT INTO booking VALUES (
    11,
    3,
    1,
    TO_DATE('01-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('03-Apr-2023', 'dd-Mon-yyyy'),
    2,
    3,
    160,
    10,
    6
);

INSERT INTO booking VALUES (
    12,
    3,
    1,
    TO_DATE('07-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('12-Apr-2023', 'dd-Mon-yyyy'),
    2,
    3,
    400,
    14,
    7
);

INSERT INTO booking VALUES (
    13,
    6,
    2,
    TO_DATE('10-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('16-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    264,
    21,
    12
);

INSERT INTO booking VALUES (
    14,
    6,
    2,
    TO_DATE('17-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('18-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    44,
    21,
    11
);

INSERT INTO booking VALUES (
    15,
    6,
    2,
    TO_DATE('21-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('28-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    308,
    20,
    11
);

INSERT INTO booking VALUES (
    16,
    8,
    3,
    TO_DATE('21-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('22-Apr-2023', 'dd-Mon-yyyy'),
    2,
    2,
    58,
    15,
    15
);

INSERT INTO booking VALUES (
    17,
    8,
    3,
    TO_DATE('22-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('23-Apr-2023', 'dd-Mon-yyyy'),
    2,
    2,
    58,
    15,
    15
);

INSERT INTO booking VALUES (
    18,
    8,
    3,
    TO_DATE('23-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('24-Apr-2023', 'dd-Mon-yyyy'),
    2,
    2,
    58,
    16,
    16
);

INSERT INTO booking VALUES (
    19,
    9,
    1,
    TO_DATE('23-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('25-Apr-2023', 'dd-Mon-yyyy'),
    4,
    5,
    284,
    23,
    17
);

INSERT INTO booking VALUES (
    20,
    2,
    1,
    TO_DATE('23-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('25-Apr-2023', 'dd-Mon-yyyy'),
    4,
    0,
    88,
    7,
    4
);

INSERT INTO booking VALUES (
    8,
    8,
    2,
    TO_DATE('23-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('26-Apr-2023', 'dd-Mon-yyyy'),
    2,
    2,
    288,
    16,
    16
);

INSERT INTO booking VALUES (
    21,
    8,
    2,
    TO_DATE('27-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('30-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    288,
    16,
    16
);

COMMIT;