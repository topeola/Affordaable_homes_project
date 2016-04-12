
-----This script is contains the DDL statements used in creating the tables in the database

---drop existing tables
drop table po_item cascade constraints;
drop table item cascade constraints;
drop table purchase_order cascade constraints;
drop table project cascade constraints;
drop table staff cascade constraints;
drop table office cascade constraints;
drop table county cascade constraints;



---statements for creating tables
create table county
(county_id varchar2(2),
county_name varchar2(20),
constraint cnty_county_id          unique(county_id),
constraint chk_upper_county_id     check(county_id = upper(county_id)),
constraint chk_upper_county_name   check(county_name = upper(county_name)));


create table office
  (office_no number(3) not null,
   o_addr    varchar2(200),
   o_telno   varchar2(20),
   o_faxno   varchar2(20),
   county_id varchar2(2),
   constraint ofce_ofce_no_pk     Primary Key (office_no),
   constraint check_ofce_no       check(to_number(office_no) between 100 and 999),
   constraint ofce_cnty_id_fk     Foreign Key (county_id)
   References county(county_id),
   constraint chk_upper_cnty_id   check(county_id = upper(county_id)),
   constraint chk_upper_o_addr    check(o_addr = upper(o_addr)));


create table staff
    (s_no     number(4),
     f_name   varchar2(20),
     l_name   varchar2(25),
     s_addr   varchar2(200),
     s_telno  varchar2(20),
     gender   varchar2(1),
     grade    varchar2(2) default 'CC', 
     office_no number(3) not null,
     constraint stf_s_no             Unique(s_no),
     constraint check_staff_no       check(to_number(s_no) between 1000 and 9999),
     constraint stf_ofce_no_fk      Foreign Key(office_no)
     References office(office_no),
     constraint check_staff_gender         check(gender in('M','F')),
     constraint check_f_name              check(f_name = upper(f_name)),
     constraint check_l_name               check(l_name = upper(l_name)),
     constraint check_staff_addr           check(s_addr = upper(s_addr)),
     constraint check_staff_grade          check(grade in ('A+', 'AA', 'AB', 'B+', 'BA', 'BB', 'C+', 'CA', 'CB',null)));
     

create table project
    (pr_no                          varchar2(5),
     pr_desc                        varchar2(30),
     pr_st_dt                       date,
     pr_exp_compl_dt                date,
     pr_act_compl_dt                date null,
     pr_stage                       varchar2(30) null,
     pr_status                      varchar2(30),
     s_no                            number(4),
     constraint prj_pr_no            Unique(pr_no),
     constraint check_pr_no_substr12       check(substr(pr_no, 1,2) between 'A' and 'Z'), 
     constraint check_pr_no_substr31       check(to_number(substr(pr_no,3,1))>0),
     constraint check_pr_no_substr323      check(to_number(substr(pr_no,4,2))>=0),
     constraint check_prj_pr_exp_compl_dt  check(pr_st_dt < pr_exp_compl_dt),
     constraint check_prj_pr_act_compl_dt  check(pr_st_dt < pr_act_compl_dt),
     constraint prj_s_no_fk          foreign key(s_no)
     References staff(s_no) on delete cascade,
     constraint check_prj_stage       check(pr_stage in('FOUNDATIONS','FRAME','ELECTRICAL', 'PLUMBING', 'DECORATION', 'OTHER')),
     constraint check_prj_status      check(pr_status in('PLANNING', 'ONGOING','COMPLETED')),
     constraint check_prj_desc        check(pr_desc = upper(pr_desc)),
     constraint check_prj_stat_compl_dt check((pr_status = 'COMPLETED' and pr_act_compl_dt is not null) or 
                                      (pr_act_compl_dt is null and pr_status != 'COMPLETED')));


create table purchase_order
        (pr_no                          Varchar2(5),
         po_no                          number(10),
         po_date                        date null,
         constraint po_pk                  Primary Key(pr_no,po_no),
         constraint po_pr_no_fk         Foreign Key(pr_no)
         References project(pr_no) on delete cascade,
         constraint po_pr_no_substr12   check(substr(pr_no, 1,2) between 'A' and 'Z'), 
         constraint po_pr_no_substr31   check(to_number(substr(pr_no,3,1))>0),
         constraint po_pr_no_substr323  check(to_number(substr(pr_no,4,2))>=0));

                        
create table item
  (it_no      number(5),
   it_desc    varchar2(30),
   constraint it_no_pk      Primary Key(it_no),
   constraint check_it_no     check(to_number(it_no) between 10000 and 99999),
    constraint check_it_desc  check(it_desc = upper(it_desc)));


create table po_item 
   (pr_no     Varchar2(5), 
    po_no     number(10), 
    it_no     number(5), 
    qty       number(5) not null, 
    price     number(8,2) not null, 
    constraint pi_key_pk           Primary Key(pr_no,po_no,it_no),
    constraint pi_pr_no_substr12   check(substr(pr_no, 1,2) between 'A' and 'Z'), 
    constraint pi_pr_no_substr31   check(to_number(substr(pr_no,3,1))>0),
    constraint pi_pr_no_substr323  check(to_number(substr(pr_no,4,2))>=0),
    constraint pi_it_no_chk        check(to_number(it_no) between 10000 and 99999),
    constraint pi_qty_chk           check(qty > 0),
    constraint pi_price_chk         check(price > 0),
    constraint it_no_fk            Foreign Key(it_no)
    References item(it_no) on delete cascade,
    constraint pi_pr_po_no_fk      Foreign Key(pr_no,po_no)
    References purchase_order(pr_no,po_no) on delete cascade); 





