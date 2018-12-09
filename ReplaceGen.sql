declare
type t_emp is record(
first_name varchar2(50),
last_name employees.last_name%type,
salary employees.salary%type,
hire_date date,
table_name varchar2(50),
column_name varchar2(50),
value_before varchar2(50),
value_after varchar2(50)
);
r_emp t_emp;
begin
    select first_name, last_name, salary 
    into r_emp.first_name,r_emp.last_name,r_emp.salary from employees where employee_id='104';
    r_emp.table_name := 'employees';
    r_emp.column_name := 'last_name';
    r_emp.value_before := r_emp.last_name;
    r_emp.value_after := r_emp.value_before||'|Kong';
    --dbms_output.put_line(r_emp.first_name || ' ' || r_emp.last_name || ' '|| r_emp.salary); 
    dbms_output.put_line(
    'update '|| r_emp.table_name ||
    CHR(10)||'set '|| r_emp.column_name || ' = replace(' ||r_emp.column_name||','''||r_emp.value_before
    ||''','''|| r_emp.value_after|| ''')' ||
    CHR(10)||'where '||r_emp.column_name||'='''||r_emp.value_before||'''' 
    ||' and '||r_emp.column_name|| '!='||''''||r_emp.value_after||''''||';'
    );
end;

select * from hr.employees where employee_id='104';

--RESULT
update employees
set last_name = replace(last_name,'Ernst','Ernst|Kong')
where last_name='Ernst' and last_name!='Ernst|Kong';