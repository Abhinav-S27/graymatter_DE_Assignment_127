--use test
--create schema gme
create table user_table(
   name varchar(10),
   address varchar(20),
   

)

alter table user_table
add age int

ALTER TABLE user_table
add constraint x default 18 for age

alter table user_table
add constraint y check (age>18)

insert into user_table values('a','abc',12)

alter table user_table
drop constraint y

select * from user_table

alter table user_table
alter column name varchar(20)


create procedure sp_gme
as
select * from user_table
go

create table #gmetbl(
   user_name varchar(100)
)

create table #t(
username varchar(10)
)

create table t1(
username varchar(10)
)

insert into t1 values ('a')
insert into #t select username from t1