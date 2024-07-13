

-- *******************************************************************************************************
-- Department 
Drop table IF exists `Department`; 
 create table Department (departmentId VARCHAR(255),
 departmentName VARCHAR(255),
 departmentCode VARCHAR(255),
 description VARCHAR (255),
 createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 UpdatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 createdPersonId VARCHAR(255),
 orgVwid VARCHAR (255));

-- *******************************************************************************************************
DELIMITER //
Drop procedure if exists AddDepartmentDetails //
create procedure AddDepartmentDetails (department_name VARCHAR(255),
department_code VARCHAR(255),
description_ VARCHAR(255),
created_person_id VARCHAR(255),
org_vwid VARCHAR(255))
begin 
-- call AddDepartmentDetails('Engineering','ENG001','test case','53692a3c-4122-11ef-8ba7-c8ff28001a2b','5a2a6f85-4122-11ef-8ba7-c8ff28001a2b');

declare department_vwid VARCHAR(255); 
set  department_vwid =uuid();
IF EXISTS ( SELECT 1 from `Department` where `departmentName`=`department_name` and `orgVwid`=org_vwid) then 
SELECT 'Department and organization details are already existed' as status_message ,400 as status_code ; 
else 
insert into `Department` (`departmentId`,`departmentName`,departmentCode,description,`createdPersonId`,
`orgVwid`)
VALUES( department_vwid,department_name,department_code,description_,created_person_id,
org_vwid);
SELECT `departmentId`,`departmentName`,departmentCode,description,`createdPersonId`,
`orgVwid` from `Department`; 
end if ; 

end //
DELIMITER ;
-- *******************************************************************************************************
