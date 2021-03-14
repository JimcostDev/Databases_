USE [BD_II]
GO

/****** Object:  StoredProcedure [dbo].[paEliminarEstudiante]    Script Date: 13/03/2021 21:03:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paEliminarEstudiante]
@alu_codigo CHAR(10)
AS
IF EXISTS (SELECT 1 FROM ALUMNO WHERE alu_codigo=@alu_codigo)
	BEGIN 
		DELETE FROM  ALUMNO WHERE alu_codigo=@alu_codigo
		SELECT 'ESTUDIANTE SE ELIMINO CORRECTAMENTE' AS RESULTADO
	END
ELSE
	BEGIN
		SELECT 'ESTUDIANTE NO EXISTE' AS RESULTADO
	END
GO
