-----This script contains a procedure that will prompt users to enter the details of a new project and check if entered data is valid before attempting to store them in the project table
---When entered data is not validated or other errors occur, appropriate messages are displayed to alert the user
---The program should keep prompting the user for details of new projects until the the project code *#00#* is entered, in which case a message stating the number of correctly inserted rows should be displayed.


set SERVEROUTPUT ON
create or replace procedure add_new_project
  (p_pr_no                          varchar2,
   p_pr_desc                        varchar2,
   p_pr_st_dt                       date,
   p_pr_exp_compl_dt                date,
   p_pr_act_compl_dt                date,
   p_pr_stage                       varchar2,
   p_pr_status                      varchar2,
   p_s_no                            number)
is 
   error_code    Number;
   error_message Varchar2(255);
   
Begin
   Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt, pr_stage, pr_status, s_no)
                values(p_pr_no, p_pr_desc, to_date(p_pr_st_dt,'dd-mm-yy'), to_date(p_pr_exp_compl_dt,'dd-mm-yy'), to_date(p_pr_act_compl_dt,'dd-mm-yy'), p_pr_stage, p_pr_status, p_s_no);
   dbms_output.put_line('Insert Complete');
Exception 
   when others then 
     error_code := SQLCODE;
     error_message := SQLERRM;
     dbms_output.put_line(error_code||' '||error_message);     
End;
/

---Simple Program

declare 
   v_project_code  varchar2(4):= '&Project_code';  
begin
   Loop
   add_new_project(upper('&Project_Number'),upper('&Project_description'), to_date('&Start_date','dd-mm-yy'), to_date('&Expected_Completion_date','dd-mm-yy'), to_date('&Actual_completion_date','dd-mm-yy'), upper('&Project_Stage'), upper('&Project_Status'), upper('&Staff_Number'));
   exit when v_project_code ='#00#';
   end loop;
   dbms_output.put_line(sql%rowcount||' row(s) inserted.');
   commit;
End;
/

----Unfortunately I could not get the loop to work properly.
---The Simple program seems to only work when the correct project code is input but crashes otherwise. 
