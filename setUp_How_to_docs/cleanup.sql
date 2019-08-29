--create or replace procedure cleanup as
set serveroutput on size 1000000
declare
  cursor c1 is select object_name
                 from user_objects
                where object_type='TABLE';

  cursor c2 is select object_name,
                      object_type
                 from user_objects;

  v_object  user_objects.object_name%type;
  v_type    user_objects.object_type%type;

  v_sql     varchar2(1000);
     
begin

   execute immediate 'purge recyclebin';

  open c1;

  loop
    fetch c1 into v_object;

    exit when c1%notfound;

    dbms_output.put_line('Table: ' || v_object);

    v_sql := 'drop table ' || v_object || ' cascade constraints';

    dbms_output.put_line('SQL: ' || v_sql);

    execute immediate v_sql;

  end loop;

open c2;

  loop
    fetch c2 into v_object,
                  v_type;
    exit when c2%notfound;

    dbms_output.put_line('Object: ' || v_object);

    v_sql := 'drop ' || v_type || ' ' || v_object;

    dbms_output.put_line('SQL: ' || v_sql);

    execute immediate v_sql;

  end loop;

  execute immediate 'purge recyclebin';
  
  commit;

end;
/


