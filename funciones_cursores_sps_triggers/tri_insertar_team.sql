--un trigger es una funci�n especial que se ejecuta autom�ticamente cuando ocurren ciertos 
--eventos en una tabla, como inserciones, actualizaciones o eliminaciones. Aqu� tienes un
--ejemplo de c�mo crear un trigger en SQL Server que se activar� despu�s de insertar datos 
--en la tabla Team y registrar� la informaci�n 
--en una tabla de auditor�a llamada TeamAudit.

-- Crear la tabla de auditor�a si no existe
USE [Test]
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TeamAudit')
BEGIN
    CREATE TABLE TeamAudit (
        AuditID INT IDENTITY(1,1) PRIMARY KEY,
        TeamID INT,
        TeamName NVARCHAR(50),
        AuditDate DATETIME DEFAULT GETDATE()
    )
END
GO

-- Crear el trigger
CREATE OR ALTER TRIGGER trgAfterInsertTeam
ON Team
AFTER INSERT
AS
BEGIN
    INSERT INTO TeamAudit (TeamID, TeamName)
    SELECT ID, Name
    FROM inserted
END

--probrar
SELECT * FROM Team
INSERT INTO Team (Name, LeagueID) VALUES ('Manchester City', 1)
SELECT * FROM TeamAudit

