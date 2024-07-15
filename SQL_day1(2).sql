select HumanResources.Employee.BusinessEntityID,HumanResources.Employee.HireDate,Person.EmailAddress.BusinessEntityID,Person.EmailAddress.EmailAddress
from HumanResources.Employee
inner join Person.EmailAddress
on HumanResources.Employee.BusinessEntityID=Person.EmailAddress.BusinessEntityID


SELECT * FROM Person.PhoneNumberType

INSERT INTO Person.PhoneNumberType (Name) VALUES ('CELL2')
