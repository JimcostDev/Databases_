USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paEliminarPais]    Script Date: 13/03/2021 21:04:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paEliminarPais]
@pai_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM PAIS WHERE pai_codigo=@pai_codigo)
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM DEPARTAMENTO WHERE pai_codigo=@pai_codigo)
		BEGIN
			DELETE FROM  PAIS WHERE pai_codigo = @pai_codigo
			SELECT 'PAIS SE ELIMINO CORRECTAMENTE' AS RESULTADO
		END
	ELSE
		BEGIN
			SELECT 'NO SE PUEDE ELIMINAR PAIS, TIENE RELACIONES EN DEPARTAMENTO.' AS RESULTADO
		END
END
ELSE
	BEGIN
		SELECT 'PAIS NO EXISTE' AS RESULTADO
	END
GO

