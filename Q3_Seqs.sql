---This script contains statements to create sequences

---drop existing sequences
drop sequence office_no_seq;
drop sequence staff_no_seq;
drop sequence item_no_seq;

---create sequence statements
create sequence office_no_seq
     increment by 10
     start with 100;

Create sequence staff_no_seq
    increment by 5
    start with 1000;

Create sequence item_no_seq
   increment by 100
   start with 10000;