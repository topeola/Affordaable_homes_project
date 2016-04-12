---This script contains a function that should return the average cost of a project a given member of staff oversees

---Average Project cost function

Set SERVEROUTPUT ON

create or replace function average_proj_cost 
   (p_s_no in number) return number
is 
 cursor curs_avg_cost is 
  select avg(qty * price) avg_cost
   from  project p, po_item pi 
   where p.pr_no = pi.pr_no
   and  s_no = p_s_no
   group by s_no;   
 v_avg_cost number;
Begin
    open curs_avg_cost;
    fetch curs_avg_cost into v_avg_cost;
     if curs_avg_cost%notfound
       then v_avg_cost := 0;
     end if;
    close curs_avg_cost; 
  return v_avg_cost;
End average_proj_cost;
/
---To test the function run the command below

select s_no, average_proj_cost(s_no) avg_cost
from staff
where s_no in (1050,1080);

--The output shows the average cost for staff with s_no is 2870,
-- and as staff with s_no 1080 does not oversee any project he has zero average cost.

---Simple pl/sql program

Declare 
  cursor c_snr_staff_avg_cost is
      select  min(s_no) Staff_no, max(grade) Grade, round(average_proj_cost(s_no),-3) highest_avg_cost
      from  staff 
      group by average_proj_cost(s_no);
  v_staff_cost_rec    c_snr_staff_avg_cost%rowtype; 
Begin
   dbms_output.put_line('S_No '||'Grade '||'Avg_Cost');
   open c_snr_staff_avg_cost;
      Loop
        fetch c_snr_staff_avg_cost into v_staff_cost_rec;
        exit  when  c_snr_staff_avg_cost%notfound;
        dbms_output.put_line(v_staff_cost_rec.Staff_no||'   '||v_staff_cost_rec.Grade||'  '||v_staff_cost_rec.highest_avg_cost);
      end loop;
    Close c_snr_staff_avg_cost;
End;
/

---Explanation
select o.office_no, count(p.pr_no) Count_of_Projects
from office o, staff s, project p
where o.office_no = s.OFFICE_NO
and s.s_no = p.s_no
group by o.OFFICE_NO;

---The output of the statement above produces 5 rows which means that one office does not oversee any project and this is office with office_no 140, 
---hence the reason why the PL/SQL program also produces 5 rows




