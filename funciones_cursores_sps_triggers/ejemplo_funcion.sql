USE [Test]
-- Crear la funci�n
CREATE FUNCTION dbo.ObtenerNombreEquipo
(
    @TeamID INT  -- Par�metro de entrada: ID del equipo
)
RETURNS NVARCHAR(50)  -- Tipo de dato que devuelve la funci�n
AS
BEGIN
    DECLARE @TeamName NVARCHAR(50)

    SELECT @TeamName = Name
    FROM Test.dbo.Team
    WHERE ID = @TeamID

    RETURN @TeamName
END


-- Llamar a la funci�n para obtener el nombre de un equipo espec�fico (supongamos que el ID del equipo es 1)
DECLARE @EquipoID INT = 1
SELECT dbo.ObtenerNombreEquipo(@EquipoID) AS NombreEquipo