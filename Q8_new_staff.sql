---This script contains a procedure to determine the office_no a new staff member will be allocated to using an algorithm.
---It also executes the procedure in a way that will require the user to enter details interactively and use these details to enter the data to the table.

set SERVEROUTPUT ON

create or replace procedure new_staff 
   (p_fname  staff.f_name%type,
    p_lname  staff.l_name%type,
    p_saddr  staff.s_addr%type,
    p_stelno staff.s_telno%type,
    p_gender staff.gender%type,
    p_grade  staff.grade%type,
    office_no number) 
is
   error_code    Number;
   error_message Varchar2(255);
   e_invalid_gender exception;
   cursor c_asgn_ofce is 
   select office from
    (select count(pr_no) Incomplete_proj, count(s.s_no) min_staff,max(office_no) office
                            from project p, staff s
                            where  s.s_no = p.s_no
                            and pr_status != 'COMPLETED'
                            group by office_no
                            having count(pr_no) > 
                                                  (select avg(count(pr_no)) Avg_incomplete_projects
                                                    from project p, staff s
                                                     where  s.s_no = p.s_no
                                                     and pr_status != 'COMPLETED'
                                                     group by office_no));
    v_asgn_ofce      number;
Begin
    open c_asgn_ofce;
      fetch c_asgn_ofce into v_asgn_ofce;
    close c_asgn_ofce; 
    if p_gender not in('m','f','M','F')
     then raise e_invalid_gender;
   end if;
   Insert into staff(s_no, f_name, l_name, s_addr, s_telno, gender, grade,office_no)
              values(staff_no_seq.nextval, p_fname, p_lname, p_saddr, p_stelno, p_gender, p_grade,v_asgn_ofce);
   dbms_output.put_line(sql%rowcount||' row(s) inserted.'); 
Exception
   When e_invalid_gender then
        dbms_output.put_line('Invalid gender entered');
   When others then 
       error_code := SQLCODE;
       error_message:= SQLERRM;
       dbms_output.put_line(error_code||' '||error_message);
End new_staff;
/


---Simple PL/SQL Program to execute procedure

declare 
v_asgn_ofce number;
begin
 new_staff(upper('&First_Name'), upper('&Last_Name'),upper('&Address'), upper('&Telephone_No'), upper('&Gender'), upper('&Grade'),v_asgn_ofce); 
end;
/
