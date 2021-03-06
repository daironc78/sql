USE [DbHelpDesk]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCampos_ESTADOSOLICITUD_Pivot]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fnCampos_ESTADOSOLICITUD_Pivot]
(
	@TYPE CHAR
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @NombrePVT AS NVARCHAR(MAX), @Nombres AS varchar(MAX)
	DECLARE @IdSol INT 
	
	SET @IdSol=(SELECT MIN(IdSol) FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD)
	SET @Nombres = (SELECT Nombre FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD WHERE IdSol = @IdSol)
	SET @NombrePVT = N''
	
	WHILE @Nombres IS NOT NULL
	BEGIN  
		IF (@TYPE = 'P')
		BEGIN
			SET @NombrePVT = @NombrePVT + N',['+ @Nombres +N']'
		END
		ELSE
		BEGIN
			IF (@TYPE = 'C')
			BEGIN
				SET @NombrePVT = @NombrePVT + N',ISNULL(['+ @Nombres +N'],0) AS [' + REPLACE(REPLACE(@Nombres,' ',''),'ó','o') +N']'
			END
			ELSE
			BEGIN
				IF (@TYPE = 'S')
				BEGIN
					SET @NombrePVT = @NombrePVT + N'+ISNULL(['+ @Nombres +N'],0)'
				END
			END
		END
		
		SET @Nombres = (SELECT TOP(1) Nombre 
						FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD 
						WHERE IdSol > @IdSol 
						ORDER BY IdSol ASC)  
		SET @IdSol = (SELECT MIN(IdSol) FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD Where Nombre=@Nombres)
	END
	
	SET @NombrePVT = SUBSTRING(@NombrePVT, 2, LEN(@NombrePVT))

	RETURN @NombrePVT

END



GO
/****** Object:  UserDefinedFunction [dbo].[fnFecha_ultimo_seguimiento]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnFecha_ultimo_seguimiento]
(
@idSol int)
RETURNS datetime
AS
BEGIN
	DECLARE @result datetime

	SELECT @result=MAX(fechaSeguimiento) from tbSeguimiento_Seguimiento
	where fk_Solicitud=@idSol

	RETURN @result

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnSeguimiento_CalcularTiempoSol]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnSeguimiento_CalcularTiempoSol] (@RESULT DATETIME,@TH INT,@TYPE CHAR)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @HLABORAL_INI INT 
	DECLARE @HLABORAL_FIN INT
	DECLARE @CONT INT 
	DECLARE @TEC DATETIME
	DECLARE @AUX INT 
	DECLARE @FECH DATETIME
	
	SET @CONT = 1
	SET @HLABORAL_INI = 8
	SET @HLABORAL_FIN = 18

	SELECT @HLABORAL_INI = hora_inicio_laboral,
		   @HLABORAL_FIN = hora_fin_laboral 
	FROM dbo.tbSeguimiento_Parametros WITH(NOLOCK)
	IF (@TYPE = 'H')
		BEGIN
			WHILE @CONT <= @TH 
			BEGIN
				IF DATEPART(HH,DATEADD(HH,1,@RESULT)) >= @HLABORAL_INI AND DATEPART(HH,DATEADD(HH,1,@RESULT)) <= @HLABORAL_FIN
				BEGIN
					IF DATEPART(HH,DATEADD(HH,1,@RESULT)) >= 12 AND DATEPART(HH,DATEADD(HH,1,@RESULT)) < 14 
					BEGIN
						SET @RESULT = DATEADD(HH,1,@RESULT)
					END
					SET @RESULT = DATEADD(HH,1,@RESULT)
				END
				
				IF DATEPART(HH,DATEADD(HH,1,@RESULT)) > @HLABORAL_FIN
				BEGIN		
					SET @TEC = DATEADD(HH,((24-@HLABORAL_FIN)+@HLABORAL_INI),@RESULT)
								
					WHILE EXISTS (SELECT FECHA_FESTIVO FROM TBSEGUIMIENTO_DIASFESTIVOS WHERE  FECHA_FESTIVO = CONVERT(VARCHAR(50),@TEC,101)) OR DATENAME(dw,@TEC) = 'Saturday' OR DATENAME(dw,@TEC) = 'Sunday'
					BEGIN	
						SET @FECH = @TEC
						SET @TEC = DATEADD(DAY,1,@FECH)
					END
					
					/*WHILE 1=1
					BEGIN
						SET @FECH = @TEC
						IF EXISTS (SELECT FECHA_FESTIVO FROM TBSEGUIMIENTO_DIASFESTIVOS WHERE  FECHA_FESTIVO = CONVERT(VARCHAR(50),@FECH,101)) OR DATENAME(dw,@FECH) = 'Saturday' OR DATENAME(dw,@FECH) = 'Sunday'
						BEGIN
							SET @TEC = DATEADD(HH,((24-@HLABORAL_FIN)+@HLABORAL_INI),@FECH)
						END
						ELSE
						 BREAK
					END
					*/
					
					SET @AUX = (@TH-@CONT) 
					set @RESULT = dbo.fnSeguimiento_CalcularTiempoSol(@TEC,@AUX,@TYPE)
					BREAK
				END
			SET @CONT = @CONT +1
			END
		END
	ELSE
	BEGIN
		IF (@TYPE = 'M')
			BEGIN
				SET @TEC = DATEADD(MM,@TH,@RESULT)
				WHILE EXISTS (SELECT FECHA_FESTIVO FROM TBSEGUIMIENTO_DIASFESTIVOS WHERE  FECHA_FESTIVO = CONVERT(VARCHAR(50),@TEC,101)) OR DATENAME(dw,@TEC) = 'Saturday' OR DATENAME(dw,@TEC) = 'Sunday'
					BEGIN	
						SET @FECH = @TEC
						SET @TEC = DATEADD(DAY,1,@FECH)
					END
					SET @RESULT = @TEC
			END
		ELSE
			BEGIN
				SET @TEC = DATEADD(DAY,@TH,@RESULT)
				WHILE EXISTS (SELECT FECHA_FESTIVO FROM TBSEGUIMIENTO_DIASFESTIVOS WHERE  FECHA_FESTIVO = CONVERT(VARCHAR(50),@TEC,101)) OR DATENAME(dw,@TEC) = 'Saturday' OR DATENAME(dw,@TEC) = 'Sunday'
					BEGIN	
						SET @FECH = @TEC
						SET @TEC = DATEADD(DAY,1,@FECH)
					END
					SET @RESULT = @TEC
			END
	END	
	RETURN @RESULT
END



GO
/****** Object:  UserDefinedFunction [dbo].[fnSeguimiento_DiferenciaFechas]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE function [dbo].[fnSeguimiento_DiferenciaFechas] (@pdtmFechaInicio as datetime , @pdtmFechaFinal as datetime ) returns int 
As
begin
    DECLARE @TEC DATETIME , @dias int = 0
    
    SET @TEC = @pdtmFechaInicio 
    WHILE @TEC <= @pdtmFechaFinal 
	BEGIN
	IF NOT EXISTS (SELECT FECHA_FESTIVO FROM TBSEGUIMIENTO_DIASFESTIVOS 
	WHERE  FECHA_FESTIVO =@TEC OR DATENAME(dw,@TEC) = 'Saturday' OR DATENAME(dw,@TEC) = 'Sunday')
    BEGIN
    set @dias = @dias + 1
    END	
    SET @TEC = @TEC + 1
   END  
   return @dias 
End





GO
/****** Object:  UserDefinedFunction [Riesgos].[fnCalculoIRL__AsignacionEcuacion]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 27/07/2011
-- Description:	Consultar si la ecuacion fue configurada para determinada cartera
-- =============================================
CREATE FUNCTION [Riesgos].[fnCalculoIRL__AsignacionEcuacion]
(
@idFormula int,
@idCartera int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result int,
	@temp int

set @temp = 0
set @result = 0

	SELECT @temp=FC.IDCARTERA
		FROM RIESGOS.FORMULASCARTERA FC
		WHERE FC.IDCARTERA = @idCartera and fc.idformula=@idFormula
	
	if @temp <> 0
	begin
		set @result=1	
	end	
	
	RETURN @result

END

GO
/****** Object:  UserDefinedFunction [Riesgos].[fnCalculoIRL__PrioridadEcuacion]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 27/07/2011
-- Description:	Consultar si la ecuacion fue configurada para determinada cartera
-- =============================================
create FUNCTION [Riesgos].[fnCalculoIRL__PrioridadEcuacion]
(
@IDFORMULA INT,
@IDCARTERA INT
)
RETURNS VARCHAR
AS
BEGIN
	-- DECLARE THE RETURN VARIABLE HERE
	DECLARE @RESULT VARCHAR(2),
	@TEMP INT

SET @TEMP = 0
SET @RESULT = 0

	SELECT @TEMP=FC.PRIORIDAD
		FROM RIESGOS.FORMULASCARTERA FC
		WHERE FC.IDCARTERA = @IDCARTERA AND FC.IDFORMULA=@IDFORMULA
	
	IF @TEMP <> 0
	BEGIN
		SET @RESULT=CAST(@TEMP AS VARCHAR)	
	END	
	
	RETURN @RESULT

END

GO
/****** Object:  UserDefinedFunction [Riesgos].[fnCalculoIRLSplit]    Script Date: 11/25/2020 9:11:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [Riesgos].[fnCalculoIRLSplit](@String varchar(8000), @Delimiter char(1))       
returns @temptable TABLE (items varchar(8000))       
as       
begin       
    declare @idx int       
    declare @slice varchar(8000)       
      
    select @idx = 1       
        if len(@String)<1 or @String is null  return       
      
    while @idx!= 0       
    begin       
        set @idx = charindex(@Delimiter,@String)       
        if @idx!=0       
            set @slice = left(@String,@idx - 1)       
        else       
            set @slice = @String       
          
        if(len(@slice)>0)  
            insert into @temptable(Items) values(@slice)       
  
        set @String = right(@String,len(@String) - @idx)       
        if len(@String) = 0 break       
    end   
return       
end

GO
