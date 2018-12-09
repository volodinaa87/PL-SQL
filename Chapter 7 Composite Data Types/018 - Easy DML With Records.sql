--------------------------------------------------------------------------------------------------------------------
-----------------------------------------EASY DML WITH RECORDS------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
create table retired_employees as select * from employees where 1=2;
select * from retired_employees;
/
declare
    r_emp employees%rowtype;
begin
    select * into r_emp from employees where employee_id = 104;
 r_emp.salary := 0;
    r_emp.commission_pct := 0;
    insert into retired_employees values r_emp;
end;
-----------------------------------------
declare
    r_emp employees%rowtype;
begin
    select * into r_emp from employees where employee_id = 104;
    r_emp.salary := 10;
    r_emp.commission_pct := 0;
    --insert into retired_employees values r_emp;
    update retired_employees set row = r_emp where employee_id = 104;
end;
/
delete from retired_employees;

------------------------------------------

declare 
    r_emp employees%rowtype;
    v_employee_id PLS_INTEGER :=104;
    v_salary PLS_INTEGER not null default 9000;
    v_commission_pct PLS_INTEGER not null default 0;
begin 
    select * into r_emp from employees where employee_id=v_employee_id;
    r_emp.salary :=v_salary;
    r_emp.commission_pct :=v_commission_pct;
    --insert into retired_employees values r_emp;
    update retired_employees
    set row = r_emp where employee_id=v_employee_id;
end;