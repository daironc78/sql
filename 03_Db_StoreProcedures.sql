USE [DbHelpDesk]
GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ActualizarEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paCriptografia_ActualizarEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ActualizarEntidades]
@nit varchar(20),
@nombre varchar(100),
@direccion varchar(100),
@correo_electronico varchar(100),
@telefono varchar(20),
@estado bit,
@id_entidad int
AS
BEGIN
	UPDATE Criptografia.Entidad 
	SET nit = @nit,
	nombre = @nombre,
	direccion = @direccion,
	correo_electronico = @correo_electronico,
	telefono = @telefono,
	estado = @estado
	WHERE id_entidad = @id_entidad
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ActualizarKeyEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
	Nombre: paCriptografia_ActualizarKeyEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ActualizarKeyEntidades]
@key_publica varchar(4000),
@nombre_key_privada varchar(100),
@key_privada varchar(4000),
@id_key int
AS
BEGIN
	UPDATE Criptografia.KeyEntidad 
	SET key_publica = @key_publica,
		nombre_key_privada = @nombre_key_privada,
		key_privada = @key_privada
	WHERE id_key = @id_key
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ConsultarEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paCriptografia_ConsultarEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ConsultarEntidades]
AS
BEGIN
	SELECT id_entidad,nit,nombre,direccion,correo_electronico,
	telefono,fecha_creacion,estado 
	FROM Criptografia.Entidad WITH(NOLOCK)
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ConsultarEntidadesById]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
	Nombre: paCriptografia_ConsultarEntidadesById
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ConsultarEntidadesById]
@ID_ENTIDAD  INT
AS
BEGIN
	SELECT id_entidad,nit,nombre,direccion,correo_electronico,
	telefono,fecha_creacion,estado 
	FROM Criptografia.Entidad WITH(NOLOCK)
	WHERE id_entidad = @ID_ENTIDAD
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ConsultarEntidadesByParams]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paCriptografia_ConsultarEntidadesByParams
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ConsultarEntidadesByParams]
@PARAM  VARCHAR(100)
AS
BEGIN
	SELECT id_entidad,nit,nombre,direccion,correo_electronico,
	telefono,fecha_creacion,estado 
	FROM Criptografia.Entidad WITH(NOLOCK)
	WHERE NIT LIKE '%' +  @PARAM  + '%' OR  nombre LIKE '%' +  @PARAM  + '%'
END

GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ConsultarKeyByIdEntidad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
	Nombre: paCriptografia_ConsultarKeyByIdEntidad
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ConsultarKeyByIdEntidad]
@ID_ENTIDAD  INT
AS
BEGIN
	SELECT id_key,id_entidad,key_publica,nombre_key_privada,
	key_privada 
	FROM Criptografia.KeyEntidad WITH(NOLOCK)
	WHERE id_entidad = @ID_ENTIDAD
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_ConsultarParametros]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*
	Nombre: paCriptografia_ConsultarParametros
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_ConsultarParametros]
AS
BEGIN
	SELECT * 
	FROM Criptografia.Parametros  WITH(NOLOCK)
END



GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_EliminarEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paCriptografia_EliminarEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_EliminarEntidades]
@id_entidad int
AS
BEGIN
	DELETE FROM Criptografia.KeyEntidad where id_entidad = @id_entidad
	DELETE FROM Criptografia.Entidad where id_entidad = @id_entidad
END


GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_InsertarEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paCriptografia_InsertarEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_InsertarEntidades]
@nit varchar(20),
@nombre varchar(100),
@direccion varchar(100),
@correo_electronico varchar(100),
@telefono varchar(20),
@estado bit
AS
BEGIN
	INSERT INTO Criptografia.Entidad WITH(ROWLOCK)(nit,nombre,direccion,correo_electronico,telefono,fecha_creacion,estado)
	VALUES (@nit,@nombre,@direccion,@correo_electronico,@telefono,GETDATE(),@estado)
	
	SELECT SCOPE_IDENTITY() AS ID
	
END



GO
/****** Object:  StoredProcedure [Criptografia].[paCriptografia_InsertarKeyEntidades]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paCriptografia_InsertarKeyEntidades
	Fecha:  04 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion:
	
	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Criptografia].[paCriptografia_InsertarKeyEntidades]
@id_entidad int, 
@key_publica varchar(8000),
@nombre_key_privada varchar(100),
@key_privada varchar(8000)
AS
BEGIN
	INSERT INTO Criptografia.KeyEntidad WITH(ROWLOCK)(id_entidad,key_publica,nombre_key_privada,key_privada)
	VALUES (@id_entidad,@key_publica,@nombre_key_privada,@key_privada)
END



GO
/****** Object:  StoredProcedure [dbo].[DBA_BackupAllDatabase]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DBA_BackupAllDatabase]
@BackupLocation NVARCHAR(500)
AS

DECLARE @dirContent TABLE(DatabaseName VARCHAR(500))
DECLARE @Str NVARCHAR(4000)
DECLARE @DatabaseName NVARCHAR(255)
--SET @BackupLocation = 'F:\Backup_BBDD_Nivel3'
SET @Str = ''

INSERT INTO @dirContent
SELECT name 
FROM sys.databases
WHERE name NOT IN ('tempdb', 'model', 'msdb', 'distribution')

DECLARE dd CURSOR FOR
SELECT DatabaseName 
FROM @dirContent
OPEN dd
FETCH NEXT FROM dd INTO @DatabaseName
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @Str = 'BACKUP DATABASE [' + @DatabaseName + '] TO' + 
' DISK = N''' + @BackupLocation + '\' + @DatabaseName + '.BAK''' + 
' WITH NOFORMAT, NOINIT,  NAME = N''' + @DatabaseName + '-FULL Database Backup''' + 
', SKIP, NOREWIND, NOUNLOAD,  STATS = 10'

EXEC(@Str)

FETCH NEXT FROM dd INTO @DatabaseName
END
CLOSE dd
DEALLOCATE dd
GO
/****** Object:  StoredProcedure [dbo].[paCobroPortafolio_ConsultarCliente]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--paCobroPortafolio_ConsultarCliente '9013','FACOSTA'

CREATE PROCEDURE [dbo].[paCobroPortafolio_ConsultarCliente]
@IDCLIENTE VARCHAR(17), 
@STRUSUARIO varchar(50)
AS
DECLARE @FILTROUSUARIO BIT
DECLARE @SQL VARCHAR(8000)
SET @SQL = ''
SET @FILTROUSUARIO = 0

BEGIN
IF  EXISTS (SELECT 1 FROM DBOYD.DBO.TBLCLIENTESRECEPTORES H INNER JOIN DBOYD.DBO.TBLUSUARIOSSUCURSALES S  ON H.STRIDRECEPTOR = S.STRIDRECEPTOR WHERE S.STRUSUARIOAPP = @STRUSUARIO )
BEGIN
      SET @FILTROUSUARIO = 1
END
            
      SET @SQL = @SQL + 'SELECT FECHA_COBRO , AÑO_COBRO , MES_COBRO ,COBRO, GMF, IVA '
      SET @SQL = @SQL + 'FROM '
      SET @SQL = @SQL + '( '
      SET @SQL = @SQL + 'SELECT  '
      SET @SQL = @SQL + 'CASE IDTIPOCOBRO  '
      SET @SQL = @SQL + 'WHEN 1 THEN ''COBRO'' WHEN 2 THEN ''IVA'' WHEN 3 THEN ''GMF'' '
      SET @SQL = @SQL + 'WHEN 4 THEN ''COBRO'' WHEN 5 THEN ''IVA'' WHEN 6 THEN ''GMF''  '
      SET @SQL = @SQL + 'WHEN 7 THEN ''COBRO'' WHEN 8 THEN ''IVA'' WHEN 9 THEN ''GMF'' END TIPO '
      SET @SQL = @SQL + ', CONVERT(VARCHAR(20), FECHA_COBRO, 101) AS FECHA_COBRO , AÑO_COBRO , MES_COBRO , SUM(VALOR_COBRO) VALOR '
      SET @SQL = @SQL + 'FROM DBOYD.DBO.TBLCOBROPORTAFOLIO_COBROMENSUAL WITH(NOLOCK)  '
      SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLCLIENTES C ON LTRIM(RTRIM(C.LNGID)) = LTRIM(RTRIM(IDCLIENTE))  '
      SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLCLIENTESRECEPTORES CR  ON LTRIM(RTRIM(C.LNGID)) = LTRIM(RTRIM(CR.LNGIDCOMITENTE))  AND CR.logLider = 1  '
      SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLRECEPTORES R ON LTRIM(RTRIM(CR.STRIDRECEPTOR)) = LTRIM(RTRIM(R.STRID))  AND R.LOGACTIVO = 1  '
      SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLRECEPTORES R1 ON R.LNGIDMESA = R1.LNGIDMESA AND R1.LOGLIDERMESA = 1  '
      SET @SQL = @SQL + 'WHERE  (1=1)  '
      
      IF @IDCLIENTE <> '' AND @FILTROUSUARIO = 1
      BEGIN
            SET @SQL = @SQL + 'AND (R1.STRLOGIN = '''+ @STRUSUARIO + ''' AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' + @IDCLIENTE + ''') OR (R.STRLOGIN IN ' 
            SET @SQL = @SQL + ' ( SELECT R1.STRLOGIN FROM '
            SET @SQL = @SQL + ' DBOYD.DBO.TBLCLIENTESRECEPTORES  C1  '
            SET @SQL = @SQL + ' INNER JOIN DBOYD.DBO.TBLRECEPTORES R1 ON LTRIM(RTRIM(C1.STRIDRECEPTOR)) = LTRIM(RTRIM(R1.STRID))   '
            SET @SQL = @SQL + ' WHERE  LTRIM(RTRIM(C1.LNGIDCOMITENTE))  = ''' + @IDCLIENTE + ''')'
            SET @SQL = @SQL + ' AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' +  @IDCLIENTE +''') ' 
      END

      IF @IDCLIENTE <> '' AND @FILTROUSUARIO = 0
      SET @SQL = @SQL + 'AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' + @IDCLIENTE + ''''
      
      IF @IDCLIENTE = '' AND @FILTROUSUARIO = 1
      SET @SQL = @SQL + 'AND (R1.STRLOGIN = ''' + @STRUSUARIO + ''') OR (R.STRLOGIN = ''' +  @STRUSUARIO + ''')'
      
      
      SET @SQL = @SQL + 'GROUP BY IDTIPOCOBRO,FECHA_COBRO,AÑO_COBRO,MES_COBRO '
      SET @SQL = @SQL + ') '
      SET @SQL = @SQL + 'AS S '
      SET @SQL = @SQL + 'PIVOT '
      SET @SQL = @SQL + '( '
            SET @SQL = @SQL + 'SUM(VALOR) '
            SET @SQL = @SQL + 'FOR TIPO IN ([COBRO],[IVA],[GMF]) '
      SET @SQL = @SQL + ')    AS PIVOTTABLE '
SET @SQL = @SQL + 'ORDER BY AÑO_COBRO '

EXEC(@SQL)      
---PRINT(@SQL)      
      
END         


GO
/****** Object:  StoredProcedure [dbo].[paConsultaCarteraTrasladada]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.paConsultaCarteraTrasladada
	Fecha:  09 de Noviembre de 2011
	Autor:	Wilmar Perdomo Gutiérrez
	Aplicacion: Traslado Carteras.
	
	Descripcion: Permite consultar los clientes que se les ha hecho traslado de OYD a Safyr
	
	Modficaciones: 
	Autor:					Fecha:
*/
CREATE PROCEDURE [dbo].[paConsultaCarteraTrasladada]
@IdComitente INT,
@NombreComitente VARCHAR(100),
@strcomercial VARCHAR(50)
AS
	DECLARE @sql VARCHAR(5000)

	
	SET @sql =	'SELECT 
				IdCliente,
				c.strNombre Nombre_cliente,
				SUBSTRING(CONVERT(VARCHAR(17),Fecha_Traslado,126) ,1,10) Fecha_traslado,
				Valor_Traslado,
				Numero_cartera
				FROM dboyd.dbo.tbTrasladoCartera tc
				INNER JOIN dboyd.dbo.tblclientes c ON tc.IdCliente = c.lngID
				INNER JOIN dboyd.dbo.tblClientesReceptores cr ON C.lngID = cr.lngIDComitente AND logLider = 1
				INNER JOIN dboyd.dbo.tblReceptores r ON cr.strIDReceptor = r.strID'
				
	IF((@IdComitente > 0) AND (@NombreComitente IS NOT NULL) AND (@NombreComitente <>''))
		SET @sql = @sql + ' WHERE TC.IdCliente = '+CAST(@IdComitente AS VARCHAR) +' AND c.strNombre = '+ ''''+@NombreComitente+''''
	
	IF((@IdComitente > 0) AND ((@NombreComitente IS NULL) OR (@NombreComitente = '')))
		SET @sql = @sql + ' WHERE TC.IdCliente = '+CAST(@IdComitente AS VARCHAR)
	IF((@IdComitente IS NULL) AND (@NombreComitente IS NOT NULL) AND (@NombreComitente <>''))
		SET @sql = @sql + ' WHERE  c.strNombre = '+''''+@NombreComitente+''''
		
		SET @sql = @sql + ' AND tc.Devolucion_oyd = '+CAST(0 AS VARCHAR) +' AND r.strLogin = '+''''+@strcomercial+''''
		
		EXEC (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[paConsultaDevolucionCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.paConsultaDevolucionCartera
	Fecha:  10 de Noviembre de 2011
	Autor:	Wilmar Perdomo Gutiérrez
	Aplicacion: Traslado Carteras.
	
	Descripcion: Permite consultar los clientes con los saldos devueltos a OYD desde Safyr
	
	Modficaciones: 
	Autor:					Fecha:
*/
CREATE PROCEDURE [dbo].[paConsultaDevolucionCartera]
@IdComitente INT,
@NombreComitente VARCHAR(100),
@strcomercial VARCHAR(50)
AS
	DECLARE @sql VARCHAR(5000)

	
	SET @sql =	'SELECT 
				IdCliente,
				c.strNombre Nombre_cliente,
				SUBSTRING(CONVERT(VARCHAR(17),Fecha_Traslado,126) ,1,10) Fecha_traslado,
				Numero_cartera,
				Solicitante_devolucion,
				Valor_Traslado
				FROM tbTrasladoCartera tc
				INNER JOIN dboyd.dbo.tblclientes c ON tc.IdCliente = c.lngID
				INNER JOIN dboyd.dbo.tblClientesReceptores cr ON C.lngID = cr.lngIDComitente AND logLider = 1
				INNER JOIN dboyd.dbo.tblReceptores r ON cr.strIDReceptor = r.strID'
				
	IF((@IdComitente > 0) AND (@NombreComitente IS NOT NULL) AND (@NombreComitente <>''))
		SET @sql = @sql + ' WHERE TC.IdCliente = '+CAST(@IdComitente AS VARCHAR) +' AND c.strNombre = '+ ''''+@NombreComitente+''''
	
	IF((@IdComitente > 0) AND ((@NombreComitente IS NULL) OR (@NombreComitente = '')))
		SET @sql = @sql + ' WHERE TC.IdCliente = '+CAST(@IdComitente AS VARCHAR)
	IF((@IdComitente IS NULL) AND (@NombreComitente IS NOT NULL) AND (@NombreComitente <>''))
		SET @sql = @sql + ' WHERE  c.strNombre = '+''''+@NombreComitente+''''
		
		SET @sql = @sql + ' AND tc.Devolucion_oyd = '+CAST(1 AS VARCHAR) +' AND r.strLogin = '+''''+@strcomercial+''''
		
		EXEC (@SQL)
		--PRINT @SQL
GO
/****** Object:  StoredProcedure [dbo].[paConsultarCamposDinamicosSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[paConsultarCamposDinamicosSeguimiento]
@numsolicitud VARCHAR(100), @tipo_solicitud INT
AS
BEGIN
	SELECT SEG.valor_campos_dinamicos campos_dinamicos
	FROM dbo.tbSeguimiento_Seguimiento seg
	INNER JOIN dbo.tbSeguimiento_Solicitud sol on seg.fk_Solicitud = sol.idsolicitud
	WHERE sol.numero_solicitud = @numsolicitud AND sol.fk_tipoSolicitud = @tipo_solicitud
END

GO
/****** Object:  StoredProcedure [dbo].[paConsultarSolicitudesSinSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.paConsultarSolicitudesSinSguimiento
	Fecha:  27 de Octubre de 2011
	Autor:	Wilmar Perdomo Gutierrez
	
	Descripcion: Permite consultar las solicitudes que tienena signadas los comerciales y sobre las cuales no se ha hecho gestion alguna.
	
	Modficaciones: 
	Autor:					Fecha:
*/
CREATE PROCEDURE [dbo].[paConsultarSolicitudesSinSeguimiento]
@IdReceptor VARCHAR(20)
AS
BEGIN
	SELECT DISTINCT
		IDCOMITENTE,
		NOMBRECOMITENTE,
		CONVERT(VARCHAR,FECHA,110) AS FECHA_PROCESO,
		CAST(VALOR_SOBREGIRO AS MONEY) VALOR_SOBREGIRO,
		COMISION AS SANCION,
		NUMSOLICITUD
	FROM dboydderivados.dbo.tdatos_sobregiro ds
	INNER JOIN CdBIntranet.dbo.tbSeguimiento_Solicitud S ON ds.NUMSOLICITUD = s.numero_solicitud
	WHERE IDRECEPTOR = @IdReceptor AND s.idsolicitud NOT IN (SELECT fk_Solicitud FROM tbSeguimiento_Seguimiento)
END

GO
/****** Object:  StoredProcedure [dbo].[paDesarrollo_BuscarContenidoEnSP]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[paDesarrollo_BuscarContenidoEnSP]
@contenido varchar(1000)
as

set nocount on
DECLARE @objname nvarchar(776)
DECLARE	@iPosIni int
DECLARE	@dbname sysname


,@SyscomText	nvarchar(4000),
@bSeguir 	bit,
@Type varchar(10)

CREATE TABLE #CommentText
(Type varchar(10) null, Text  nvarchar(776) collate database_default)


select @dbname = parsename(@objname,3)

if @dbname is not null and @dbname <> db_name()
begin
	raiserror(15250,-1,-1)
        return (1)
end

DECLARE curSP CURSOR LOCAL FOR
select type, name from sysobjects where type = 'P' or type = 'TR' or type = 'V' order by name
FOR READ ONLY

OPEN curSP

FETCH NEXT FROM curSP into @type, @objname

WHILE @@fetch_status >= 0
BEGIN
	
	DECLARE ms_crs_syscom  CURSOR LOCAL
	FOR SELECT text FROM syscomments WHERE id = OBJECT_ID(@objname) and encrypted = 0
	ORDER BY number, colid
	FOR READ ONLY
	
	OPEN ms_crs_syscom
	
	FETCH NEXT FROM ms_crs_syscom into @SyscomText
	
	SET @bSeguir = 1
	WHILE (@@fetch_status >= 0) AND @bSeguir = 1
	BEGIN
	
	       
	        SET @iPosIni =   CHARINDEX(@contenido, @SyscomText)
		IF @iPosIni > 0 
		BEGIN
			INSERT #CommentText (Type, Text) VALUES( @type, @objname )
			SET @bSeguir = 0
		END

		FETCH NEXT FROM ms_crs_syscom into @SyscomText
	END
	CLOSE  ms_crs_syscom
	DEALLOCATE 	ms_crs_syscom
	
	-- Siguiente SP
	FETCH NEXT FROM curSP into @type, @objname
END	

SELECT * FROM #CommentText
drop table #CommentText

return (0) -- sp_helptext






GO
/****** Object:  StoredProcedure [dbo].[paDesarrolloEliminarSolicidesByNumSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: dbo.paDesarrolloEliminarSolicidesByNumSol
	Fecha:  27 de Octubre de 2011
	Autor:	Wilmar Perdomo Gutierrez
	
	Descripcion: Permite eliminar las solicitudes por el número de solicitud.
	
	Modficaciones: 
	Autor:					Fecha:
*/
CREATE PROCEDURE [dbo].[paDesarrolloEliminarSolicidesByNumSol]
@NumeroSolicitud VARCHAR(30)
AS
BEGIN
	DECLARE @IdTipoSol INT, @IdSol INT

	SELECT @IdSol = idsolicitud 
	FROM dbo.tbSeguimiento_Solicitud s

	DELETE FROM dbo.tbSeguimiento_RelArch_Seguimiento WHERE id_seg IN
	(SELECT seg.idSeguimiento
	FROM dbo.tbSeguimiento_Solicitud s
	INNER JOIN  dbo.tbSeguimiento_Seguimiento seg ON s.idsolicitud = seg.fk_Solicitud
	WHERE S.numero_solicitud = @NumeroSolicitud)
	
	DELETE FROM dbo.tbSeguimiento_RelArch_Solicitud WHERE id_sol = @IdSol
	 
	DELETE FROM dbo.tbSeguimiento_Seguimiento WHERE fk_Solicitud = @IdSol
	DELETE FROM dbo.tbSeguimiento_Solicitud WHERE numero_solicitud = @NumeroSolicitud
	DELETE FROM dbo.tbSeguimiento_Solicitud WHERE numero_solicitud_origen = @NumeroSolicitud
END

GO
/****** Object:  StoredProcedure [dbo].[paEscalamiento_poblartabla]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: DBO.paExtractos_ReporteExtractos
	Autor: Casa de Bolsa - Isabel Andrea Nagles
	Fecha:  20140422
	
	Descripcion : Pobla la tabla con los datos de las solicitudes sin finalizar
	
	
*/
CREATE PROCEDURE [dbo].[paEscalamiento_poblartabla]
as

SET DATEFORMAT YMD
TRUNCATE TABLE TBESCALAMIENTO


SELECT
 CIA.NOMBRE  Empresa,
 ltrim(rtrim(TS2.NombreTipoSolicitud)) + '/'  + ltrim(rtrim( TS1.NombreTipoSolicitud )) + '/' + replace(ltrim(rtrim( ts.NombreTipoSolicitud)), '/',' O ') TipoSolicitud ,
 numero_solicitud, 
 REPLACE( REPLACE( REPLACE(REPLACE(ISNULL(descripcion, ''),'
',''),CHAR(9),''),CHAR(10),''),CHAR(13),'') descripcion,
 isnull((select department from tbActive_Directory where sAMAccountName= creador ), '') 'Area' ,
 TS2.NombreTipoSolicitud Nivel1,TS1.NombreTipoSolicitud Nivel2,  ts.NombreTipoSolicitud Nivel3,
 valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Criticidad)[1]','VARCHAR(20)') 'Criticidad',
 ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Desarrollo)[1]','VARCHAR(40)'),'') 'Tipo_Desarrollo',
 fechaCreacion,  
 ES.Nombre 'Estado' ,   
 responsable,    
 LTRIM(rtrim(ISNULL(r.nombre,''))) + ' ' + LTRIM(rtrim(ISNULL(r.Apellido,'') )) Nombre_responsable, 
 fechaCierre,  
  CASE	 WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
	  'Urgente' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD))  <> 'NUEVO DESARROLLO'  THEN  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) 
			 ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Alta' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_alta,Ts.unidaddeMedida)  )
			 ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Media' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN   convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_media,Ts.unidaddeMedida))
		 	ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			'Baja' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN 
		 convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_baja,Ts.unidaddeMedida))
		 ELSE  CASE WHEN  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 0 then GETDATE() -900   
		 ELSE  CASE WHEN   LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 1 then
		     valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')
			 --ELSE  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		END END END END END END   Fechalimite,
Solicitante,
(select displayName from tbActive_Directory where sAMAccountName= Solicitante  ) 'Nombre_Solicitante' ,
(select title from tbActive_Directory where sAMAccountName= creador ) 'Cargo' ,
	CASE WHEN  ES.cierra_solicitud  = 1 THEN 0 
		ELSE CASE	 WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
	  'Urgente' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD))  <> 'NUEVO DESARROLLO'  THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) , 112), convert(varchar, GETDATE()-1, 112)) 
		ELSE  CASE WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Alta' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar,  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_alta,Ts.unidaddeMedida)  ) , 112), convert(varchar, GETDATE()-1, 112))
		ELSE  CASE WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Media' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_media,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE  CASE 	 WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			'Baja' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN 
		 [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE  CASE WHEN LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 0 then 999999   
		 ELSE  CASE WHEN  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 1 then
		     [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)'), 112), convert(varchar, GETDATE()-1, 112))
		  ELSE  0 
		 --ELSE  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 END END END END END END END  'Dias_Incumplimiento',
ISNULL((Select top 1 descripcion from tbSeguimiento_Seguimiento WHERE idSeguimiento  = (select MAX(idSeguimiento) from tbSeguimiento_Seguimiento WHERE  fk_Solicitud = s.idsolicitud)),'')  'Ultimo_Seguimiento',
  CASE WHEN (SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD ) IS NULL THEN  S.fechaCreacion
		 WHEN	(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO )) IS NULL THEN 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  ) 
		 ELSE 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO ))
        END   Fecha_Estado,
      (select displayName from tbActive_Directory where sAMAccountName= r.usuariont_superior ) 'Nombre_Superior' ,
r.usuariont_superior,
J.correo_electronico 
INTO #TMPESCALA
FROM dbo.tbSeguimiento_Solicitud s
	INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD ES ON S.ESTADO = ES.IDSOL
	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS ON S.FK_TIPOSOLICITUD = TS.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS1 ON TS.IDTIPOSOL_PADRE = TS1.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS2 ON TS1.IDTIPOSOL_PADRE = TS2.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE R ON RESPONSABLE  = USUARIONT 
	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE AS J  ON R.USUARIONT_SUPERIOR  = J.USUARIONT 
	LEFT JOIN DBO.TBSEGUIMIENTO_RELTIPOSOL_EMPRESA    AS C  ON S.FK_TIPOSOLICITUD  = C.IDTIPOSOL 
	LEFT JOIN DBO.TBSEGUIMIENTO_EMPRESA   AS CIA  ON C.IDEMPRESA  = CIA.ID_EMPRESA  
 WHERE S.ESTADO NOT IN (9,8)


--SELECT
-- CIA.NOMBRE  Empresa,
-- ltrim(rtrim(TS2.NombreTipoSolicitud)) + '/'  + ltrim(rtrim( TS1.NombreTipoSolicitud )) + '/' + replace(ltrim(rtrim( ts.NombreTipoSolicitud)), '/',' O ') TipoSolicitud ,
-- numero_solicitud, 
-- REPLACE( REPLACE( REPLACE(REPLACE(ISNULL(descripcion, ''),'
--',''),CHAR(9),''),CHAR(10),''),CHAR(13),'') descripcion,
-- isnull((select department from tbActive_Directory where sAMAccountName= creador ), '') 'Area' ,
-- TS2.NombreTipoSolicitud Nivel1,TS1.NombreTipoSolicitud Nivel2,  ts.NombreTipoSolicitud Nivel3,
-- valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Criticidad)[1]','VARCHAR(20)') 'Criticidad',
-- valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Desarrollo)[1]','VARCHAR(40)') 'Tipo_Desarrollo',
-- fechaCreacion,  
-- ES.Nombre 'Estado' ,   
-- responsable,    
-- LTRIM(rtrim(r.nombre)) + ' ' + LTRIM(rtrim(r.Apellido )) Nombre_responsable, 
-- fechaCierre,  
-- case   SUBSTRING(CONVERT(VARCHAR(MAX), S.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
--      CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))
--      when 'Urgente' then convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.Prioridad_urgente,Ts.unidaddeMedida) )
--      when 'Alta' then convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_alta,Ts.unidaddeMedida)  )
--      when 'Media' then convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_media,Ts.unidaddeMedida))
--      else convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_baja,Ts.unidaddeMedida))
--      End Fechalimite,
--Solicitante,
--(select displayName from tbActive_Directory where sAMAccountName= Solicitante  ) 'Nombre_Solicitante' ,
--(select title from tbActive_Directory where sAMAccountName= creador ) 'Cargo' ,
--CASE WHEN FECHACIERRE IS NOT NULL THEN 0 ELSE 
--	  CASE   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
--                            CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))
--      when 'Urgente' then  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) +1, 112), convert(varchar, GETDATE(), 112)) 
--      when 'Alta' then [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar,  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_alta,Ts.unidaddeMedida)  ) +1, 112), convert(varchar, GETDATE(), 112))
--      when 'Media' then  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_media,Ts.unidaddeMedida)) +1, 112), convert(varchar, GETDATE(), 112))
--      else  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_baja,Ts.unidaddeMedida)) +1, 112), convert(varchar, GETDATE(), 112))
--      End end 'Dias_Incumplimiento',
--(Select top 1 descripcion from tbSeguimiento_Seguimiento WHERE fachaFinal = (select MAX(fachaFinal) from tbSeguimiento_Seguimiento WHERE  fk_Solicitud = s.idsolicitud))  'Ultimo_Seguimiento',
--(select min(fechaseguimiento) from  tbSeguimiento_Seguimiento   where fk_Solicitud = s.idsolicitud  and estado = s.estado  and fechaseguimiento >
--       (select MAX(fechaseguimiento) from tbSeguimiento_Seguimiento where fk_Solicitud = s.idsolicitud  and estado <> s.estado )) Fecha_Estado,
--      (select displayName from tbActive_Directory where sAMAccountName= r.usuariont_superior ) 'Nombre_Superior' ,
--r.usuariont_superior,
--J.correo_electronico 
--INTO #TMPESCALA
--FROM dbo.tbSeguimiento_Solicitud s
--	INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD ES ON S.ESTADO = ES.IDSOL
--	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS ON S.FK_TIPOSOLICITUD = TS.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS1 ON TS.IDTIPOSOL_PADRE = TS1.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS2 ON TS1.IDTIPOSOL_PADRE = TS2.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE R ON RESPONSABLE  = USUARIONT 
--	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE AS J  ON R.USUARIONT_SUPERIOR  = J.USUARIONT 
--	LEFT JOIN DBO.TBSEGUIMIENTO_RELTIPOSOL_EMPRESA    AS C  ON S.FK_TIPOSOLICITUD  = C.IDTIPOSOL 
--	LEFT JOIN DBO.TBSEGUIMIENTO_EMPRESA   AS CIA  ON C.IDEMPRESA  = CIA.ID_EMPRESA  
-- WHERE S.ESTADO NOT IN (9,8)
--        AND  TS.NOMBRETIPOSOLICITUD NOT LIKE '%NUEVO DESARROLLO%'
--        --AND IDEMPRESA <> 2
--UNION ALL 
--SELECT
--Cia.nombre  Empresa,
--ltrim(rtrim(TS2.NombreTipoSolicitud)) + '/'  + ltrim(rtrim( TS1.NombreTipoSolicitud )) + '/' + replace(ltrim(rtrim( ts.NombreTipoSolicitud)), '/',' O ') TipoSolicitud ,
--numero_solicitud, 
-- REPLACE( REPLACE( REPLACE(REPLACE(ISNULL(descripcion, ''),'
--',''),CHAR(9),''),CHAR(10),''),CHAR(13),'') descripcion,
--isnull((select department from tbActive_Directory where sAMAccountName= creador ), '') 'Area' ,
-- TS2.NombreTipoSolicitud Nivel1,TS1.NombreTipoSolicitud Nivel2,  ts.NombreTipoSolicitud Nivel3,
-- valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Criticidad)[1]','VARCHAR(20)') 'Criticidad',
-- valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Desarrollo)[1]','VARCHAR(40)') 'Tipo_Desarrollo',
-- fechaCreacion,  ES.Nombre 'Estado' ,   
-- responsable,    
-- LTRIM(rtrim(r.nombre)) + ' ' + LTRIM(rtrim(r.Apellido )) Nombre_responsable, 
-- fechaCierre,  
-- valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)') Fechalimite,
-- Solicitante,
-- (select displayName from tbActive_Directory where sAMAccountName= Solicitante  ) 'Nombre_Solicitante' ,
-- (select title from tbActive_Directory where sAMAccountName= creador ) 'Cargo' ,
--CASE WHEN valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)') IS  NULL THEN 0 ELSE 
--    [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')+1, 112), convert(varchar, GETDATE()-1, 112))
--      End  'Dias_Incumplimiento',
--(Select top 1 descripcion from tbSeguimiento_Seguimiento WHERE fachaFinal = (select MAX(fachaFinal) from tbSeguimiento_Seguimiento WHERE 
--    fk_Solicitud = s.idsolicitud))  'Ultimo_Seguimiento',
--(select min(fechaseguimiento) from  tbSeguimiento_Seguimiento 
--     where fk_Solicitud = s.idsolicitud  and estado = s.estado  and fechaseguimiento >
--       (select MAX(fechaseguimiento) from tbSeguimiento_Seguimiento where fk_Solicitud = s.idsolicitud  and estado <> s.estado )) Fecha_Estado,
--      (select displayName from tbActive_Directory where sAMAccountName= r.usuariont_superior ) 'Nombre_Superior' ,
--r.usuariont_superior,
--J.correo_electronico 
--FROM DBO.TBSEGUIMIENTO_SOLICITUD S
--	INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD ES ON S.ESTADO = ES.IDSOL
--	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS ON S.FK_TIPOSOLICITUD = TS.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS1 ON TS.IDTIPOSOL_PADRE = TS1.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS2 ON TS1.IDTIPOSOL_PADRE = TS2.IDTIPOSOLICITUD
--	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE R ON RESPONSABLE  = USUARIONT 
--	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE AS J  ON R.USUARIONT_SUPERIOR  = J.USUARIONT 
--	LEFT JOIN DBO.TBSEGUIMIENTO_RELTIPOSOL_EMPRESA    AS C  ON S.FK_TIPOSOLICITUD  = C.IDTIPOSOL 
--	LEFT JOIN DBO.TBSEGUIMIENTO_EMPRESA   AS CIA  ON C.IDEMPRESA  = CIA.ID_EMPRESA  
--WHERE S.ESTADO NOT IN (9,8) 
-- --AND IDEMPRESA <> 2
-- AND  TS.NOMBRETIPOSOLICITUD LIKE '%NUEVO DESARROLLO%'


INSERT INTO TBESCALAMIENTO
SELECT DISTINCT * FROM #TMPESCALA
GO
/****** Object:  StoredProcedure [dbo].[paExtractos_ReporteExtractosPruebas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: DBO.paExtractos_ReporteExtractos
	Autor: Yoany Gomez Zapata
	Fecha:  03 de Octubre de 2011
	
	Descripcion : Permite generar el reporte de validacion de pruebas en la generacion de extractos
	
	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	
*/
CREATE PROCEDURE [dbo].[paExtractos_ReporteExtractosPruebas]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME
AS
BEGIN
	SELECT 
		IDCLIENTE , SALDO, ISNULL([MVTO OPERACIONES A PLAZO],0) [OPERACIONES A PLAZO]
		,ISNULL([MVTO CONTABLE MENSUAL],0) [MOVIMIENTO]
		,ISNULL([PORTAFOLIO RENTA FIJA],0) [RENTA FIJA]
		,ISNULL([PORTAFOLIO ACCIONES],0) [ACCIONES]
		,ISNULL([NADA],0) [NADA]
		INTO #TEMP_CLIENTES
	FROM
	(

		SELECT DISTINCT C.IDCLIENTE AS IDCLIENTE, SALDO, ISNULL([TIPO REGISTRO],'NADA') AS ESTADO, COUNT(0) CANTIDAD 
		FROM DBOYD.DBO.TBLEXTRACTOS_CLIENTESPROCESAR C
		LEFT JOIN  DBOYD.DBO.TBLEXTRACTOS_PORTAFOLIO P ON  C.IDCLIENTE = P.[CODIGO CLIENTE]
		GROUP BY C.IDCLIENTE , SALDO , [TIPO REGISTRO]
	) 
	AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ([MVTO OPERACIONES A PLAZO],[MVTO CONTABLE MENSUAL],[PORTAFOLIO RENTA FIJA],[PORTAFOLIO ACCIONES],[NADA])
	)	AS PIVOTTABLE  ;

	SELECT 
		GETDATE() AS FECHA_PROCESO , @FECHA_INI AS FECHA_INICIAL , 
		@FECHA_FIN  AS  FECHA_FINAL , 0 AS MONTO_MINIMO, 
		200000000 AS MONTO_MAXIMO , IDCLIENTE ,CLI.STRNRODOCUMENTO AS DOCUMENTO,
		CLI.STRNOMBRE AS NOMBRE,  SALDO, R.STRNOMBRE AS [NOMBRE COMERCIAL],
		CASE  WHEN [OPERACIONES A PLAZO] > 0 THEN '1' ELSE '0' END  AS [OPERACIONES A PLAZO],
		CASE  WHEN [MOVIMIENTO] > 0 THEN '1' ELSE '0' END  AS [MOVIMIENTO],
		CASE  WHEN [RENTA FIJA] > 0 THEN '1' ELSE '0' END  AS [RENTA FIJA] ,
		CASE  WHEN [ACCIONES] > 0 THEN '1' ELSE '0' END  AS [ACCIONES],
		ISNULL(CLI.strEnviarInformeEconomico,0) AS [ENVIO CORREO], 
		CASE CLI.STRTIPOSEGMENTO WHEN 17 THEN 'VIP' ELSE '' END AS CLIENTE_VIP ,
		CASE (SELECT TOP 1 1 FROM  DBOYD.DBO.TBLCONCILIACIONCDB  WITH(NOLOCK) WHERE DOCUMENTO_OYD = CLI.STRNRODOCUMENTO AND CONVERT(VARCHAR(20), FECHA_CORTE, 101) = CONVERT(VARCHAR(20), @FECHA_FIN, 101) )
		WHEN 1 THEN '1' ELSE '0' END INCONSISTENCIAS 
	FROM #TEMP_CLIENTES
	INNER JOIN DBOYD.DBO.TBLCLIENTES CLI WITH(NOLOCK) ON  CLI.LNGID = #TEMP_CLIENTES.IDCLIENTE
	INNER JOIN  DBOYD.DBO.TBLCLIENTESRECEPTORES CR WITH(NOLOCK) ON CR.LNGIDCOMITENTE  = CLI.LNGID AND CR.LOGLIDER = 1
	INNER JOIN DBOYD.DBO.TBLRECEPTORES R WITH(NOLOCK) ON CR.STRIDRECEPTOR = R.STRID
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizacionAutomaticaEstado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ActualizacionAutomaticaEstado
	Fecha:	10 de febrero de 2014
	Autor:  Camilo Esteban Buitrago

	Descripcion: Permite la actualizacion de estado y la descripcion de una solicitud 
	
	Modificaciones:				
	Autor:						Fecha:
	Descripcion:

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ActualizacionAutomaticaEstado]
@IDSOL INT, 
@IDESTADO INT,
@NUMEROSOL varchar(50),
@CREADOR varchar(50),
@SOLICITANTE varchar(50),
@DESCRIPCION VARCHAR(500),
@IDSEG INT
AS
BEGIN

DECLARE @QUERYSTRING VARCHAR(700)=''
DECLARE @ACTUALIZACION INT = 0
DECLARE @ESTADO_DEST INT =0 
DECLARE @CONDICION VARCHAR(500)=''

    Select top 1 @ESTADO_DEST = estado_destino, @CONDICION = condicion 
    from dbo.tbSeguimiento_ActualizacionAutomaticaSolicitud 
    where estado_origen = @IDESTADO
    print '@ESTADO_DEST '+ cast(@ESTADO_DEST as varchar) +' @CONDICION '+ cast(@CONDICION as varchar)
    if(@ESTADO_DEST <> 0 and @CONDICION <> '') 
    begin
      SET @QUERYSTRING= 'UPDATE TBSEGUIMIENTO_SEGUIMIENTO SET estado = '+ cast(@ESTADO_DEST as varchar)+' WHERE idSeguimiento = '+ cast(@IDSEG as varchar)+' and '+cast(REPLACE(REPLACE(REPLACE(REPLACE(@CONDICION,'@solicitante',isnull(@SOLICITANTE,'')),'@creador',isnull(@CREADOR,'')),'@idSolicitud',isnull(@NUMEROSOL,'')),'@descripcion',isnull(@DESCRIPCION,'')) as varchar)
      --SET @QUERYSTRING= 'UPDATE TBSEGUIMIENTO_SEGUIMIENTO SET estado = '+ cast(@ESTADO_DEST as varchar)+' WHERE idSeguimiento = '+ cast(@IDSOL as varchar)+' and '+cast(REPLACE(@CONDICION,'@solicitante',@SOLICITANTE) as varchar)
      print @QUERYSTRING
      EXECUTE(@QUERYSTRING)
      select @ESTADO_DEST as nuevoEstado
    end
    else
        select @IDESTADO as nuevoEstado
    
    
END


    
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarEncuestaServicio]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ActualizarEncuestaServicio
	Fecha:	29 de Abril 2010
	Autor:	David Olaciregui

	Descripcion: Modifircar la encuesta de servicio
	EXEC paSeguimiento_ActualizarEncuestaServicio 1899,1,'Aceptada'
*/
CREATE procedure [dbo].[paSeguimiento_ActualizarEncuestaServicio]
@idsol int,
@idNivel int,
@aceptacion varchar(50)
as
BEGIN

DECLARE @QUERYSTRING VARCHAR(500)=''
DECLARE @UPDATEFIELDS VARCHAR(200)=''
DECLARE @CRITERIOACEPT INT = 0

IF @idNivel <> 0
BEGIN
	SET @UPDATEFIELDS = 'idNivelServicio='+cast(@idNivel as varchar)
END

IF LEN(@UPDATEFIELDS) > 0
BEGIN
	SET @UPDATEFIELDS = @UPDATEFIELDS+','
END

IF LEN(@aceptacion) > 0
BEGIN

	IF @aceptacion = 'Aceptada'
	BEGIN
		SET @CRITERIOACEPT=1
	END
	
	IF @aceptacion = 'Rechazada'
	BEGIN
		UPDATE TBSEGUIMIENTO_SOLICITUD SET estado=12 WHERE IDSOLICITUD = @IDSOL
	END

	SET @UPDATEFIELDS = @UPDATEFIELDS+'ACEPTADA='+cast(@CRITERIOACEPT as varchar)
END
 
	SET @QUERYSTRING= 'UPDATE TBSEGUIMIENTO_SOLICITUD SET '+ @UPDATEFIELDS +' WHERE IDSOLICITUD = '+ cast(@IDSOL as varchar)

	EXECUTE(@QUERYSTRING)
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarEstadoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paSeguimiento_ActualizarEstadoSol
	Fecha:	09 de Septiembre 2010
	Autor:  Yoany Gomez Zapata

	Descripcion: Permite la actualizacion de estado de una solicitud
	
	Modificaciones:				
	Autor:						Fecha:
	Descripcion:

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ActualizarEstadoSol]
@IDSOL INT, 
@IDESTADO INT
AS
BEGIN
	UPDATE tbSeguimiento_solicitud SET estado = @IDESTADO
	WHERE idsolicitud = @IDSOL
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarEstadoSolDes]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ActualizarEstadoSolDes
	Fecha:	24 de Mayo 2012
	Autor:  Andres Felipe Vargas

	Descripcion: Permite la actualizacion de estado y la descripcion de una solicitud 
	
	Modificaciones:				
	Autor:						Fecha:
	Descripcion:

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ActualizarEstadoSolDes]
@IDSOL INT, 
@IDESTADO INT,
@DESCRIPCION VARCHAR(500)
AS
BEGIN
	UPDATE tbSeguimiento_solicitud SET estado = @IDESTADO, descripcion=@DESCRIPCION
	WHERE idsolicitud = @IDSOL
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ActualizarResponsable
	Fecha:	20 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Modifircar el responsable de la solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
create procedure [dbo].[paSeguimiento_ActualizarResponsable]
@idsol int,
@responsable varchar(50)
as
BEGIN
	UPDATE tbSeguimiento_Solicitud SET responsable = @responsable 
	WHERE idsolicitud = @idsol
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--set dateformat dmy execute [paSeguimiento_ActualizarSeguimiento] 1,'prueba','11/12/2009', '10/12/2009',1,0

--select * from [tbSeguimiento]

CREATE PROCEDURE [dbo].[paSeguimiento_ActualizarSeguimiento]
@idSeguimiento int,
@descripcion varchar(250),
@fechaInicio datetime,
@fachaFinal datetime,
@fk_Solicitud int,@estado int


AS

SET NOCOUNT ON

UPDATE [dbo].[tbSeguimiento_Seguimiento]
   SET [descripcion] = @descripcion,
       [fechaInicio] = @fechaInicio, 
       [fachaFinal] = @fachaFinal, 
       [fk_Solicitud] = @fk_Solicitud, 
       [estado] = @estado
 WHERE idSeguimiento=@idSeguimiento


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ActualizarSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Fecha: 28/05/2012

Creado Por: Andres Vargas SQDMAFV

Modificacion: Se cambio las longitudes de las variables 
			  para que no se cortara la descripcion

*/



CREATE PROCEDURE [dbo].[paSeguimiento_ActualizarSolicitud]

  @asunto varchar(500),
  @descripcion varchar(600),
  @fechaAsignacion VARCHAR(50),
  @fechaCreacion VARCHAR(50),
  @Fechafinalizacion VARCHAR(50),
  @prioridad int,
  @fk_responsable VARCHAR(50),
  @fk_tipoSolicitud int,
  @estado int, 
  @idsolicitud int,
  @xmlCamposDinamicos xml	
AS

IF @Fechafinalizacion = ''
	SET @Fechafinalizacion = NULL
	
SET NOCOUNT ON
SET DATEFORMAT ymd
UPDATE [dbo].[tbSeguimiento_Solicitud]
   SET [asunto] = @asunto
      ,[descripcion] = @descripcion
     -- ,[fechaAsignacion] = @fechaAsignacion
     -- ,[fechaCreacion] = @fechaCreacion
      ,[Fechafinalizacion] = @Fechafinalizacion
      ,[prioridad] = @prioridad
      ,[responsable] = @fk_responsable
      ,[fk_tipoSolicitud] = @fk_tipoSolicitud
      , estado = @estado
	  , valor_campos_dinamicos = @xmlCamposDinamicos
 WHERE idsolicitud = @idsolicitud
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_CargarResponsables]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_CargarResponsables
	Autor: Andres Vargas Clavijo
	Fecha de Creacion: 01 de junio de 2012
	

	Autor: Dairon Castro Casas		
	Fecha: 07 de Octubre del 2020
	Modificaciones: Validacion para saber si es un registro o una consulta para manipular la data que vera el usuario
	Historia de usuario: 19719 - Modificaciones Help Desk - SGS
*/
CREATE PROCEDURE [dbo].[paSeguimiento_CargarResponsables]
@consulta BIT
AS
BEGIN
	IF @consulta = 1
		SELECT [displayName] AS Nombre,[sAMAccountName] AS usuariont
		from  [dbo].[tbActive_Directory]
		UNION
		SELECT (Nombre + ' ' + Apellido) AS Nombre,usuariont
		FROM  [tbSeguimiento_Responsable] WHERE estado = 1 ORDER BY 1
	ELSE
		select (Nombre + ' ' + Apellido) as Nombre,usuariont
		from  [tbSeguimiento_Responsable] where estado = 1 order by 1
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConcultarCamposUserDA]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConcultarCamposUserDA
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	28 de Mayo de 2012

	Descripcion : Permite la consulta del Directorio Activo
    
    Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	13 de Febrero de 2013
	  Descripcion:	adicion del parametro EstadoUsuario.
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConcultarCamposUserDA]
    @EstadoUsuario BIT
AS
BEGIN
    DECLARE @NSql NVARCHAR(1000)
    
    SET @NSql = '
        SELECT
            *
        FROM DBO.TBACTIVE_DIRECTORY AS AD '
    
    IF @EstadoUsuario IS NOT NULL
        SET @NSql = @NSql + 'WHERE AD.IsActiveAccount = ' + CAST(@EstadoUsuario AS VARCHAR(2))
    
    EXECUTE  Sp_ExecuteSql @NSql
    
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAdjRequeridoByTsol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAdjRequeridoByTsol]
@id_tiposol int 
AS
BEGIN
	select ISNULL(adjuntoRequerido,'false')
	from dbo.tbSeguimiento_tiposolicitud
	WHERE idTipoSolicitud = @id_tiposol
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAnexos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAnexos
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Septiembre 2010

	Descripcion: Permite la consulta de los anexos de solicitudes

	Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	08 de Febrero de 2013
	  Descripcion:	Adicion del campo Usuario a las consultas.
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAnexos]
    @Id_Sol INT
AS
BEGIN
	SELECT
        Nombre_Archivo AS Nombre,
        Descripcion_Arch AS Descripcion,
        ISNULL(ISNULL(AD.DisplayName,SAS.Usuario),'')  AS Usuario,
        Fecha_Cargue AS Fecha
	FROM DBO.TBSEGUIMIENTO_RELARCH_SOLICITUD AS SAS WITH(NOLOCK)
    
    LEFT JOIN DBO.TBACTIVE_DIRECTORY AS AD
    ON AD.SamAccountName = SAS.Usuario
    
	WHERE Id_sol = @Id_Sol 
	
    UNION
	
    SELECT
        Nombre_Archivo AS Nombre,
        Descripcion_Arch AS Descripcion,
        ISNULL(ISNULL(AD.DisplayName,SEA.Usuario),'') AS Usuario,
        Fecha_Cargue AS Fecha
	FROM DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO AS SEA WITH(NOLOCK) 
	
    INNER JOIN TBSEGUIMIENTO_SEGUIMIENTO AS SE
    ON SEA.Id_Seg = SE.IdSeguimiento
    
    LEFT JOIN DBO.TBACTIVE_DIRECTORY AS AD
    ON AD.SamAccountName = SEA.Usuario
	
    WHERE Fk_Solicitud = @Id_Sol 

END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAnexosSeg]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAnexosSeg
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Septiembre 2010

	Descripcion: Permite la consulta de los anexos de solicitudes

	Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	08 de Febrero de 2013
	  Descripcion:	Adicion del campo Usuario a la consulta.
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAnexosSeg]
    @Id_Seg INT
AS
BEGIN
	SELECT
        Nombre_Archivo AS Nombre,
        Descripcion_Arch AS Descripcion,
        AD.DisplayName AS Usuario,
        Fecha_Cargue AS Fecha
	FROM DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO AS SAS WITH(NOLOCK)
    
    INNER JOIN DBO.TBACTIVE_DIRECTORY AS AD
    ON AD.SamAccountName = SAS.Usuario
	
    WHERE Id_Seg = @Id_Seg
    
    ORDER BY Fecha_Cargue
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAplicaciones]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAplicaciones
	Autor:	Yoany Gomez Zapata
	Fecha:	18 de Septiembre de 2010

	Descripcion : Permite la consulta de las aplicaciones 

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAplicaciones]
@TIPO VARCHAR(1)
AS
BEGIN
SELECT id_aplicacion,nombre_aplicacion,tipo_alpicacion 
FROM tbSeguimiento_Aplicaciones	
where tipo_alpicacion = @TIPO 
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarArbolProceso]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_HELPTEXT paSeguimiento_ConsultarArbolProceso

/*
	Nombre: paSeguimiento_ConsultarArbolProceso
	Fecha: 19 de Noviembre de 2010
	Autor: Yoany Gomez Zapata
	
	Descripcion : Permite la consulta del arblos de proceso por solicitud

	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	paSeguimiento_ConsultarArbolProceso 'CDB-TEC-32'
	exec paSeguimiento_ConsultarArbolProceso @NUMPROCESO='CDB-TEC-138'
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarArbolProceso] 
@NUMPROCESO VARCHAR(100)
AS
BEGIN
	
	DECLARE @TEMPTABLE_ARBOL TABLE 
	( 
		NOMBRENODO VARCHAR(100), 
		IDENTIFICADORNODO VARCHAR(100), 
		IDENTIFICADORPADRE VARCHAR(100) , 
		FECHAFINALIZACION DATETIME, 
		ESTADO INT
	)

	--BUSCANDO EL PADRE
	DECLARE @NUM_PAPA VARCHAR(100)
	DECLARE @NUM VARCHAR(100)
	DECLARE @NUMRESUL VARCHAR(100)
	SET @NUM_PAPA = ''
	SET @NUM = @NUMPROCESO
	SET @NUMRESUL = ''

	WHILE @NUM <> '' AND @NUM IS NOT NULL
	BEGIN
		SELECT @NUM_PAPA=NUMERO_SOLICITUD_ORIGEN 
		FROM TBSEGUIMIENTO_SOLICITUD 
		WHERE NUMERO_SOLICITUD = @NUM
		
		SET @NUM = @NUM_PAPA
		IF @NUM <> '' AND @NUM IS NOT NULL
				SET @NUMRESUL = @NUM
	END
	
	IF @NUMRESUL = '' OR @NUMRESUL IS NULL
		SET @NUMRESUL = @NUMPROCESO
		
		-----------------------------------------
		
--		print @NUMRESUL
		
			DECLARE @TEMPTABLE TABLE 
	( 
		NombreNodo VARCHAR(100), 
		IdentificadorNodo VARCHAR(100), 
		IdentificadorPadre VARCHAR(100) , 
		FechaFinalizacion datetime, 
		Estado int
	)
	
	DECLARE @prioridad as NVARCHAR(80)
	DECLARE @SQLAUX NVARCHAR(2000)
	SET @SQLAUX = ' select @prioridad = ''Prioridad_''+valor_campos_dinamicos.value(''(/cdb/CamposDinamicos/Criticidad)[1]'',''VARCHAR(20)'') from tbSeguimiento_Solicitud WHERE numero_solicitud = ' + CHAR(39) +@NUMRESUL +CHAR(39)
	--print @SQLAUX
	
	Exec sp_executesql @SQLAUX,N'@prioridad NVARCHAR(50) OUTPUT',@prioridad OUTPUT
	--print @prioridad

	-- INSERTANDO EL PADRE

SELECT @SQLAUX = '	
	SELECT T.NOMBRETIPOSOLICITUD + '' - ('' + NUMERO_SOLICITUD + '')'',  NUMERO_SOLICITUD, 
	CASE NUMERO_SOLICITUD_ORIGEN WHEN '''' THEN ''0'' ELSE ISNULL(NUMERO_SOLICITUD_ORIGEN,''0'') END, 
	ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,' + @prioridad + ',T.unidaddeMedida)) AS FECHAFINALIZACION,
	s.ESTADO
	FROM TBSEGUIMIENTO_SOLICITUD S 
	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
	WHERE NUMERO_SOLICITUD = '+ CHAR(39) +@NUMRESUL +CHAR(39) 

	
	
	INSERT INTO @TEMPTABLE 
	EXECUTE  sp_executesql @SQLAUX



SELECT @SQLAUX =	'
	SELECT T.NOMBRETIPOSOLICITUD + '' - (''+ NUMERO_SOLICITUD + '')'',  NUMERO_SOLICITUD, 
	CASE NUMERO_SOLICITUD_ORIGEN WHEN '''' THEN ''0'' ELSE ISNULL(NUMERO_SOLICITUD_ORIGEN,''0'') END,  
	ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,' + @prioridad + ',T.unidaddeMedida)) AS FECHAFINALIZACION,
	s.ESTADO
	FROM TBSEGUIMIENTO_SOLICITUD S INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T
	ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
	WHERE NUMERO_SOLICITUD_ORIGEN = ' + CHAR(39) +@NUMRESUL +CHAR(39)
	
	print @SQLAUX
	
	INSERT INTO @TEMPTABLE 
	EXECUTE  sp_executesql @SQLAUX
	--

	DECLARE @SQL VARCHAR(6000)
	SET @SQL = ''
	SET @SQL = @SQL + 'DECLARE @AUX VARCHAR(100)'
	-- PROCESANDO LOS HIJOS
	SET @SQL = @SQL + 'DECLARE CUR_1' + REPLACE(@NUMRESUL,'-','') + ' CURSOR FOR '
		
	SET @SQL = @SQL + 'SELECT NUMERO_SOLICITUD '
	SET @SQL = @SQL + 'FROM TBSEGUIMIENTO_SOLICITUD '
	SET @SQL = @SQL + 'WHERE NUMERO_SOLICITUD_ORIGEN =''' + @NUMRESUL +''''

	SET @SQL = @SQL + ' OPEN CUR_1' + REPLACE(@NUMRESUL,'-','') 

	SET @SQL = @SQL + ' FETCH NEXT FROM CUR_1' + REPLACE(@NUMRESUL,'-','') + ' INTO @AUX '
		SET @SQL = @SQL + ' WHILE @@FETCH_STATUS = 0 '
		SET @SQL = @SQL + ' BEGIN '
			SET @SQL = @SQL + ' EXEC paSeguimiento_ConsultarHojasProceso @AUX '
			SET @SQL = @SQL + ' FETCH NEXT FROM CUR_1' + REPLACE(@NUMRESUL,'-','') + ' INTO @AUX '
		SET @SQL = @SQL + ' END '
	SET @SQL = @SQL + ' CLOSE CUR_1' + REPLACE(@NUMRESUL,'-','') 
	SET @SQL = @SQL + ' DEALLOCATE CUR_1' + REPLACE(@NUMRESUL,'-','') 

	--PRINT '@SQL' +  @SQL
	EXEC(@SQL)
		------------------------------------------
	
	INSERT INTO @TEMPTABLE_ARBOL
	--EXEC paSeguimiento_ConsultarHojasProceso @NUMRESUL
	select * from @TEMPTABLE
	SELECT DISTINCT * FROM @TEMPTABLE_ARBOL ORDER BY 2
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAreas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarSucursales
	Autor:	Yoany Gomez Zapata
	Fecha:	18 de Septiembre de 2010

	Descripcion : Permite la consulta de las Areas

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAreas]
AS
BEGIN
	SELECT id_Area,nombre FROM tbSeguimiento_Area
	WHERE activo = 1
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAreasByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAreasByID
	Autor:	Yoany Gomez Zapata
	Fecha:	22 de Septiembre de 2010

	Descripcion : Permite la consulta de las Areas

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAreasByID]
@id_Area int 
AS
BEGIN
	SELECT usuario_reponsable,nombre FROM tbSeguimiento_Area WITH(NOLOCK)
	WHERE id_Area = @id_Area
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAreasByNombre]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAreasByNombre
	Autor:	Yoany Gomez Zapata
	Fecha:	22 de Septiembre de 2010

	Descripcion : Permite la consulta de las Areas

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAreasByNombre]
@nombre varchar(100) 
AS
BEGIN
	SELECT usuario_reponsable,nombre,id_Area FROM tbSeguimiento_Area WITH(NOLOCK)
	WHERE nombre = @nombre
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarAreasInSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarAreaCreador
	Fecha:	08 Septiembre 2010
	Autor:	Yoany Gomez Zapata
	
	Descripcion: Consultar Prioirdades

	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarAreasInSolicitud]
AS
BEGIN
	select distinct area_creador from dbo.tbSeguimiento_Solicitud
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCamposDinamicosByIdCampo]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.[paSeguimiento_ConsultarCamposDinamicosByIdCampo]
	Fecha:  22 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Permite la consulta de campos dinamicos por ID


	Modificaciones:				
	Autor:							Fecha:
	Derscripcion:
*/
create PROCEDURE [dbo].[paSeguimiento_ConsultarCamposDinamicosByIdCampo]
@IDCAMPO INT 
AS
BEGIN
	select id_campo,tipo_campo,nombre_campo,tipo_solicitud,
		isnull(valor_default,'') as valor_default,
	isnull(long_min,0) as long_min ,isnull(long_max,0) as long_max,isnull(select_campo,'') as select_campo,
	isnull(valor_campo,'') as valor_campo,
		isnull(valor_texto,'') as valor_texto,isnull(lista_items,'') as lista_items
	from dbo.tbSeguimiento_CampoDinamico with(nolock)
	WHERE id_campo = @IDCAMPO 
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCamposDinamicosByIDSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre : paSeguimiento_ConsultarCamposDinamicosByIDSol	
	Autor: Yoany Gomez Zapata
	Fecha: 25 Novimebre de 2010
	
	Descripcion: Permite la consulta de los campos de los valores dinamicos
				de una solicitud
				
	Modficaciones : 
	Autor:						Fecha:
	Descripcion:						
*/
CREATE procedure [dbo].[paSeguimiento_ConsultarCamposDinamicosByIDSol]
@idsolicitud int
AS
select valor_campos_dinamicos 
from dbo.tbSeguimiento_Solicitud with(nolock)
where idsolicitud = @idsolicitud


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCamposDinamicosByTsol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.paSeguimiento_ConsultarCamposDinamicosByTsol
	Fecha:  22 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Permite la consulta de campos dinamicos por tipo de solicitud


	Modificaciones:				
	Autor:							Fecha:
	Derscripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarCamposDinamicosByTsol]
@IDTIPOSOL INT ,
@BSEGUIMIENTO BIT 
AS
BEGIN
	
	SELECT ID_CAMPO,TIPO_CAMPO,NOMBRE_CAMPO,TIPO_SOLICITUD,
	ISNULL(VALOR_DEFAULT,'') AS VALOR_DEFAULT,
	ISNULL(LONG_MIN,0) AS LONG_MIN ,ISNULL(LONG_MAX,0) AS LONG_MAX,ISNULL(SELECT_CAMPO,'') AS SELECT_CAMPO,
	ISNULL(VALOR_CAMPO,'') AS VALOR_CAMPO,
	ISNULL(VALOR_TEXTO,'') AS VALOR_TEXTO,ISNULL(LISTA_ITEMS,'') AS LISTA_ITEMS,
	SEGUIMIENTO
	FROM DBO.TBSEGUIMIENTO_CAMPODINAMICO WITH(NOLOCK)
	WHERE TIPO_SOLICITUD = @IDTIPOSOL AND SEGUIMIENTO = @BSEGUIMIENTO
	 ORDER BY ORDEN
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCorreoByUser]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarCorreoByUser] 
@SAMACCOUNT VARCHAR(1000) 
AS 
BEGIN 
IF NOT EXISTS (SELECT MAIL FROM TBACTIVE_DIRECTORY 
WHERE SAMACCOUNTNAME=@SAMACCOUNT) 
SELECT 'HELPDESK@CORFICOLOMBIANA.COM' MAIL 
ELSE 
SELECT MAIL FROM TBACTIVE_DIRECTORY 
WHERE SAMACCOUNTNAME=@SAMACCOUNT 
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCorreoByUser_output]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paSeguimiento_ConcultarCamposUserDA
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	28 de Mayo de 2012

	Descripcion : Permite la consulta del Directorio Activo por Usuario

*/

create PROCEDURE [dbo].[paSeguimiento_ConsultarCorreoByUser_output]
@samAccount VARCHAR(1000),
@Email VARCHAR(50) OUTPUT
AS
BEGIN
select @Email=Mail from tbActive_Directory
where sAMAccountName=@samAccount

END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarCriticidad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarCriticidad
	Fecha:	06 de julio 2012
	Autor:	Andres Vargas
	
	Descripcion: Consultar Prioirdades

	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarCriticidad]
AS
BEGIN
	SELECT idCritidad as idCriticidad,Descripcion,estado 
	FROM tbSeguimiento_Criticidad WITH(NOLOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarDatosBasicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarDatosBasicos
	Fecha:	20 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: consultar datos basicos de la solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarDatosBasicos]
@id_solicitud INT
as
BEGIN
	SELECT nombre_funcionario,numero_identificacion,fecha_ingreso,id_sucursal,id_area, fecha_nacimiento
	FROM tbSeguimiento_RelDatosBasicos_Solicitud
	WHERE id_solicitud = @id_solicitud
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_consultarDescripcionRepetidaAdjunto]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:                           <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[paSeguimiento_consultarDescripcionRepetidaAdjunto] 
@descripcion varchar(max),
@idSol int
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;
    IF EXISTS (select 'true' as valor from TBSEGUIMIENTO_RELARCH_SOLICITUD where descripcion_arch = @descripcion and id_sol = @idSol)
                               select 'true' as valor from TBSEGUIMIENTO_RELARCH_SOLICITUD where descripcion_arch = @descripcion and id_sol = @idSol
                               
                ELSE
                               select 'false' as valor
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarDescripcionTsol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 Nombre: paSeguimiento_ConsultarDescripcionTsol  
 Fecha: 27 de Septiembre de 2011
 Autor: Wilmar Perdomo  
  
 Descripcion: Permite consultar la descripción de un tipo de solicitud, con el fin que el sistema adicione la descripción
 definida por defecto para el tipo de solicitud.
*/  
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarDescripcionTsol] 
@IdTSol int
AS
BEGIN
	SELECT descripcion_tsol as descripcion
	FROM tbSeguimiento_tiposolicitud
	WHERE idTipoSolicitud = @IdTSol and descripcion_tsol IS NOT NULL	
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarDescrSolOrig]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*  
 Nombre: paSeguimiento_ConsultarDescrSolOrig  
 Fecha: 27 de Septiembre de 2011
 Autor: Wilmar Perdomo  
  
 Descripcion: Permite consultar la descripción de la solicitud original.
 
 
  Modificado: Casa De Bolsa - Isabel Nagles
  Fecha: 25 de Septiembre de 2013
  Descripcion: Reemplazo '-' al incio del consecutivo.


*/  
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarDescrSolOrig] 
@strNumeroSolOrg varchar(30)
AS
BEGIN

SELECT @STRNUMEROSOLORG = CASE WHEN LEFT(LTRIM(RTRIM(@STRNUMEROSOLORG)),1) = '-' THEN SUBSTRING(LTRIM(RTRIM(@STRNUMEROSOLORG)), 2, LEN(@STRNUMEROSOLORG)) ELSE @STRNUMEROSOLORG END

	SELECT descripcion as descripcion,creador
	FROM dbo.tbSeguimiento_Solicitud
	WHERE numero_solicitud = @strNumeroSolOrg
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarDetalleSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarDetalleSeguimiento]
@idSeguimiento int
AS

SET NOCOUNT ON
select idSeguimiento,descripcion,fechaInicio,fachaFinal,fk_Solicitud
idSolicitud,estado,Usuario,fechaSeguimiento,valor_campos_dinamicos
from  [tbSeguimiento_Seguimiento] 
WHERE idSeguimiento=@idSeguimiento

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEmpresaByIdTipoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarEmpresaSol
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	05 de Julio de 2012

	Descripcion : Trea el nombre de la empresa que solicita un caso
	execute paSeguimiento_ConsultarEmpresaSol inagles
*/

create PROCEDURE [dbo].[paSeguimiento_ConsultarEmpresaByIdTipoSol]
@idTipoSol VARCHAR(1000)
AS
BEGIN
		select emp.nombre 
        from dbo.tbSeguimiento_Empresa emp, dbo.tbSeguimiento_relTipoSol_Empresa tipoSol
        where emp.id_Empresa = tipoSol.idEmpresa and  tipoSol.idTipoSol = @idTipoSol

END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEmpresaByUser]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarEmpresaByUser
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	29 de Mayo de 2012

	Descripcion : Permite la consulta del Directorio Activo por Usuario
				  obteniendo la compañia
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEmpresaByUser]
@samAccount VARCHAR(1000)
AS
BEGIN
if exists(select nombre from tbSeguimiento_Empresa
            where id_Empresa =(select idcompany from tbActive_Directory
            where sAMAccountName=@samAccount))
                select nombre from tbSeguimiento_Empresa
                where id_Empresa =(select idcompany from tbActive_Directory
                where sAMAccountName=@samAccount)
else 
    select 'false' as nombre

END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEmpresas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarEmpresas
	Autor:	Fredy H. Diaz E.
	Fecha:	14 de Febrero de 2013

	Descripcion : Permite la consulta de las empresas
    
    Modificaciones:
	1 Autor:	
	  Fecha:	
	  Descripcion:	
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEmpresas]
    @EstadoEmpresa BIT
AS
BEGIN
    DECLARE @NSql NVARCHAR(1000)
    
    SET @NSql = '
        SELECT
            Id_Empresa AS Id,
            Nombre AS Nombre,
            Activo AS Activa
        FROM DBO.TBSEGUIMIENTO_EMPRESA AS EMP'
    
    IF @EstadoEmpresa IS NOT NULL
        SET @NSql = @NSql + ' WHERE EMP.Activo = ' + CAST(@EstadoEmpresa AS VARCHAR(2))
    
    EXECUTE  Sp_ExecuteSql @NSql
    
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEmpresasByUser]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarEmpresas
	Autor:	Fredy H. Diaz E.
	Fecha:	14 de Febrero de 2013

	Descripcion : Permite la consulta de las empresas
    
    Modificaciones:
	1 Autor:	
	  Fecha:	
	  Descripcion:	
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEmpresasByUser]
    @usuario VARCHAR(1000)
AS
BEGIN
   
        SELECT
            EMP.Id_Empresa AS Id,
            EMP.Nombre AS Nombre,
            EMP.Activo AS Activa
        FROM DBO.TBSEGUIMIENTO_EMPRESA AS EMP , DBO.tbSeguimiento_UsuarioEmpresa UEM
        WHERE UEM.id_empresa = EMP.Id_Empresa and UEM.sAMAccountName = @usuario --'INagles'
        and EMP.Activo = 1
    
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEmpresaSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarEmpresaSol
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	05 de Julio de 2012

	Descripcion : Trea el nombre de la empresa que solicita un caso
	execute paSeguimiento_ConsultarEmpresaSol inagles
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEmpresaSol]
@CreadorSol VARCHAR(1000)
AS
BEGIN

	IF EXISTS (select (nombre)as Empresa from dbo.tbSeguimiento_Empresa where id_Empresa = ( select idcompany from tbActive_Directory where sAMAccountName=@CreadorSol))
		select (nombre)as Empresa from dbo.tbSeguimiento_Empresa
            where id_Empresa = ( select idcompany from tbActive_Directory
            where sAMAccountName=@CreadorSol)
	ELSE
		SELECT 'No Disponible' as Empresa

END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadoByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarEstadoByID
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los estados de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE procedure [dbo].[paSeguimiento_ConsultarEstadoByID]
@IdEstado int
AS
begin
	SELECT Nombre,Estado,cierra_solicitud,notifica,orden_prioridad
	FROM tbSeguimiento_EstadoSolicitud WITH(NOLOCK)
	WHERE IdSol = @IdEstado
end





GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadoByIdSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paSeguimiento_ConsultarEstadoByIdSeguimiento
	Fecha:	05 de Abril de 2013
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los estados del seguimiento de una solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
create procedure [dbo].[paSeguimiento_ConsultarEstadoByIdSeguimiento]
@IdEstado int
AS
begin
	SELECT Nombre,Estado,cierra_solicitud,notifica,orden_prioridad
	FROM tbSeguimiento_EstadoSolicitud WITH(NOLOCK)
	WHERE IdSol in (select estado from dbo.tbSeguimiento_Seguimiento where idSeguimiento = @IdEstado )
end






GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadoByNombre]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarEstadoByNombre
	Fecha:	30 de Septiembre 2012
	Autor:	Andres Vargas Clavijo

	Descripcion: Consulta los estados de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE procedure [dbo].[paSeguimiento_ConsultarEstadoByNombre]
@Estado varchar(500)
AS
begin
	SELECT idsol as ID,Nombre,Estado,cierra_solicitud,notifica,orden_prioridad
	FROM tbSeguimiento_EstadoSolicitud WITH(NOLOCK)
	WHERE Nombre = @Estado
end
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadoByTSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: exec paSeguimiento_ConsultarEstadoByTSol @idtsol=349
	Fecha:	21 de Octubre 2011
	Autor:	Wilmar Perdomo

	Descripcion: Consulta los estados de los tipos de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEstadoByTSol]
@idtsol INT
AS
BEGIN
	
	IF EXISTS(SELECT 1 FROM tbSeguimiento_EstadoByTsol WHERE IdTipoSolicitud = @idtsol)
	BEGIN
		SELECT IdSol as ID ,Nombre,Estado, cierra_solicitud,notifica,ISNULL(Multiples_asignados,0)
		FROM tbSeguimiento_EstadoSolicitud e WITH(NOLOCK)
		INNER JOIN tbSeguimiento_EstadoByTsol  es WITH(NOLOCK) ON  e.IdSol = es.IdEstado
		WHERE es.IdTipoSolicitud = @idtsol
		UNION
		SELECT IdSol as ID ,Nombre,Estado, cierra_solicitud,notifica,ISNULL(Multiples_asignados,0)
		FROM tbSeguimiento_EstadoSolicitud WITH(NOLOCK)
		WHERE IdSol NOT IN (SELECT idestado FROM tbSeguimiento_EstadoByTsol)
	END 	
	ELSE	
	BEGIN	
		SELECT IdSol as ID ,Nombre,Estado, cierra_solicitud,notifica,ISNULL(Multiples_asignados,0)
		FROM tbSeguimiento_EstadoSolicitud WITH(NOLOCK)
		WHERE IdSol NOT IN (SELECT distinct idestado FROM tbSeguimiento_EstadoByTsol)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadosCierre]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        SQDMCEB
-- Create date: 10/12/2013
-- Description:   procedimiento para traer todos los estados que cierran una solicitud
-- =============================================
create PROCEDURE [dbo].[paSeguimiento_ConsultarEstadosCierre]
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      select nombre from tbSeguimiento_EstadoSolicitud where cierra_solicitud = 1
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarEstadoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarEstadoSol
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los estados de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarEstadoSol]
AS
BEGIN
	SELECT IdSol as ID ,Nombre,Estado, cierra_solicitud,notifica,ISNULL(Multiples_asignados,0)
	FROM tbSeguimiento_EstadoSolicitud e WITH(NOLOCK)
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarFechaFinalizacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarFechaFinalizacion]
@IDSOLI INT
AS
BEGIN
	DECLARE @prioridad as NVARCHAR(80)
	DECLARE @SQLAUX VARCHAR(400)
	SET @SQLAUX = ' select @prioridad = ''Prioridad_''+valor_campos_dinamicos.value(''(/cdb/CamposDinamicos/Criticidad)[1]'',''VARCHAR(20)'') from tbSeguimiento_Solicitud WHERE  idsolicitud = 138' --+
	--CAST(@IDSOLI AS NVARCHAR)
	print @SQLAUX
	PRINT @PRIORIDAD
	
	--DECLARE FECHAFINALIZACION DATETIME
	--SET FECHAFINALIZACION = 
	
	SELECT ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,@prioridad,T.unidaddeMedida)) AS FECHAFINALIZACION
	FROM TBSEGUIMIENTO_SOLICITUD S INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
	WHERE idsolicitud=@IDSOLI
	
END

EXECUTE paSeguimiento_ConsultarFechaFinalizacion 138

SELECT * FROM tbSeguimiento_Solicitud

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarFiltrosCamposDinamicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 22-08-2011
-- Description:	Obtener los campos para el filtro de los campos dinamicos
-- =============================================
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarFiltrosCamposDinamicos]
AS
BEGIN
	SET NOCOUNT ON;
select distinct nombre_campo, tipo_campo,lista_items,ORDEN from dbo.tbSeguimiento_CampoDinamico
where tipo_campo<>7 and filtro=1 order by ORDEN 
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarFkTipoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarFkTipoSol
	Fecha:	08 de Junio 2012
	Autor:	Andres Vargas Clavijo

	Descripcion: Consulta el tipo de solicitud de la solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarFkTipoSol]
@idsol int
AS
BEGIN
	select fk_tipoSolicitud from tbSeguimiento_Solicitud
	where idsolicitud=@idsol
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarGrupoByTipoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarGrupoByTipoSol
	Fecha:	29 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata		
	
	Descripcion: Permite listar los usuarios pertenecientes a un grupo
	
	Modificaciones:	
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarGrupoByTipoSol]
@idTipoSol INT
AS
BEGIN
	SELECT idGrupoSol 
	FROM tbSeguimiento_relTipoSol_Grupo WITH(NOLOCK)
	WHERE idTipoSol = @idTipoSol
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarHojasProceso]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarHojasProceso
	Fecha: 19 de Noviembre de 2010
	Autor: Yoany Gomez Zapata
	
	Descripcion : Permite la consulta de hojas  de proceso por solicitud

	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	
	
	EXEC paSeguimiento_ConsultarHojasProceso @num_proceso='CDB-DES-138'
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarHojasProceso]
@NUM_PROCESO VARCHAR(100)
AS
BEGIN
	DECLARE @TEMPTABLE TABLE 
	( 
		NombreNodo VARCHAR(100), 
		IdentificadorNodo VARCHAR(100), 
		IdentificadorPadre VARCHAR(100) , 
		FechaFinalizacion datetime, 
		Estado int
	)
	
	--set @NUM_PROCESO='CDB-DES-138'
	DECLARE @prioridad as NVARCHAR(80)
	DECLARE @SQLAUX NVARCHAR(2000)
	SET @SQLAUX = ' select @prioridad = ''Prioridad_''+valor_campos_dinamicos.value(''(/cdb/CamposDinamicos/Criticidad)[1]'',''VARCHAR(20)'') from tbSeguimiento_Solicitud WHERE numero_solicitud = ' + CHAR(39) +@NUM_PROCESO +CHAR(39)
	--print @SQLAUX
	
	Exec sp_executesql @SQLAUX,N'@prioridad NVARCHAR(50) OUTPUT',@prioridad OUTPUT
	--print @prioridad

	-- INSERTANDO EL PADRE

SELECT @SQLAUX = '	
	SELECT T.NOMBRETIPOSOLICITUD + '' - ('' + NUMERO_SOLICITUD + '')'',  NUMERO_SOLICITUD, 
	CASE NUMERO_SOLICITUD_ORIGEN WHEN '''' THEN ''0'' ELSE ISNULL(NUMERO_SOLICITUD_ORIGEN,''0'') END, 
	ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,' + @prioridad + ',T.unidaddeMedida)) AS FECHAFINALIZACION,
	s.ESTADO
	FROM TBSEGUIMIENTO_SOLICITUD S 
	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
	WHERE NUMERO_SOLICITUD = '+ CHAR(39) +@NUM_PROCESO +CHAR(39) 

	INSERT INTO @TEMPTABLE 
EXECUTE  sp_executesql @SQLAUX



SELECT @SQLAUX =	'
	SELECT T.NOMBRETIPOSOLICITUD + '' - (''+ NUMERO_SOLICITUD + '')'',  NUMERO_SOLICITUD, 
	CASE NUMERO_SOLICITUD_ORIGEN WHEN '''' THEN ''0'' ELSE ISNULL(NUMERO_SOLICITUD_ORIGEN,''0'') END,  
	ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,' + @prioridad + ',T.unidaddeMedida)) AS FECHAFINALIZACION,
	s.ESTADO
	FROM TBSEGUIMIENTO_SOLICITUD S INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T
	ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
	WHERE NUMERO_SOLICITUD_ORIGEN = ' + CHAR(39) +@NUM_PROCESO +CHAR(39)
	
	INSERT INTO @TEMPTABLE 
EXECUTE  sp_executesql @SQLAUX
	--

	DECLARE @SQL VARCHAR(6000)
	SET @SQL = ''
	SET @SQL = @SQL + 'DECLARE @AUX VARCHAR(100)'
	-- PROCESANDO LOS HIJOS
	SET @SQL = @SQL + 'DECLARE CUR_1' + REPLACE(@NUM_PROCESO,'-','') + ' CURSOR FOR '
		
	SET @SQL = @SQL + 'SELECT NUMERO_SOLICITUD '
	SET @SQL = @SQL + 'FROM TBSEGUIMIENTO_SOLICITUD '
	SET @SQL = @SQL + 'WHERE NUMERO_SOLICITUD_ORIGEN =''' + @NUM_PROCESO +''''

	SET @SQL = @SQL + ' OPEN CUR_1' + REPLACE(@NUM_PROCESO,'-','') 

	SET @SQL = @SQL + ' FETCH NEXT FROM CUR_1' + REPLACE(@NUM_PROCESO,'-','') + ' INTO @AUX '
		SET @SQL = @SQL + ' WHILE @@FETCH_STATUS = 0 '
		SET @SQL = @SQL + ' BEGIN '
			SET @SQL = @SQL + ' EXEC paSeguimiento_ConsultarHojasProceso @AUX '
			SET @SQL = @SQL + ' FETCH NEXT FROM CUR_1' + REPLACE(@NUM_PROCESO,'-','') + ' INTO @AUX '
		SET @SQL = @SQL + ' END '
	SET @SQL = @SQL + ' CLOSE CUR_1' + REPLACE(@NUM_PROCESO,'-','') 
	SET @SQL = @SQL + ' DEALLOCATE CUR_1' + REPLACE(@NUM_PROCESO,'-','') 

	--PRINT @SQL
	EXEC(@SQL)
	--SELECT * FROM @TEMPTABLE
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarIdCriticidad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarIdCriticidad]
@descripcion varchar(500)
as
Select idCritidad from dbo.tbSeguimiento_Criticidad
where Descripcion=@descripcion
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarInfoReporte]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarSolResponsable
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los reportes para cada instancia de seguimiento

*/
CREATE procedure [dbo].[paSeguimiento_ConsultarInfoReporte]
@idreporte int
as
BEGIN
	select * from dbo.tbSeguimiento_Reporte where idreporte=@idreporte

END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarJefeResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarJefeResponsable
	Autor:	Ronald R. Gonzalez E.
	Fecha:  4 de Marzo 2013

	Descripcion:

	Modificaciones:
	
	No. 1
	Autor: Wilmar Perdomo					Fecha:15/04/2013
	Descripción: Si no tiene jefe en la tabla de responsables, retorna el mismo usuario.
	
	No. 2
	Autor: Camilo Buitrago					Fecha:15/04/2013
	Descripción: se corrige el retorno de la informacion del jefe
*/
--exec paSeguimiento_ConsultarJefeResponsable 'CB0130ESC'
CREATE  procedure [dbo].[paSeguimiento_ConsultarJefeResponsable]
@responsable varchar(max)
as
BEGIN
	declare @jefe varchar(30)
	IF EXISTS (select usuariont_superior from dbo.tbSeguimiento_Responsable WITH(NOLOCK) where usuariont = @responsable)
		SELECT usuariont_superior from dbo.tbSeguimiento_Responsable WITH(NOLOCK) where usuariont = @responsable
	ELSE
		SELECT @responsable as usuariont_superior
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarListaEmpresas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarListaEmpresas
	Fecha:	26 de Junio 2012
	Autor:	Andres Vargas Clavijo SQDM

	Descripcion: Consulta los tipos de empresa de seguimiento

*/

CREATE procedure [dbo].[paSeguimiento_ConsultarListaEmpresas]
as
BEGIN
	select id_Empresa, nombre from  dbo.tbSeguimiento_Empresa
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarListaReportesByInstancia]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarListaReportesByInstancia
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los tipos de reporte para cada instancia de seguimiento

*/

CREATE procedure [dbo].[paSeguimiento_ConsultarListaReportesByInstancia]
@instancia varchar(10)
as
BEGIN
	select idReporte, nombreReporte from dbo.tbSeguimiento_Reporte where instancia=@instancia and visible=1

END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarNivelesServicio]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 28/04/2011
-- Description:	Obtiene niveles de servicio
-- =============================================
create PROCEDURE [dbo].[paSeguimiento_ConsultarNivelesServicio]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT IDNIVEL,NOMBRENIVEL FROM DBO.TBSEGUIMIENTO_NIVELSERVICIO
	WHERE VISIBLE=1
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarNombreByUser]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarNombreByUser
	Autor:	Andres Vargas Clavijo (SQDMAFV)
	Fecha:	29 de Mayo de 2012

	Descripcion : Permite la consulta del Directorio Activo por Usuario
				  obteniendo el nombre del usuario
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarNombreByUser]
@samAccount VARCHAR(1000)
AS
BEGIN
if exists (select displayName from tbActive_Directory where sAMAccountName=@samAccount)
    select displayName from tbActive_Directory
    where sAMAccountName=@samAccount
else select @samAccount as displayName
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarParametros]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarParametros
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Septiembre 2010

	Descripcion: Permite la consulta de los parametros de seguimiento de solicitudes

	Modificaciones:
	Autor:					Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarParametros]
AS
	SELECT ruta_arch_solicitud,ruta_arch_seguimiento,sigla_sol,color_exedido,idtiposol_form_software 
	FROM dbo.tbSeguimiento_Parametros WITH(NOLOCK)


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarPrioiridad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarPrioiridad
	Fecha:	08 Septiembre 2010
	Autor:	Yoany Gomez Zapata
	
	Descripcion: Consultar Prioirdades

	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
create PROCEDURE [dbo].[paSeguimiento_ConsultarPrioiridad]
AS
BEGIN
	SELECT idPrioridad,nombre,estado 
	FROM tbSeguimiento_PrioridadSolicitud WITH(NOLOCK)
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarPrioiridadById]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre: paSeguimiento_ConsultarPrioiridad
	Fecha:	08 Septiembre 2010
	Autor:	Yoany Gomez Zapata
	
	Descripcion: Consultar Prioirdades

	Modificaciones:
	Autor:						Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarPrioiridadById]
@prioridad as varchar(5)
AS
BEGIN
	SELECT nombre
	FROM tbSeguimiento_PrioridadSolicitud 
	where idPrioridad = @prioridad
END




GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarPrioridad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarPrioridad
	Autor:	Yoany Gomez Zapata
	Fecha:	28 de Septiembre 2010

	Descripcion: Permite la consulta de la prioirdad e un tipo de solicitud 

	Modificaciones:
	Autor:					Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarPrioridad]
@idtiposol int
AS
BEGIN
	SELECT IDPRIORIDAD FROM dbo.tbSeguimiento_tiposolicitud with(nolock)
	where idTipoSolicitud = @idtiposol
END




GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarRelAplicacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paSeguimiento_ConsultarRelAplicacion]
@id_solicitud int
as
BEGIN
	SELECT * FROM tbSeguimiento_RelAplicaciones_Solicitud WITH(NOLOCK)
	WHERE id_solicitud = @id_solicitud  
END 


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarRelDatosSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[paSeguimiento_ConsultarRelDatosSolicitud]
@id_solicitud int
as
BEGIN
	select * from tbSeguimiento_RelDatos_Solicitud WITH(NOLOCK)
	where id_solicitud = @id_solicitud 
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarResponsableArea]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarResponsableArea
	Autor:	Yoany Gomez Zapata
	Fecha:  24 de Septiembre 2010

	Descripcion:

	Modificaciones:
	Autor:					Fecha:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarResponsableArea]
@area varchar(100)
AS
SELECT responsable
FROM dbo.relTipoSol_ResponsableArea WITH(NOLOCK)
WHERE Area = @area



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarSiglaTipoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarSiglaTipoSol
	Autor:	Yoany Gomez Zapata
	Fecha:	28 de Septiembre 2010

	Descripcion: Permite la consulta de la sigle de un tipo de solicitud 

	Modificaciones:
	Autor:					Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarSiglaTipoSol]
@idtiposol int
AS
BEGIN
	SELECT SIGLA_TIPO_SOL FROM dbo.tbSeguimiento_tiposolicitud with(nolock)
	where idTipoSolicitud = @idtiposol
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarSolCreador]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarSolResponsable
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta las solicitudes por responsable

	Modificaciones:
	Autor:	ISABEL ANDREA NAGLES - CASA DE BOLSA		
	Fecha: 2012-07-30
	Descripcion: MODIFICACION PARA FECHA DE FINALIZACION, NOMBRE TIPOLOGIA Y PRIORIDAD
	exec paSeguimiento_ConsultarSolCreador 'inagles'
*/
CREATE procedure [dbo].[paSeguimiento_ConsultarSolCreador]
@creador varchar(50)
as
BEGIN
	--SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,
	--FECHAASIGNACION AS FECHAASIGNACION,
	--FECHACREACION AS FECHACREACION,
	--ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA)) AS FECHAFINALIZACION,
	--PRIORIDAD,RESPONSABLE,FK_TIPOSOLICITUD,CREADOR,TBSEGUIMIENTO_SOLICITUD.ESTADO AS ESTADO, 
	--TBSEGUIMIENTO_PRIORIDADSOLICITUD.NOMBRE AS [N PRIORIDAD], TBSEGUIMIENTO_TIPOSOLICITUD.NOMBRETIPOSOLICITUD AS [N TIPOSOLICITUD], TBSEGUIMIENTO_ESTADOSOLICITUD.NOMBRE AS [N ESTADO] , NUMERO_SOLICITUD AS NUMSOL 
	--FROM TBSEGUIMIENTO_SOLICITUD WITH(NOLOCK) 
	--INNER JOIN 	TBSEGUIMIENTO_ESTADOSOLICITUD ON TBSEGUIMIENTO_ESTADOSOLICITUD.IDSOL = TBSEGUIMIENTO_SOLICITUD.ESTADO  
	--INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
	--INNER JOIN DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.PRIORIDAD = DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD.IDPRIORIDAD
	--WHERE /*CREADOR = @CREADOR OR */SOLICITANTE = @CREADOR AND TBSEGUIMIENTO_ESTADOSOLICITUD.CIERRA_SOLICITUD = 0
	--ORDER BY IDSOLICITUD DESC
	
	
DECLARE @priority AS NVARCHAR(80)
DECLARE @SQLAUX AS NVARCHAR(4000)

DECLARE @ans int
--DECLARE @prioridad varchar(50)
DECLARE @nsql nvarchar(2000)

-- Creando la tabla tempiral para almacenar acuerdos de servicio
create table #TMPANSSEGUIMIENTO 
( 	[idsolicitud] [int]  NOT NULL PRIMARY KEY,
	[asunto] [varchar](250) NULL,
	[descripcion] [varchar](500) NULL,
	[fechaAsignacion] [datetime] NULL,
	[fechaCreacion] [datetime] NULL,
	[Fechafinalizacion] [datetime] NULL,
	[prioridad] [int] NULL,
	[responsable] [varchar](50) NULL,
	[fk_tipoSolicitud] [int] NULL,
	[creador] [varchar](250) NULL,
	[estado] [int] NULL,
	[numero_solicitud] [varchar](100) NULL,
	[valor_campos_dinamicos] [xml] NULL,
	[Solicitante] [varchar](50) NULL,
	[fechaCierre] [datetime] NULL,
	[ans] [int] NULL,
	[CMP_PRIORIDAD] [varchar](50) NULL
) 


SET @nsql = 'SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,FECHAASIGNACION ,FECHACREACION ,FECHAFINALIZACION ,PRIORIDAD, RESPONSABLE, FK_TIPOSOLICITUD,CREADOR,TBSeguimiento_SOLICITUD.ESTADO, numero_solicitud , [VALOR_CAMPOS_DINAMICOS],Solicitante , fechaCierre 
, 0 ans, CASE WHEN convert(varchar(max),[valor_campos_dinamicos]) <> '''' THEN ''PRIORIDAD_''+  SUBSTRING(CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]),CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5) +12,
 CHARINDEX(''</CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5)-( CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5) +12))  ELSE ''TIEMPOTAREA'' END CMP_PRIORIDAD
  FROM TBSeguimiento_SOLICITUD 	INNER JOIN 	TBSEGUIMIENTO_ESTADOSOLICITUD ON TBSEGUIMIENTO_ESTADOSOLICITUD.IDSOL = TBSEGUIMIENTO_SOLICITUD.ESTADO  
	INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
	INNER JOIN DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.PRIORIDAD = DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD.IDPRIORIDAD
    where SOLICITANTE =  ' +CHAR(39) + @CREADOR +CHAR(39)+ ' AND TBSEGUIMIENTO_ESTADOSOLICITUD.CIERRA_SOLICITUD = 0	ORDER BY IDSOLICITUD DESC'
	



INSERT INTO #TMPANSSEGUIMIENTO 
EXECUTE  sp_executesql @nsql
  

-- Actualizacion acuerdos de servicio


DECLARE curPrioridad CURSOR FOR 

  SELECT distinct CMP_PRIORIDAD FROM #TMPANSSEGUIMIENTO
  

OPEN curPrioridad

FETCH NEXT FROM curPrioridad 
INTO @priority


WHILE @@FETCH_STATUS = 0
BEGIN


SELECT @nsql = ' update #TMPANSSEGUIMIENTO set ans = ' + @priority + 
' from #TMPANSSEGUIMIENTO join tbSeguimiento_tiposolicitud on fk_tiposolicitud = tbSeguimiento_tiposolicitud.idTipoSolicitud where CMP_PRIORIDAD = '  + char(39) + @priority  + char(39) 


EXECUTE  sp_executesql @nsql


	FETCH NEXT FROM curPrioridad 
    INTO @priority
END

CLOSE curPrioridad
DEALLOCATE curPrioridad

SET NOCOUNT OFF



SELECT ABUELO.IDTIPOSOLICITUD ABUELO_ID, PADRE_ID,   HIJO_ID,isnull(ABUELO.NOMBRETIPOSOLICITUD, '') + ' - ' + isnull(PADRE_NOMBRE,'')+ ' -'+isnull(HIJO_NOMBRE,'') NOMTIPOLOGIA
INTO #TMPNOMTIPOLOGIA
FROM 
(SELECT PADRE.IDTIPOSOLICITUD PADRE_ID, PADRE.NOMBRETIPOSOLICITUD PADRE_NOMBRE, PADRE.IDTIPOSOL_PADRE PADRE_IDTIPOSOL_PADRE,
HIJO.IDTIPOSOLICITUD HIJO_ID, HIJO.NOMBRETIPOSOLICITUD HIJO_NOMBRE, HIJO.IDTIPOSOLICITUD, HIJO.MAIL_NOTIFICA NOTIFICA_A, HIJO.SIGLA_TIPO_SOL SIGLA, 
HIJO.UNIDADDEMEDIDA UNIDADMEDIDATIEMPO,
ISNULL(HIJO.PRIORIDAD_URGENTE,0) TIEMPO_URGENTE , ISNULL(HIJO.PRIORIDAD_ALTA,0) TIEMPO_ALTA, ISNULL(HIJO.PRIORIDAD_MEDIA ,0) TIEMPO_MEDIA,ISNULL( HIJO.PRIORIDAD_BAJA,0)  TIEMPO_BAJA FROM 
DBO.TBSEGUIMIENTO_TIPOSOLICITUD HIJO LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD PADRE ON HIJO.IDTIPOSOL_PADRE = PADRE.IDTIPOSOLICITUD 
 ) PADRE_HIJO 
 LEFT JOIN
 DBO.TBSEGUIMIENTO_TIPOSOLICITUD ABUELO 
ON PADRE_HIJO.PADRE_IDTIPOSOL_PADRE = ABUELO.IDTIPOSOLICITUD 
WHERE HIJO_ID NOT IN (SELECT IDTIPOSOL_PADRE FROM TBSEGUIMIENTO_TIPOSOLICITUD)



	--SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,
	--FECHAASIGNACION AS FECHAASIGNACION,
	--FECHACREACION AS FECHACREACION,
	--ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA)) AS FECHAFINALIZACION,
	--PRIORIDAD,RESPONSABLE,FK_TIPOSOLICITUD,CREADOR,TBSEGUIMIENTO_SOLICITUD.ESTADO AS ESTADO, 
	--TBSEGUIMIENTO_PRIORIDADSOLICITUD.NOMBRE AS [N PRIORIDAD], TBSEGUIMIENTO_TIPOSOLICITUD.NOMBRETIPOSOLICITUD AS [N TIPOSOLICITUD], TBSEGUIMIENTO_ESTADOSOLICITUD.NOMBRE AS [N ESTADO] , NUMERO_SOLICITUD AS NUMSOL 




SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,CONVERT(VARCHAR(50),FECHAASIGNACION, 121) AS FECHAASIGNACION ,CONVERT(VARCHAR(50),FECHACREACION,121) AS FECHACREACION ,
case when fechacierre is null then CONVERT(VARCHAR(50),ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,ans,TBSEGUIMIENTO_TIPOSOLICITUD.unidaddeMedida)), 121) else  fechaCierre end AS FECHAFINALIZACION,
PRIORIDAD,ad.displayName as RESPONSABLE,ad1.displayName as SOLICITANTE,FK_TIPOSOLICITUD,CREADOR,#TMPANSSEGUIMIENTO.ESTADO,
substring(CMP_PRIORIDAD,11,30) + ' ( ' + cast(tbSeguimiento_PrioridadSolicitud.Nombre as varchar(2)) + ' ) '  as [N Prioridad],
 --TBSEGUIMIENTO_TIPOSOLICITUD.NombreTipoSolicitud as [N TipoSolicitud],
 NOMTIPOLOGIA as [N TipoSolicitud], tbSeguimiento_EstadoSolicitud.Nombre as [N Estado] , numero_solicitud as NumSol FROM #TMPANSSEGUIMIENTO WITH(NOLOCK)  
 INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON #TMPANSSEGUIMIENTO.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD 
 inner join dbo.tbSeguimiento_PrioridadSolicitud on #TMPANSSEGUIMIENTO.PRIORIDAD = dbo.tbSeguimiento_PrioridadSolicitud.idPrioridad 
 inner join dbo.tbSeguimiento_EstadoSolicitud  on #TMPANSSEGUIMIENTO.ESTADO = tbSeguimiento_EstadoSolicitud.IdSol  
 inner join dbo.tbActive_Directory ad on #TMPANSSEGUIMIENTO.RESPONSABLE = ad.sAMAccountName  
 inner join dbo.tbActive_Directory ad1 on #TMPANSSEGUIMIENTO.SOLICITANTE = ad1.sAMAccountName  
left join #TMPNOMTIPOLOGIA on FK_TIPOSOLICITUD = HIJO_ID
order by idsolicitud desc





END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarSolicitudProblema]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SQDMCEB
-- Create date: 01/04/2013
-- Description:	se crea para queen la ventana inicial traiga toodas las tipologias de tipo problema
-- =============================================
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarSolicitudProblema] 
@responsable varchar(50)
AS
BEGIN


select numero_solicitud,descripcion from 
TBSeguimiento_SOLICITUD sol1, 
DBO.TBSEGUIMIENTO_TIPOSOLICITUD tsol,
tbSeguimiento_relTipoSol_Empresa te
where NombreTipoSolicitud like  '%PROBLEMA%' 
and tsol.idTipoSolicitud = sol1.fk_tipoSolicitud
and te.idTipoSol = sol1.fk_tipoSolicitud 
and te.idTipoSol = tsol.idTipoSolicitud
 and te.idEmpresa in (select idCompany from dbo.tbActive_Directory where sAMAccountName = @responsable)
 and sol1.estado not in (select idsol from tbSeguimiento_EstadoSolicitud where cierra_solicitud = 1 ) 


--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	--SET NOCOUNT ON;

END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarSolResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarSolResponsable
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta las solicitudes por responsable

	Modificaciones:
	Autor:	ISABEL ANDREA NAGLES - CASA DE BOLSA		
	Fecha: 2012-07-30
	Descripcion: MODIFICACION PARA FECHA DE FINALIZACION, NOMBRE TIPOLOGIA Y PRIORIDAD
	
	Modificaciones:
	Autor:	SQDMCEB	
	Fecha: 2014-02-26
	Descripcion: SE agregan valdiaciones pa que traiga casos con solicitantes que no estan en tb_ActiveDirectory
	exec paSeguimiento_ConsultarSolResponsable 'inagles'
*/
CREATE procedure [dbo].[paSeguimiento_ConsultarSolResponsable]
@responsable varchar(50)
as
BEGIN
	--SELECT IDSOLICITUD,ASUNTO,TBSeguimiento_SOLICITUD.DESCRIPCION,
	--CONVERT(VARCHAR(50),FECHAASIGNACION,121) AS FECHAASIGNACION,
	--CONVERT(VARCHAR(50),FECHACREACION, 121) AS FECHACREACION,
	--CONVERT(VARCHAR(50),ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA)),121) AS FECHAFINALIZACION,
	--PRIORIDAD,ad.displayName as RESPONSABLE,FK_TIPOSOLICITUD,CREADOR,ad1.displayName as SOLICITANTE,TBSeguimiento_SOLICITUD.ESTADO AS ESTADO, 
	--tbSeguimiento_PrioridadSolicitud.Nombre as [N Prioridad], TBSEGUIMIENTO_TIPOSOLICITUD.NombreTipoSolicitud as [N TipoSolicitud], tbSeguimiento_EstadoSolicitud.Nombre as [N Estado] , numero_solicitud as NumSol 
	--FROM TBSeguimiento_SOLICITUD WITH(NOLOCK) 
	--inner join 	tbSeguimiento_EstadoSolicitud on tbSeguimiento_EstadoSolicitud.idsol = TBSeguimiento_SOLICITUD.estado  
	--INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
	--inner join dbo.tbSeguimiento_PrioridadSolicitud on TBSeguimiento_SOLICITUD.PRIORIDAD = dbo.tbSeguimiento_PrioridadSolicitud.idPrioridad
	--inner join dbo.tbActive_Directory ad on TBSeguimiento_SOLICITUD.RESPONSABLE = ad.sAMAccountName 
 --   inner join dbo.tbActive_Directory ad1 on TBSeguimiento_SOLICITUD.SOLICITANTE = ad1.sAMAccountName
	--WHERE responsable = @responsable  and tbSeguimiento_EstadoSolicitud.cierra_solicitud = 0
	--ORDER BY IDSOLICITUD DESC
	
	
		
	
DECLARE @priority AS NVARCHAR(80)
DECLARE @SQLAUX AS NVARCHAR(4000)

DECLARE @ans int
--DECLARE @prioridad varchar(50)
DECLARE @nsql nvarchar(2000)

-- Creando la tabla tempiral para almacenar acuerdos de servicio
create table #TMPANSSEGUIMIENTO 
( 	[idsolicitud] [int]  NOT NULL PRIMARY KEY,
	[asunto] [varchar](250) NULL,
	[descripcion] [varchar](500) NULL,
	[fechaAsignacion] [datetime] NULL,
	[fechaCreacion] [datetime] NULL,
	[Fechafinalizacion] [datetime] NULL,
	[prioridad] [int] NULL,
	[responsable] [varchar](50) NULL,
	[fk_tipoSolicitud] [int] NULL,
	[creador] [varchar](250) NULL,
	[estado] [int] NULL,
	[numero_solicitud] [varchar](100) NULL,
	[valor_campos_dinamicos] [xml] NULL,
	[Solicitante] [varchar](50) NULL,
	[fechaCierre] [datetime] NULL,
	[ans] [int] NULL,
	[CMP_PRIORIDAD] [varchar](50) NULL
) 


SET @nsql = 'SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,FECHAASIGNACION ,FECHACREACION ,FECHAFINALIZACION ,PRIORIDAD, RESPONSABLE, FK_TIPOSOLICITUD,CREADOR,TBSeguimiento_SOLICITUD.ESTADO, numero_solicitud , [VALOR_CAMPOS_DINAMICOS],Solicitante , fechaCierre 
, 0 ans, CASE WHEN convert(varchar(max),[valor_campos_dinamicos]) <> '''' THEN ''PRIORIDAD_''+  SUBSTRING(CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]),CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5) +12,
 CHARINDEX(''</CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5)-( CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX),[VALOR_CAMPOS_DINAMICOS]), 5) +12))  ELSE ''TIEMPOTAREA'' END CMP_PRIORIDAD
  FROM TBSeguimiento_SOLICITUD 	INNER JOIN 	TBSEGUIMIENTO_ESTADOSOLICITUD ON TBSEGUIMIENTO_ESTADOSOLICITUD.IDSOL = TBSEGUIMIENTO_SOLICITUD.ESTADO  
	INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
	INNER JOIN DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD ON TBSEGUIMIENTO_SOLICITUD.PRIORIDAD = DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD.IDPRIORIDAD
    WHERE RESPONSABLE  =  ' +CHAR(39) + @responsable +CHAR(39)+ ' AND TBSEGUIMIENTO_ESTADOSOLICITUD.CIERRA_SOLICITUD = 0	ORDER BY IDSOLICITUD DESC'
	



INSERT INTO #TMPANSSEGUIMIENTO 
EXECUTE  sp_executesql @nsql
  

-- Actualizacion acuerdos de servicio


DECLARE curPrioridad CURSOR FOR 

  SELECT distinct CMP_PRIORIDAD FROM #TMPANSSEGUIMIENTO
  

OPEN curPrioridad

FETCH NEXT FROM curPrioridad 
INTO @priority


WHILE @@FETCH_STATUS = 0
BEGIN


SELECT @nsql = ' update #TMPANSSEGUIMIENTO set ans = ' + @priority + 
' from #TMPANSSEGUIMIENTO join tbSeguimiento_tiposolicitud on fk_tiposolicitud = tbSeguimiento_tiposolicitud.idTipoSolicitud where CMP_PRIORIDAD = '  + char(39) + @priority  + char(39) 


EXECUTE  sp_executesql @nsql


	FETCH NEXT FROM curPrioridad 
    INTO @priority
END

CLOSE curPrioridad
DEALLOCATE curPrioridad

SET NOCOUNT OFF



SELECT ABUELO.IDTIPOSOLICITUD ABUELO_ID, PADRE_ID,   HIJO_ID,isnull(ABUELO.NOMBRETIPOSOLICITUD, '') + ' - ' + isnull(PADRE_NOMBRE,'')+ ' -'+isnull(HIJO_NOMBRE,'') NOMTIPOLOGIA
INTO #TMPNOMTIPOLOGIA
FROM 
(SELECT PADRE.IDTIPOSOLICITUD PADRE_ID, PADRE.NOMBRETIPOSOLICITUD PADRE_NOMBRE, PADRE.IDTIPOSOL_PADRE PADRE_IDTIPOSOL_PADRE,
HIJO.IDTIPOSOLICITUD HIJO_ID, HIJO.NOMBRETIPOSOLICITUD HIJO_NOMBRE, HIJO.IDTIPOSOLICITUD, HIJO.MAIL_NOTIFICA NOTIFICA_A, HIJO.SIGLA_TIPO_SOL SIGLA, 
HIJO.UNIDADDEMEDIDA UNIDADMEDIDATIEMPO,
ISNULL(HIJO.PRIORIDAD_URGENTE,0) TIEMPO_URGENTE , ISNULL(HIJO.PRIORIDAD_ALTA,0) TIEMPO_ALTA, ISNULL(HIJO.PRIORIDAD_MEDIA ,0) TIEMPO_MEDIA,ISNULL( HIJO.PRIORIDAD_BAJA,0)  TIEMPO_BAJA FROM 
DBO.TBSEGUIMIENTO_TIPOSOLICITUD HIJO LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD PADRE ON HIJO.IDTIPOSOL_PADRE = PADRE.IDTIPOSOLICITUD 
 ) PADRE_HIJO 
 LEFT JOIN
 DBO.TBSEGUIMIENTO_TIPOSOLICITUD ABUELO 
ON PADRE_HIJO.PADRE_IDTIPOSOL_PADRE = ABUELO.IDTIPOSOLICITUD 
WHERE HIJO_ID NOT IN (SELECT IDTIPOSOL_PADRE FROM TBSEGUIMIENTO_TIPOSOLICITUD)



	--SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,
	--FECHAASIGNACION AS FECHAASIGNACION,
	--FECHACREACION AS FECHACREACION,
	--ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA)) AS FECHAFINALIZACION,
	--PRIORIDAD,RESPONSABLE,FK_TIPOSOLICITUD,CREADOR,TBSEGUIMIENTO_SOLICITUD.ESTADO AS ESTADO, 
	--TBSEGUIMIENTO_PRIORIDADSOLICITUD.NOMBRE AS [N PRIORIDAD], TBSEGUIMIENTO_TIPOSOLICITUD.NOMBRETIPOSOLICITUD AS [N TIPOSOLICITUD], TBSEGUIMIENTO_ESTADOSOLICITUD.NOMBRE AS [N ESTADO] , NUMERO_SOLICITUD AS NUMSOL 




SELECT IDSOLICITUD,ASUNTO,DESCRIPCION,CONVERT(VARCHAR(50),FECHAASIGNACION, 121) AS FECHAASIGNACION ,CONVERT(VARCHAR(50),FECHACREACION,121) AS FECHACREACION ,
case when fechacierre is null then CONVERT(VARCHAR(50),ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,ans,TBSEGUIMIENTO_TIPOSOLICITUD.unidaddeMedida)), 121) else  fechaCierre end AS FECHAFINALIZACION,
PRIORIDAD,ad.displayName as RESPONSABLE,case when ad1.displayName is null then SOLICITANTE when ad1.displayName is not null then ad1.displayName end  as SOLICITANTE,FK_TIPOSOLICITUD,CREADOR,#TMPANSSEGUIMIENTO.ESTADO,
substring(CMP_PRIORIDAD,11,30) + ' ( ' + cast(tbSeguimiento_PrioridadSolicitud.Nombre as varchar(2)) + ' ) '  as [N Prioridad],
 --TBSEGUIMIENTO_TIPOSOLICITUD.NombreTipoSolicitud as [N TipoSolicitud],
 NOMTIPOLOGIA as [N TipoSolicitud],tbSeguimiento_EstadoSolicitud.Nombre as [N Estado] , numero_solicitud as NumSol,dbo.tbSeguimiento_Empresa.nombre as EMPRESASOLICITANTE FROM #TMPANSSEGUIMIENTO WITH(NOLOCK)  
 INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD ON #TMPANSSEGUIMIENTO.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD 
 INNER JOIN dbo.tbSeguimiento_relTipoSol_Empresa ON #TMPANSSEGUIMIENTO.FK_TIPOSOLICITUD = tbSeguimiento_relTipoSol_Empresa.IDTIPOSOL
 INNER JOIN dbo.tbSeguimiento_Empresa ON tbSeguimiento_relTipoSol_Empresa.idEmpresa = dbo.tbSeguimiento_Empresa.id_Empresa
 inner join dbo.tbSeguimiento_PrioridadSolicitud on #TMPANSSEGUIMIENTO.PRIORIDAD = dbo.tbSeguimiento_PrioridadSolicitud.idPrioridad 
 inner join dbo.tbSeguimiento_EstadoSolicitud  on #TMPANSSEGUIMIENTO.ESTADO = tbSeguimiento_EstadoSolicitud.IdSol  
 inner join dbo.tbActive_Directory ad on #TMPANSSEGUIMIENTO.RESPONSABLE = ad.sAMAccountName  
 LEFT OUTER join dbo.tbActive_Directory ad1 on #TMPANSSEGUIMIENTO.SOLICITANTE = ad1.sAMAccountName  
left join #TMPNOMTIPOLOGIA on FK_TIPOSOLICITUD = HIJO_ID
order by idsolicitud desc



	
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarSucursales]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarSucursales
	Autor:	Yoany Gomez Zapata
	Fecha:	18 de Septiembre de 2010

	Descripcion : Permite la consulta de las sucursales

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarSucursales]
AS
BEGIN
	SELECT id_sucursal,nombre FROM tbSeguimiento_Sucursal
	WHERE activo = 1
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTipoSol
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los tipos de solicitud

	 
	Autor: Dairon Castro Casas		
	Fecha: 07 de Octubre del 2020
	Modificaciones: Validacion para saber si es un registro o una consulta para manipular la data que vera el usuario
	Historia de usuario: 19719 - Modificaciones Help Desk - SGS
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSol]
@id_solpadre int,
-- Nuevo campo
@RegistrarSolicitud bit
AS
BEGIN
	IF @RegistrarSolicitud = 0
		SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
		Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
		FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
		WHERE idtiposol_padre = @id_solpadre AND (Area <> 'Tecnologia' OR Area IS NULL)
	ELSE
		SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
		Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
		FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
		WHERE idtiposol_padre = @id_solpadre 
		AND (Area <> 'Tecnologia' OR Area IS NULL)
		AND RegistrarSolicitud = 1

END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolAlternativa]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsultarTipoSol
	Fecha:	17 de junio 2012
	Autor:	Andres Vargas Clavijo

	Descripcion: Consulta los tipos de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolAlternativa]
@id_sol int
AS
BEGIN


	
DECLARE @IdSolPadre INT

	SELECT @IdSolPadre = idtiposol_padre
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idTipoSolicitud = @id_sol 

	
	--if  @IdSolPadre = 0
	
	if (SELECT count(idTipoSolicitud) FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idTipoSolicitud  = @id_sol and idTipoSolicitud in ( SELECT  idtiposol_padre
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK))) = 0
		SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol 
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idTipoSolicitud = @id_sol 
	
	UNION ALL
	
	SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idtiposol_padre = @IdSolPadre AND idTipoSolicitud <> @id_sol
	
	else

	
	
	SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol 
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idTipoSolicitud = @id_sol 
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolCompany]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTipoSolCompany
	Fecha:	29/06/2012
	Autor:	Andres Vargas Clavijo

	Autor: Dairon Castro Casas		
	Fecha: 07 de Octubre del 2020
	Modificaciones: Validacion para saber si es un registro o una consulta para manipular la data que vera el usuario
	Historia de usuario: 19719 - Modificaciones Help Desk - SGS
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolCompany]
@id_solpadre int,
@company varchar(500),
-- Nuevo campo
@RegistrarSolicitud bit
AS

Declare @idEmpresa int
set @idEmpresa= (select id_Empresa 
				from tbSeguimiento_Empresa
				where nombre = @company)
IF (@RegistrarSolicitud = 1)
BEGIN
	SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idtiposol_padre = @id_solpadre and (Area <> 'Tecnologia' or Area is null) and idTipoSolicitud in ( select idTipoSol
	from tbSeguimiento_relTipoSol_Empresa
	where idEmpresa = @idEmpresa ) AND RegistrarSolicitud = 1
END
ELSE
BEGIN
	SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idtiposol_padre = @id_solpadre and (Area <> 'Tecnologia' or Area is null) and idTipoSolicitud in ( select idTipoSol
	from tbSeguimiento_relTipoSol_Empresa
	where idEmpresa = @idEmpresa )
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolComplete]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTipoSol
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta los tipos de solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolComplete]
@id_solpadre int
AS
BEGIN
	SELECT idTipoSolicitud as ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
	where idtiposol_padre = @id_solpadre 
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolCompleteByCompany]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTipoSolCompleteByCompany
	Fecha:	31 de Mayo de 2012
	Autor:	Andres Vargas Clavijo (SQDM)
	Descripcion: Consulta los tipos de solicitud por compañia solicitante

	Autor: Dairon Castro Casas		
	Fecha: 07 de Octubre del 2020
	Modificaciones: Validacion para saber si es un registro o una consulta para manipular la data que vera el usuario
	Historia de usuario: 19719 - Modificaciones Help Desk - SGS

*/
-- [paSeguimiento_ConsultarTipoSolCompleteByCompany] 
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolCompleteByCompany]
@idTiposol int,
@NombreEmpresa varchar(500),
-- Nuevo campo
@RegistrarSolicitud bit
AS
/*
	1. Se obtiene el id de la empresa solicitante
*/

Declare @idEmpresa int
set @idEmpresa= (select id_Empresa 
				from tbSeguimiento_Empresa
				where nombre = @NombreEmpresa)

/*
	2. Se obtiene las solicitudes que puede hacer la empresa solicitante
	3. Se valida si es un nuevo registro o una consulta
*/
IF @RegistrarSolicitud = 0
	SELECT idTipoSolicitud AS ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud 
	WHERE idtiposol_padre = @idTiposol
	AND idTipoSolicitud in ( SELECT idTipoSol
	FROM tbSeguimiento_relTipoSol_Empresa
	WHERE idEmpresa = @idEmpresa )
ELSE 
	SELECT idTipoSolicitud AS ID,NombreTipoSolicitud,
	Estado,TiempoTarea,tiempocritico,unidaddeMedida, sigla_tipo_sol
	FROM tbSeguimiento_tiposolicitud 
	WHERE idtiposol_padre = @idTiposol
	AND idTipoSolicitud in ( SELECT idTipoSol
	FROM tbSeguimiento_relTipoSol_Empresa
	WHERE idEmpresa = @idEmpresa )
	AND RegistrarSolicitud = 1
	
--------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolHijaComplete]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
      Nombre: paSeguimiento_ConsultarTipoSol
      Fecha:      20 de Septiembre 2011
      Autor:      David Olaciregui

      Descripcion: Consulta los tipos de solicitud

      Modificaciones:
      Autor:                  Fecha:
      Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolHijaComplete]
@id_solpadre int
AS
BEGIN
      SELECT DISTINCT NombreTipoSolicitud,
      Estado,tiempocritico,unidaddeMedida, sigla_tipo_sol
      FROM tbSeguimiento_tiposolicitud WITH(NOLOCK)
      where idTipoSolicitud NOT IN (SELECT DISTINCT idtiposol_padre FROM tbSeguimiento_tiposolicitud WITH(NOLOCK))

END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolNotifica]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTipoSolNotifica
	Fecha :	22 de Septiembre de 2010
	Autor : Yoany Gomez Zapata
	
	Descripcion: Permite consultar si se debe notificar obligatoriamente
				la solicitud

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolNotifica]
@Id_Sol int
AS
BEGIN
	SELECT notifica,mail_notifica,CASE WHEN notificaSeguimiento IS NULL THEN ''ELSE notificaSeguimiento END notificaSeguimiento 
	FROM tbseguimiento_tiposolicitud WITH(NOLOCK)
	WHERE idTipoSolicitud = @Id_Sol
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: [paSeguimiento_ConsultarTipoSolResponsable]
	Fecha:	07 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consulta el responsable por tipo solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolResponsable]
@idTipoSol int
AS
BEGIN
	SELECT usuario_responsable
	FROM tbSeguimiento_relTipoSol_Responsable WITH(NOLOCK)
	where idTipoSol = @idTipoSol
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTipoSolResponsableByCompany]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: [paSeguimiento_ConsultarTipoSolResponsableByCompany]
	Fecha:	31 de Mayo de 2012
	Autor:	Andres Vargas Clavijo SQDM

	Descripcion: Consulta el responsable por tipo solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/

CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTipoSolResponsableByCompany]
@idTipoSol int,
@empresa varchar(500)

AS

Declare @idEmpresa int 
set @idEmpresa = (select id_Empresa from tbSeguimiento_Empresa
					where nombre=@empresa)

	SELECT usuario_responsable
	FROM tbSeguimiento_relTipoSol_Responsable WITH(NOLOCK)
	where idTipoSol = @idTipoSol and idempresa = @idEmpresa


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTsolByTsol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarTsolByTsol
	Autor:	Yoany Gomez Zapata
	Fecha:	22 de Septiembre de 2010

	Descripcion : Permite la consulta de las Areas

*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarTsolByTsol]
@id_tiposol int 
AS
BEGIN
	select idTipoSolicitud,idTipoSolicitud_auto,regla_asignacion,activo, multiasignado 
	from dbo.tbSeguimiento_relTipoSol_TipoSol
	WHERE idTipoSolicitud = @id_tiposol
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarTurnos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: dbo.paSeguimiento_ConsultarTurnos
	Fecha: 26 de Noviembre de 2010
	Autor: Yoany Gomez Zapata
	
	Descripcion : Permiter la consulta de los turnos de sporte adicionales 
	
	Modficaciones:
	Autor:					Fecha:
	Descripcion:
*/
create PROCEDURE [dbo].[paSeguimiento_ConsultarTurnos]
@dia_turno VARCHAR(10)
AS
BEGIN
	SELECT dia_turno,turno_mañana,turno_noche 
	FROM dbo.tbSeguimiento_TurnosSoporte with(nolock)
	WHERE dia_turno = @dia_turno
END

GO
/****** Object:  StoredProcedure [dbo].[PASEGUIMIENTO_CONSULTARULTIMOSEGUIMIENTO]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PASEGUIMIENTO_CONSULTARULTIMOSEGUIMIENTO]
@IDSOLICITUD INT
AS
SET NOCOUNT ON
SELECT TOP 1 IDSEGUIMIENTO,DESCRIPCION,FECHAINICIO,FACHAFINAL,FK_SOLICITUD
IDSEGUIMIENTO,NOMBRE_ARCHIVO,ESTADO  FROM  [TBSEGUIMIENTO_SEGUIMIENTO] 
LEFT JOIN DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO ON 
DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO.ID_SEG = TBSEGUIMIENTO_SEGUIMIENTO.IDSEGUIMIENTO 
WHERE FK_SOLICITUD=@IDSOLICITUD
ORDER BY TBSEGUIMIENTO_SEGUIMIENTO.IDSEGUIMIENTO DESC

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarUsuariosGrupo]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ConsultarUsuariosGrupo
	Fecha:	29 de Noviembre de 2010
	Autor:	Yoany Gomez Zapata		
	
	Descripcion: Permite listar los usuarios pertenecientes a un grupo
	
	Autor: Dairon Castro Casas		
	Fecha: 07 de Octubre del 2020
	Modificaciones: Validacion para saber si es un registro o una consulta para manipular la data que vera el usuario
	Historia de usuario: 19719 - Modificaciones Help Desk - SGS
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarUsuariosGrupo]
@IdGrupo int
AS
BEGIN
	SELECT SGU.USUARIO 
	FROM tbSeguimiento_GrupoUsuarios SGU WITH(NOLOCK)
	JOIN tbSeguimiento_Responsable SR ON UPPER(SGU.USUARIO) = UPPER(SR.USUARIONT)
	WHERE idGrupoSol = @IdGrupo AND SR.ESTADO = 1
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsultarValorCamposDinamicosSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ConsultarValorCamposDinamicosSeguimiento]
@idSeguimiento int
AS
BEGIN
SET NOCOUNT ON
declare @xml as xml

select  @xml=valor_campos_dinamicos from tbSeguimiento_Seguimiento
where idSeguimiento = @idSeguimiento

SELECT cast(T.c.query('local-name(.)') as varchar(150)) AS nombre_campo, cast(T.c.query('./text()') as varchar(500)) resultado
FROM @xml.nodes('/cdb/CamposDinamicos/*') T(c)
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ConsutarTipologiaPadre]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ConsutarTipologiaPadre
	Fecha:	15 de Septiembre de 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Consultar recursivamente las tipologias padres

	Modifcaciones:
	Autor:					Fecha:
	Descripcion:	
*/
create PROCEDURE [dbo].[paSeguimiento_ConsutarTipologiaPadre]
@SOL INT
AS

DECLARE @RESULT VARCHAR(50)

SET @RESULT = LTRIM(RTRIM(CAST(@SOL AS VARCHAR(20)))) + ','

WHILE @SOL <> 0
BEGIN
	SELECT @SOL = IDTIPOSOL_PADRE 
	FROM DBO.TBSEGUIMIENTO_TIPOSOLICITUD 
	WHERE IDTIPOSOLICITUD = @SOL
	SET @RESULT = @RESULT + LTRIM(RTRIM(CAST(@SOL AS VARCHAR(20)))) + ','
END
SELECT @RESULT as result




GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarDatosBasicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_IngresarDatosBasicos
	Fecha:	20 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: ingresar datos basicos de la solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_IngresarDatosBasicos]
@id_solicitud INT, 
@numero_identificacion vARCHAR(50),
@nombre_funcionario VARCHAR(200), 
@fecha_ingreso VARCHAR(50),
@id_sucursal INT,
@id_area INT,
@fecha_nacimiento VARCHAR(50)
AS
BEGIN
	SET DATEFORMAT ymd
	INSERT INTO [dbo].[tbSeguimiento_RelDatosBasicos_Solicitud]
           ([id_solicitud]
			,numero_identificacion
           ,[nombre_funcionario]
           ,[fecha_ingreso]
           ,[id_sucursal]
           ,[id_area]
           ,[fecha_nacimiento])
     VALUES
           (@id_solicitud, 
		   @numero_identificacion,
           @nombre_funcionario, 
           @fecha_ingreso,
           @id_sucursal,
           @id_area,
           @fecha_nacimiento)
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarEstado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[paSeguimiento_IngresarEstado]

  @nombre varchar(250)

AS

SET NOCOUNT ON

INSERT INTO [dbo].[tbSeguimiento_Estado]
           ([nombreEstado])
     VALUES
           (@nombre)




GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarNotificadas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[paSeguimiento_IngresarNotificadas]
@idsolicitud int
AS
BEGIN
	INSERT INTO TBSEGUIMIENTO_SOLICITUDNOTIFICACION VALUES (@idsolicitud,getdate())
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarRelAplicacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_IngresarRelAplicacion
	Fecha:	20 de Septiembre 2010
	Autor:	Yoany Gomez Zapata

	Descripcion: Permite ingresar relacion de aplicacion solicitud

	Modificaciones:
	Autor:			Fecha:
	Descripcion:

*/
CREATE PROCEDURE [dbo].[paSeguimiento_IngresarRelAplicacion]
@id_aplicacion int, 
@id_solicitud int
AS
BEGIN
	IF NOT EXISTS ( SELECT id_solicitud FROM tbSeguimiento_RelAplicaciones_Solicitud WHERE id_aplicacion = @id_aplicacion AND id_solicitud = @id_solicitud)
	BEGIN
		INSERT INTO tbSeguimiento_RelAplicaciones_Solicitud 
		VALUES (@id_aplicacion,@id_solicitud)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarRelDatosSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[paSeguimiento_IngresarRelDatosSolicitud]
@id_solicitud int,
@certificado bit,
@posicion varchar(50),
@software_add varchar(200)
as
BEGIN
	IF NOT EXISTS ( SELECT id_solicitud FROM tbSeguimiento_RelDatos_Solicitud WHERE id_solicitud = @id_solicitud)
	BEGIN
		INSERT INTO tbSeguimiento_RelDatos_Solicitud
		(id_solicitud,certificado,posicion,software_add) 
		 VALUES 
		(@id_solicitud,@certificado,@posicion,@software_add)
	END
	ELSE
	BEGIN
		UPDATE tbSeguimiento_RelDatos_Solicitud 
		SET id_solicitud =  @id_solicitud ,
			certificado = @certificado,
			posicion = @posicion,
			software_add = @software_add
		WHERE id_solicitud = @id_solicitud
	END
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--set dateformat ymd execute [paSeguimiento_IngresarResponsable] 'prueba','10/12/2009', '10/12/2009',1

--select * from [tbSeguimiento]

CREATE PROCEDURE [dbo].[paSeguimiento_IngresarResponsable]

@cargo varchar(250),
@Nombre varchar(250),
@estado bit

AS

SET NOCOUNT ON


INSERT INTO [dbo].[tbSeguimiento_Responsable]
           ([cargo]
           ,[Nombre]
           ,[estado])
     VALUES
           (@cargo ,@Nombre , @estado )


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Modificacion Fecha, Hora y segundos Seguimieto 
Requerimiento CDB-DES-69339dbo.paSeguimiento_IngresarRelAplicacion
Descripcion: Se requiere que los seguimientos tengan un formato de hora, minutos y segundos. Adicional que el cierre automático, traer como usuario de seguimiento al responsable del caso y colocar hora de cierre y seguimiento.
Fecha: 2017-07-17
Autor: Carlos E. Jimenez Romero

*/

CREATE PROCEDURE [dbo].[paSeguimiento_IngresarSeguimiento]
@descripcion varchar(500),
@fechaInicio varchar(50),
@fachaFinal varchar(50),
@fk_Solicitud int,
@estado int,
@usuario varchar(50),
@fechaSeg varchar(50),
@camposdinamicos xml
AS
SET NOCOUNT ON
SET DATEFORMAT ymd

INSERT INTO [dbo].[tbSeguimiento_Seguimiento]
           ([descripcion]
           ,[fechaInicio]
           ,[fachaFinal]
           ,[fk_Solicitud]
           ,[estado]
           ,[Usuario]
           ,[fechaSeguimiento]
           ,valor_campos_dinamicos)
     VALUES
           (@descripcion,
           @fechaInicio, 
           @fachaFinal,
           @fk_Solicitud,
           @estado,
           @usuario,
           GETDATE(),
           @camposdinamicos)
select scope_identity() as result


--SELECT * FROM [dbo].[tbSeguimiento_Seguimiento]
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_IngresarSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 
  Modificado: Casa De Bolsa - Isabel Nagles
  Fecha: 25 de Septiembre de 2013
  Descripcion: Reemplazo '-' al incio del consecutivo de la solicitud origen.
  */

CREATE PROCEDURE [dbo].[paSeguimiento_IngresarSolicitud]
  @asunto varchar(1000),
  @descripcion varchar(1000),
  @fechaAsignacion VARCHAR(50),
  @fechaCreacion VARCHAR(50),
  @Fechafinalizacion VARCHAR(50),
  @prioridad int,
  @fk_responsable VARCHAR(50),
  @fk_tipoSolicitud int,
  @creador varchar(250),
  @solicitante varchar(250),
  @estado int,
  @area_creador varchar(200),
  @cargo_creador varchar(150),
  @numero_sol varchar(100),
  @correo_adicional varchar(2000),
  @numero_sol_origen varchar(100), 
  @xmlCampoDinamicos xml
AS

SELECT @numero_sol_origen = CASE WHEN LEFT(LTRIM(RTRIM(@numero_sol_origen)),1) = '-' THEN SUBSTRING(LTRIM(RTRIM(@numero_sol_origen)), 2, LEN(@numero_sol_origen)) ELSE @numero_sol_origen END

IF @fk_responsable = 'GRUPO'
BEGIN

SELECT TOP 1 @fk_responsable = usuariont_superior  FROM dbo.tbSeguimiento_Responsable WHERE usuariont IN  
(SELECT DISTINCT USUARIO FROM tbSeguimiento_relTipoSol_Grupo A, tbSeguimiento_GrupoUsuarios  B WHERE A.IDGRUPOSOL = B.IDGRUPOSOL AND idTipoSol = @fk_tipoSolicitud)

END



IF @Fechafinalizacion = ''
	SET @Fechafinalizacion = NULL

SET NOCOUNT ON
SET DATEFORMAT ymd
INSERT INTO [dbo].[tbSeguimiento_Solicitud]
           ([asunto]
           ,[descripcion]
           ,[fechaAsignacion]
           ,[fechaCreacion]
           ,[Fechafinalizacion]
           ,[prioridad]
           ,[responsable]
           ,[fk_tipoSolicitud],
			creador,estado,area_creador,cargo_creador,correo_notificacion_adicional,numero_solicitud_origen,valor_campos_dinamicos,solicitante)
     VALUES
           (@asunto, 
           @descripcion, 
           getdate(), 
           getdate(), 
           @Fechafinalizacion,
           @prioridad,
           @fk_responsable, 
           @fk_tipoSolicitud,
		   @creador,@estado,@area_creador,@cargo_creador,@correo_adicional,@numero_sol_origen,@xmlCampoDinamicos,@solicitante)

declare @result int
set @result = scope_identity() 

--Actualizando Numero SOlicitud
--update S set numero_solicitud = @numero_sol + T.sigla_tipo_sol + '-' + ltrim(rtrim(cast(@result as varchar(20))))
--from [tbSeguimiento_Solicitud] S
--inner join dbo.tbSeguimiento_tiposolicitud T on S.fk_tipoSolicitud = T.idTipoSolicitud
--where idsolicitud = @result

--- 20130403 MODIFICADO CASA DE BOLSA -ISABEL NAGLES MANEJO PREFIJO CORFICOLOMBIANA Y DEMAS FILIALES
update S set numero_solicitud =  T.sigla_tipo_sol + '-' + ltrim(rtrim(cast(@result as varchar(20))))
from [tbSeguimiento_Solicitud] S
inner join dbo.tbSeguimiento_tiposolicitud T on S.fk_tipoSolicitud = T.idTipoSolicitud
where idsolicitud = @result


select @result as result




GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_InsertarRelAenxosSeg]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_InsertarRelAenxosSeg
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Septiembre 2010

	Descripcion: Permite la insercion de anexos a solicitudes

	Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	08 de Febrero de 2013
	  Descripcion:	Adicion del campo Usuario a la consulta.
*/
CREATE PROCEDURE [dbo].[paSeguimiento_InsertarRelAenxosSeg]
    @Id_Seg int, 
    @Numero_Solicitud VARCHAR(100),
    @Nombre_Archivo VARCHAR(500),
    @Descripcion_Arch VARCHAR(500),
    @Usuario VARCHAR(50)
AS
    INSERT INTO DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO(
        Id_Seg,
        Numero_Solicitud,
        Nombre_Archivo,
        Descripcion_Arch,
        Fecha_Cargue,
        Usuario
    ) VALUES (
        @Id_Seg,
        @Numero_Solicitud,
        @Nombre_Archivo,
        @Descripcion_Arch,
        GETDATE(),
        @Usuario
    )

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_InsertarRelAenxosSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_InsertarRelAenxosSol
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Septiembre 2010

	Descripcion: Permite la insercion de anexos a solicitudes

	Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	08 de Febrero de 2013
	  Descripcion:	Adicion del campo Usuario a la consulta.
*/
CREATE PROCEDURE [dbo].[paSeguimiento_InsertarRelAenxosSol]
    @Id_Sol INT, 
    @Numero_Solicitud VARCHAR(100),
    @Nombre_Archivo VARCHAR(500),
    @Descripcion_Arch VARCHAR(500),
    @Usuario VARCHAR(50)
AS
    INSERT INTO DBO.TBSEGUIMIENTO_RELARCH_SOLICITUD(
        Id_Sol,
        Numero_Solicitud,
        Nombre_Archivo,
        Descripcion_Arch,
        Fecha_Cargue,
        Usuario
    ) VALUES (
        @Id_Sol,
        @Numero_Solicitud,
        @Nombre_Archivo,
        @Descripcion_Arch,
        GETDATE(),
        @Usuario
    )

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_LeerEstado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[paSeguimiento_LeerEstado]

@idEstado int
AS

SET NOCOUNT ON


IF @idEstado = 0
BEGIN
select * from dbo.tbSeguimiento_Estado
END
ELSE
select * from tbEstado WHERE @idEstado = @idEstado



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_LeerEstadoSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_LeerEstadoSolicitud]

@idSol int
AS
BEGIN
select Nombre from tbSeguimiento_EstadoSolicitud
where IdSol = (select estado from tbSeguimiento_Solicitud
where idsolicitud=@idSol)
END
GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_LeerResponsable]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_LeerResponsable]
@usuariont varchar(50)
AS
SET NOCOUNT ON
IF @usuariont = '0'
BEGIN
	select ISNULL(cargo,0) AS cargo,idResponsable,Nombre,Apellido,estado,usuariont 
	from [tbSeguimiento_Responsable]
END

IF @usuariont = '1'
BEGIN
	SELECT DISTINCT responsable as usuariont FROM tbSeguimiento_Solicitud
END

IF ISNUMERIC(@usuariont) = 0
BEGIN
	select ISNULL(cargo,0)AS cargo,idResponsable,Nombre,Apellido,estado,usuariont 
	from  [tbSeguimiento_Responsable] WHERE usuariont = @usuariont
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_LeerSeguimiento]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_InsertarRelAenxosSeg
	Autor: 
	Fecha: 

	Descripcion: Permite la insercion de anexos a solicitudes

	Modificaciones:
	1 Autor:	FREDY H. DIAZ E.
	  Fecha:	08 de Febrero de 2013
	  Descripcion:	Modificacion de los alias, para evitar ambiguedad en los campos.
*/
CREATE PROCEDURE [dbo].[paSeguimiento_LeerSeguimiento]
    @IdSolicitud INT
AS

    SET NOCOUNT ON
    
    SELECT
        IdSeguimiento,
        Descripcion,
        FechaInicio,
        FachaFinal,
        Fk_Solicitud AS IdSolicitud,
        Nombre_Archivo,
        Estado,
        SE.Usuario,
        FechaSeguimiento
    FROM TBSEGUIMIENTO_SEGUIMIENTO AS SE
    
    LEFT JOIN DBO.TBSEGUIMIENTO_RELARCH_SEGUIMIENTO AS SEA
    ON SEA.id_seg = SE.IdSeguimiento 
    
    WHERE Fk_Solicitud = @IdSolicitud
    
    ORDER BY IdSeguimiento ASC
	

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_LeerSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_LeerSolicitud]

@idsolicitud int
AS
SET NOCOUNT ON
DECLARE @SQL AS VARCHAR(4000),@SQLAUX AS NVARCHAR(4000)
--- exec paSeguimiento_LeerSolicitud 18
IF @idsolicitud = 0
BEGIN
select * from [tbSeguimiento_Solicitud]
END
ELSE

DECLARE @prioridad AS NVARCHAR(80)

SET @SQLAUX = ' select @prioridad = ''PRIORIDAD_''+valor_campos_dinamicos.value(''(/cdb/CamposDinamicos/Criticidad)[1]'',''VARCHAR(20)'') from tbSeguimiento_Solicitud WHERE idsolicitud = ' + CAST(@idsolicitud AS VARCHAR)
--print @SQLAUX
Exec sp_executesql @SQLAUX,N'@prioridad NVARCHAR(50) OUTPUT',@prioridad OUTPUT
--print @prioridad

IF (@PRIORIDAD IS NULL)
BEGIN
SET @SQL = '
       select 
       asunto,
       descripcion,
       fechaAsignacion,
       fechaCreacion,
       ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TiempoTarea,TBSEGUIMIENTO_TIPOSOLICITUD.unidaddeMedida)) AS fechafinalizacion,
       idsolicitud,
       prioridad,
       responsable,
       fk_tipoSolicitud,
       creador,
       Solicitante,
       tbSeguimiento_Solicitud.estado,
       area_creador,
       cargo_creador,
       numero_solicitud,
       correo_notificacion_adicional,
       numero_solicitud_origen,
       valor_campos_dinamicos,
       tbSeguimiento_NivelServicio.nombreNivel nivelServicio,
       CASE WHEN aceptada=1 THEN ''Aceptada'' WHEN aceptada=0 THEN ''Rechazada'' END as Aceptacion,
       tbSeguimiento_EstadoSolicitud.Nombre [N Estado]
       FROM DBO.tbSeguimiento_Solicitud WITH(NOLOCK)
       INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD WITH(NOLOCK) ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
       INNER JOIN tbSeguimiento_EstadoSolicitud WITH(NOLOCK) ON tbSeguimiento_EstadoSolicitud.IdSol=TBSEGUIMIENTO_SOLICITUD.estado
       LEFT JOIN dbo.tbSeguimiento_NivelServicio ON tbSeguimiento_Solicitud.idNivelServicio=tbSeguimiento_NivelServicio.idNivel
       WHERE idsolicitud = ' + CAST(@idsolicitud AS VARCHAR)
END
ELSE
SET @SQL = '
       select 
       asunto,
       descripcion,
       fechaAsignacion,
       fechaCreacion,
       ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,' + @prioridad + ',TBSEGUIMIENTO_TIPOSOLICITUD.unidaddeMedida)) AS fechafinalizacion,
       idsolicitud,
       prioridad,
       responsable,
       fk_tipoSolicitud,
       creador,
       Solicitante,
       tbSeguimiento_Solicitud.estado,
       area_creador,
       cargo_creador,
       numero_solicitud,
       correo_notificacion_adicional,
       numero_solicitud_origen,
       valor_campos_dinamicos,
       tbSeguimiento_NivelServicio.nombreNivel nivelServicio,
       CASE WHEN aceptada=1 THEN ''Aceptada'' WHEN aceptada=0 THEN ''Rechazada'' END as Aceptacion,
       tbSeguimiento_EstadoSolicitud.Nombre [N Estado]
       FROM DBO.tbSeguimiento_Solicitud WITH(NOLOCK)
       INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD WITH(NOLOCK) ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
       INNER JOIN tbSeguimiento_EstadoSolicitud WITH(NOLOCK) ON tbSeguimiento_EstadoSolicitud.IdSol=TBSEGUIMIENTO_SOLICITUD.estado
       LEFT JOIN dbo.tbSeguimiento_NivelServicio ON tbSeguimiento_Solicitud.idNivelServicio=tbSeguimiento_NivelServicio.idNivel
       WHERE idsolicitud = ' + CAST(@idsolicitud AS VARCHAR)
       
--PRINT @SQL
EXEC (@SQL)

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ListarSolicitudesNotificar]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paSeguimiento_ListarSolicitudesNotificar
	Autor:  Yoany Gomez Zapata
	Fecha:  01 de Octubre 2010

	Descripcion: Lista Las solicitudes que se deben escalar al jefe de area
	
	Modificaciones:
	Autor:						Fecha:
	Desarrollo:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ListarSolicitudesNotificar]
AS
BEGIN
	DECLARE @ESTADOCIERRE INT

	SELECT @ESTADOCIERRE = IDSOL   
	FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD WITH(NOLOCK)
	WHERE CIERRA_SOLICITUD = 1

	SELECT * FROM
	(
		SELECT 
			TBSEGUIMIENTO_SOLICITUD.DESCRIPCION,
			TBSEGUIMIENTO_SOLICITUD.FECHAASIGNACION,
			TBSEGUIMIENTO_SOLICITUD.FECHACREACION,
			ISNULL(TBSEGUIMIENTO_SOLICITUD.FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(TBSEGUIMIENTO_SOLICITUD.FECHAASIGNACION,TIEMPOTAREA)) 
			AS FECHAFINALIZACION,
			TBSEGUIMIENTO_SOLICITUD.IDSOLICITUD,
			TBSEGUIMIENTO_SOLICITUD.PRIORIDAD,
			TBSEGUIMIENTO_SOLICITUD.RESPONSABLE,
			TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD,
			TBSEGUIMIENTO_SOLICITUD.CREADOR,
			TBSEGUIMIENTO_SOLICITUD.ESTADO,
			TBSEGUIMIENTO_SOLICITUD.AREA_CREADOR,
			TBSEGUIMIENTO_SOLICITUD.CARGO_CREADOR,
			TBSEGUIMIENTO_SOLICITUD.NUMERO_SOLICITUD,
			TBSEGUIMIENTO_SOLICITUD.CORREO_NOTIFICACION_ADICIONAL
		FROM TBSEGUIMIENTO_SOLICITUD WITH(NOLOCK)
		INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD WITH(NOLOCK) ON TBSEGUIMIENTO_SOLICITUD.FK_TIPOSOLICITUD = TBSEGUIMIENTO_TIPOSOLICITUD.IDTIPOSOLICITUD
		LEFT JOIN TBSEGUIMIENTO_SOLICITUDNOTIFICACION WITH(NOLOCK) ON TBSEGUIMIENTO_SOLICITUDNOTIFICACION.IDSOLICITUD = TBSEGUIMIENTO_SOLICITUD.IDSOLICITUD
		WHERE NOTIFICA = 1 
			AND TBSEGUIMIENTO_SOLICITUDNOTIFICACION.IDSOLICITUD IS NULL
			AND TBSEGUIMIENTO_SOLICITUD.ESTADO NOT IN  (SELECT IDSOL FROM DBO.TBSEGUIMIENTO_ESTADOSOLICITUD WITH(NOLOCK)
	WHERE CIERRA_SOLICITUD = 1)
	) A
	WHERE FECHAFINALIZACION <= GETDATE()
END

GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ModificarTipoSolSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ModificarTipoSolSol
	Fecha creacion: 06 de junio de 2012
	
	Creado por: Andres Vargas Clavijo SQDM
*/


CREATE PROCEDURE [dbo].[paSeguimiento_ModificarTipoSolSol]
@idsol int,
@fk_TipoSol int,
@responsable varchar(300),
@fechaAsignacion datetime
AS
BEGIN
UPDATE tbSeguimiento_Solicitud
SET fechaAsignacion=@fechaAsignacion,--CONVERT (DATETIME,@fechaAsignacion),
	fk_tipoSolicitud=@fk_TipoSol,
	responsable = @responsable,
	numero_solicitud = ltrim(rtrim((select top 1 sigla_tipo_sol from tbseguimiento_tiposolicitud where idtiposolicitud = @fk_TipoSol))) + '-' + ltrim(rtrim(cast(@idsol as varchar(20))))
WHERE idsolicitud=@idsol
END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ReporteAreaSol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
NOMBRE DEL PROCEDIMIENTO: paSeguimiento_ReporteAreaSol
CREADO POR : ANDRES VARGAS SQDM
FECHA DE CREACION : 27 DE JUNIO DE  2012

MODIFICADO POR : RONALD R GONZALEZ E.
MODIFICADO : 03 DE OCTUBRE DE  2012
COMENTARIO : Cambio para ajustar a los nuevos estados de la solicitud 
*/


CREATE PROCEDURE [dbo].[paSeguimiento_ReporteAreaSol]
@fecha_ini datetime ,
@fecha_fin datetime ,
@IDEMPRESA INT
AS
BEGIN

	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	
	SET @sql = N'SELECT AREA, '+@CAMPOS+
				' FROM (SELECT  AREA_CREADOR AS AREA , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
				FROM DBO.TBSEGUIMIENTO_SOLICITUD S
				INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
				INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
				INNER JOIN DBO.tbActive_Directory A ON S.creador= A.sAMAccountName
				WHERE AREA_CREADOR != '''' 
					  AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
					  AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
					  AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
				GROUP BY DATEPART(MONTH,FECHACREACION) , AREA_CREADOR, E.NOMBRE
				) PIV
				PIVOT (SUM(CANTIDAD) FOR  ESTADO IN ('+ @CAMPOSPVT + ')) AS PIVOTTABLE'
	EXEC sp_executesql @sql
			
END

GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteEstadoByFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
MODIFICADO POR : RONALD R GONZALEZ E.
MODIFICADO : 03 DE OCTUBRE DE  2012
COMENTARIO : Cambio para ajustar a los nuevos estados de la solicitud 
*/

CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteEstadoByFecha]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@IDEMPRESA INT
AS
BEGIN

	
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	
	SET @sql = N'SELECT FECHA, '+@CAMPOS+
				' FROM (SELECT  CONVERT(VARCHAR(15), FECHACREACION, 101 ) AS FECHA ,  E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
						FROM DBO.TBSEGUIMIENTO_SOLICITUD S
						INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
						INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL
						INNER JOIN DBO.tbActive_Directory A ON S.creador=A.sAMAccountName 
						WHERE AREA_CREADOR != '''' 
						  AND FECHACREACION >= '''+CONVERT(VARCHAR(15), @FECHA_INI, 101 )+''' 
						  AND FECHACREACION <= '''+CONVERT(VARCHAR(15), @FECHA_FIN, 101 )+''' 
						  AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
				GROUP BY CONVERT(VARCHAR(15), FECHACREACION, 101 ), E.NOMBRE
				) PIV
				PIVOT (SUM(CANTIDAD) FOR  ESTADO IN ('+ @CAMPOSPVT + ')) AS PIVOTTABLE'
	EXEC sp_executesql @sql
	
END

GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteEstadoByTipologia]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	:	dbo.PaSeguimiento_ReporteEstadoByFecha
	Fecha	:	27 de JUNIO de 2012
	Autor	:	ANDRES VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados
	
	2 Autor:	
	  Fecha:	
	  Descripcion: 
	  
	  PaSeguimiento_ReporteEstadoByTipologia '20110101',  '20110131'
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteEstadoByTipologia]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@IDEMPRESA INT
AS
BEGIN

	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT TIPOSOLICITUD ,' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(
		SELECT T1.NombreTipoSolicitud + '' - ''+ T.NOMBRETIPOSOLICITUD  as TIPOSOLICITUD, 
		E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T1 ON T.idtiposol_padre = T1.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
		INNER JOIN dbo.tbActive_Directory A ON S.creador = A.sAMAccountName
		WHERE AREA_CREADOR != ''''  
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
		GROUP BY CONVERT(VARCHAR(15), FECHACREACION, 101 ), T1.NombreTipoSolicitud + '' - ''+ T.NOMBRETIPOSOLICITUD,  E.NOMBRE
	) 
	AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	)AS PIVOTTABLE 	ORDER BY 7' 

	EXEC sp_executesql @sql
	
END


GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteEstadoByUsuario]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre	:	dbo.PaSeguimiento_ReporteEstadoByUsuario
	Fecha	:	27 DE JUNIO DE 2012
	Autor	:	ANDRSE VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados, Existe una forma dinamica de hacer este reporte
	
	2 Autor:	
	  Fecha:	
	  Descripcion: 
	  
	  PaSeguimiento_ReporteEstadoByUsuario '20110101',  '20110131','aavila'
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteEstadoByUsuario]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@USUARIO VARCHAR(50),
@IDEMPRESA INT
AS
BEGIN
	  
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT FECHA , RESPONSABLE ,' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(		
		SELECT  CONVERT(VARCHAR(15), FECHACREACION, 101 ) AS FECHA , RESPONSABLE , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
		INNER JOIN DBO.tbActive_Directory A ON S.creador = A.sAMAccountName
		WHERE AREA_CREADOR != '''' 
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
			AND RESPONSABLE = '+@USUARIO+'
		GROUP BY CONVERT(VARCHAR(15), FECHACREACION, 101 ) , RESPONSABLE, E.NOMBRE
	) AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	)AS PIVOTTABLE ORDER BY 1'
	
	EXEC sp_executesql @sql

END

GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteEstadoConsolidadoByUsuario]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	:	dbo.PaSeguimiento_ReporteEstadoByFecha
	Fecha	:	27 DE JUNIO DE 2012
	Autor	:	ANDRES VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados
	
	2 Autor:	
	  Fecha:	
	  Descripcion: 
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteEstadoConsolidadoByUsuario]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@USUARIO VARCHAR(50),
@IDEMPRESA INT
AS
BEGIN
	
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT RESPONSABLE, ' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(	
		SELECT  RESPONSABLE , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
		INNER JOIN DBO.tbActive_Directory A ON S.creador = A.sAMAccountName
		WHERE AREA_CREADOR != '''' 
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
			AND RESPONSABLE = '+@USUARIO+'
		GROUP BY  RESPONSABLE, E.NOMBRE
	) AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	) AS PIVOTTABLE ORDER BY 1'
	
	EXEC sp_executesql @sql

END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ReporteSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paSeguimiento_ReporteSolicitud]
    @FechaIni VARCHAR(50),
    @FechaFin VARCHAR(50),
    @Estado INT, 
    @Asignado VARCHAR(50),
    @TipoSolicitud VARCHAR(200),
    @Prioridad INT,
    @IdSolicitud VARCHAR(50),
    @Asunto VARCHAR(250), 
    @Creador VARCHAR(250),
    @Area VARCHAR(50),
    @CamposDinamicos VARCHAR(500),
    @IdEmpresa INT,
    @EstadoUsuario BIT,
    @usuarioSolicitante VARCHAR(50) 
AS

    DECLARE @Priority AS NVARCHAR(80)
    DECLARE @Ans INT
    DECLARE @NSql NVARCHAR(3000)
    DECLARE @CorreoUsuarioSolicitante as NVARCHAR(50)
    
    
    exec paSeguimiento_ConsultarCorreoByUser_output @usuarioSolicitante, @CorreoUsuarioSolicitante OUTPUT
    --PRINT @CorreoUsuarioSolicitante

    -- Creando la tabla tempiral para almacenar acuerdos de servicio
    CREATE TABLE #TMPANSSEGUIMIENTO (
        IdSolicitud INT NOT NULL PRIMARY KEY,
        Asunto VARCHAR(250) NULL,
        Descripcion VARCHAR(500) NULL,
        FechaAsignacion DATETIME NULL,
        FechaCreacion DATETIME NULL,
        FechaFinalizacion DATETIME NULL,
        Prioridad INT NULL,
        Responsable NVARCHAR(4000) NULL,
        Fk_TipoSolicitud INT NULL,
        Creador VARCHAR(250) NULL,
        Estado INT NULL,
        Numero_Solicitud VARCHAR(100) NULL,
        Valor_Campos_Dinamicos XML NULL,
        Solicitante NVARCHAR(4000) NULL,
        FechaCierre DATETIME NULL,
        Ans INT NULL,
        Cmp_Prioridad VARCHAR(50) NULL
    ) 


    SET @NSql = '
        SELECT
            SES.IdSolicitud,
            SES.Asunto,
            SES.Descripcion,
            SES.FechaAsignacion,
            SES.FechaCreacion,
            SES.FechaFinalizacion,
            SES.Prioridad,
            AD.DisplayName AS Responsable,
            SES.Fk_TipoSolicitud,
            SES.Creador,
            SES.Estado, 
            SES.Numero_Solicitud,
            SES.Valor_Campos_Dinamicos,
            case when AD1.displayName is null then SOLICITANTE when AD1.displayName is not null then AD1.displayName end  as SOLICITANTE,
            SES.fechaCierre,
            0 Ans,
            CASE
                WHEN CONVERT(VARCHAR(MAX), SES.Valor_Campos_Dinamicos) <> '''' THEN
                    ''PRIORIDAD_'' + SUBSTRING(CONVERT(VARCHAR(MAX), SES.Valor_Campos_Dinamicos), CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX), SES.Valor_Campos_Dinamicos), 5) + 12,
                            CHARINDEX(''</CRITICIDAD>'', CONVERT(VARCHAR(MAX), SES.Valor_Campos_Dinamicos), 5) - ( CHARINDEX(''<CRITICIDAD>'', CONVERT(VARCHAR(MAX), SES.Valor_Campos_Dinamicos), 5) + 12))
                ELSE
                    ''TIEMPOTAREA''
            END AS Cmp_Prioridad
        FROM TBSEGUIMIENTO_SOLICITUD AS SES
        
        INNER JOIN DBO.TBACTIVE_DIRECTORY AS AD 
        ON SES.Responsable = AD.SamAccountName  
    
        LEFT JOIN DBO.TBACTIVE_DIRECTORY AS AD1
        ON SES.Solicitante = AD1.SamAccountName
        
        LEFT JOIN DBO.TBACTIVE_DIRECTORY AS AD2
        ON '+ '''' +@usuarioSolicitante +'''' +' = AD2.SamAccountName 

        WHERE 1 = 1'
     
     
    IF @FechaIni <> '' 
        SET @NSql = @NSql + ' AND SES.FechaAsignacion >= ' + '''' + CAST(@FechaIni AS VARCHAR(50)) + ''''
    IF @FechaFin <> '' 
        SET @NSql = @NSql + ' AND SES.FechaAsignacion <= ' + '''' + CAST(@FechaFin AS VARCHAR(50))  + ''''
    IF @Estado <> 0  
        SET @NSql = @NSql + ' AND SES.Estado = ' + CAST(@Estado AS VARCHAR(2))
    IF @Asignado <> ''
        SET @NSql = @NSql + ' AND SES.Responsable = ' + '''' + @Asignado + ''''
    IF @Area <> ''
        SET @NSql = @NSql + ' AND SES.Area_Creador = ' + '''' + @Area + ''''
    IF replace(@Creador,'''','') <> ''
        SET @NSql = @NSql + ' AND SES.solicitante in ('+ @Creador + ')'
    IF @TipoSolicitud   <> '0' and @TipoSolicitud   <> ''
       SET @NSql = @NSql + ' AND SES.Fk_TipoSolicitud IN (SELECT IdTipoSolicitud FROM TBSEGUIMIENTO_TIPOSOLICITUD WHERE IdTipoSolicitud = ''' + @TipoSolicitud + ''')'
    IF @Prioridad <> 0 
       SET @NSql = @NSql + ' AND SES.Prioridad = ' + CAST(@Prioridad AS VARCHAR(2))
    IF @IdSolicitud <> '0'
        SET @NSql = @NSql + ' AND SES.Numero_Solicitud LIKE  ''%' + @IdSolicitud + '%'''
    IF @Asunto <> ''
       SET @NSql = @NSql + ' AND SES.Descripcion LIKE  ''%' + @Asunto + '%'''
    IF @IdEmpresa <> 0 
       SET @NSql = @NSql + ' AND AD1.IdCompany = ' + CAST(@IdEmpresa AS VARCHAR(2))
    IF @EstadoUsuario IS NOT NULL
        SET @NSql = @NSql + ' AND AD1.IsActiveAccount = ' + CAST(@EstadoUsuario AS VARCHAR(2))
    IF @usuarioSolicitante IS NOT  NULL
        SET @NSql = @NSql + ' AND ('+ '''' +@usuarioSolicitante + '''' + ' = SES.solicitante  or '
            + '''' +@usuarioSolicitante+ '''' +'= SES.Responsable or '+ '''' +@CorreoUsuarioSolicitante 
            + '''' +' in (SES.correo_notificacion_adicional) or AD2.department like ''%auditoria%''   or AD2.department like ''%contraloria%''  or AD2.department like ''%tecnologia%'' or AD2.department like ''%desarrollo%'' or AD2.department like ''%sistemas%'')' 
    PRINT @NSql
    
    --select 'buuuu'+cast(@NSql as varchar(max))as aja
    
    
    
    INSERT INTO #TMPANSSEGUIMIENTO 
    EXECUTE  Sp_ExecuteSql @NSql
    
    
      

    -- Actualizacion acuerdos de servicio
    DECLARE CurPrioridad CURSOR FOR 

        SELECT
            DISTINCT Cmp_Prioridad 
        FROM #TMPANSSEGUIMIENTO
      

    OPEN CurPrioridad

        FETCH NEXT FROM CurPrioridad 
        INTO @Priority


        WHILE @@Fetch_Status = 0 BEGIN

            SELECT @NSql = ' 
                UPDATE #TMPANSSEGUIMIENTO
                SET Ans = ' + @priority + ' 
                FROM #TMPANSSEGUIMIENTO
                
                JOIN TBSEGUIMIENTO_TIPOSOLICITUD
                ON Fk_TipoSolicitud = TBSEGUIMIENTO_TIPOSOLICITUD.IdTipoSolicitud
                
                WHERE Cmp_Prioridad = '  + CHAR(39) + @Priority  + CHAR(39) 

            EXECUTE Sp_ExecuteSql @NSql

            FETCH NEXT FROM CurPrioridad 
            INTO @Priority
            
        END

    CLOSE CurPrioridad
    
    DEALLOCATE CurPrioridad


    SET NOCOUNT OFF

    SELECT
        ABUELO.IdTipoSolicitud AS Abuelo_Id,
        Padre_Id,
        Hijo_Id,
        ISNULL(ABUELO.NombreTipoSolicitud, '') + ' - ' + ISNULL(Padre_Nombre, '') + ' -' + ISNULL(Hijo_Nombre, '') AS NomTipologia
    INTO #TMPNOMTIPOLOGIA
    FROM (
        SELECT
            PADRE.IdTipoSolicitud AS Padre_Id,
            PADRE.NombreTipoSolicitud AS Padre_Nombre,
            PADRE.IdTipoSol_Padre AS Padre_IdTipoSol_Padre,
            HIJO.IdTipoSolicitud AS Hijo_Id,
            HIJO.NombreTipoSolicitud AS Hijo_Nombre,
            HIJO.IdTipoSolicitud,
            HIJO.Mail_Notifica AS Notifica_A,
            HIJO.Sigla_Tipo_Sol AS Sigla,
            HIJO.UnidadDeMedida AS UnidadMedidaTiempo,
            ISNULL(HIJO.Prioridad_Urgente, 0) AS Tiempo_Urgente, 
            ISNULL(HIJO.Prioridad_Alta, 0) AS Tiempo_Alta, 
            ISNULL(HIJO.Prioridad_Media, 0) AS Tiempo_Media,
            ISNULL( HIJO.Prioridad_Baja, 0) AS Tiempo_Baja
        FROM DBO.TBSEGUIMIENTO_TIPOSOLICITUD AS HIJO 
        
        LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD AS PADRE
        ON HIJO.IdTipoSol_Padre = PADRE.IdTipoSolicitud 
    ) AS PADRE_HIJO 
        
    LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD AS ABUELO
    ON PADRE_HIJO.Padre_IdTipoSol_Padre = ABUELO.IdTipoSolicitud 
    
    WHERE Hijo_Id NOT IN (
        SELECT
            IdTipoSol_Padre
        FROM TBSEGUIMIENTO_TIPOSOLICITUD
    )


    SELECT
        IdSolicitud,
        Asunto,
        Descripcion,
        CONVERT(VARCHAR(50),FechaAsignacion, 121) AS FechaAsignacion,
        CONVERT(VARCHAR(50),FechaCreacion,121) AS FechaCreacion,
        CASE
            WHEN FechaCierre IS NULL THEN
                CONVERT(VARCHAR(50), ISNULL(FechaFinalizacion, DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaAsignacion,Ans,TBSEGUIMIENTO_TIPOSOLICITUD.UnidadDeMedida)), 121) 
            ELSE
                FechaCierre
        END AS FechaFinalizacion,
        Prioridad,
        #TMPANSSEGUIMIENTO.Responsable AS Responsable,
        #TMPANSSEGUIMIENTO.Solicitante AS Solicitante,
        Fk_TipoSolicitud,
        Creador,
        #TMPANSSEGUIMIENTO.Estado,
        SUBSTRING(Cmp_Prioridad, 11, 30) + ' ( ' + CAST(TBSEGUIMIENTO_PRIORIDADSOLICITUD.Nombre AS VARCHAR(2)) + ' ) '  AS [N Prioridad],
        NomTipologia AS [N TipoSolicitud],
        TBSEGUIMIENTO_ESTADOSOLICITUD.Nombre AS [N Estado],
        Numero_Solicitud AS NumSol,
        TBSEGUIMIENTO_ESTADOSOLICITUD.ColorFondo AS [ColorFondoEstado],
        dbo.tbSeguimiento_Empresa.nombre as empresasolicitante
    FROM #TMPANSSEGUIMIENTO WITH(NOLOCK)  

    INNER JOIN TBSEGUIMIENTO_TIPOSOLICITUD
    ON #TMPANSSEGUIMIENTO.Fk_TipoSolicitud = TBSEGUIMIENTO_TIPOSOLICITUD.IdTipoSolicitud 

    INNER JOIN DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD
    ON #TMPANSSEGUIMIENTO.Prioridad = DBO.TBSEGUIMIENTO_PRIORIDADSOLICITUD.IdPrioridad 

    INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD
    ON #TMPANSSEGUIMIENTO.Estado = TBSEGUIMIENTO_ESTADOSOLICITUD.IdSol  
    
    INNER JOIN #TMPNOMTIPOLOGIA
    ON Fk_TipoSolicitud = Hijo_Id
    
    INNER JOIN dbo.tbSeguimiento_relTipoSol_Empresa 
        ON Fk_TipoSolicitud = tbSeguimiento_relTipoSol_Empresa.IDTIPOSOL
    INNER JOIN dbo.tbSeguimiento_Empresa 
        ON tbSeguimiento_relTipoSol_Empresa.idEmpresa = dbo.tbSeguimiento_Empresa.id_Empresa
    
    ORDER BY IdSolicitud DESC
    
    
   ----------------------------------------------------------------------------------------------
   



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ReporteSolicitudGeneral]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--- CASA DE BOLSA - ISABEL ANDREA NAGLES
--- Fecha: 20141110
--- exec paSeguimiento_ReporteSolicitudGeneral @FechaIni='',@FechaFin='',@Estado=0,@Asignado='',@TipoSolicitud='',@Prioridad=0,@IdSolicitud='0',@Asunto='',@Creador='''inagles'',''''',@Area=''



CREATE PROCEDURE [dbo].[paSeguimiento_ReporteSolicitudGeneral]
    @FechaIni VARCHAR(50),
    @FechaFin VARCHAR(50),
    @Estado INT, 
    @Asignado VARCHAR(50),
    @TipoSolicitud VARCHAR(200),
    @Prioridad INT,
    @IdSolicitud VARCHAR(50),
    @Asunto VARCHAR(250), 
    @Creador VARCHAR(250),
    @Area VARCHAR(50)
AS

    DECLARE @Priority AS NVARCHAR(80)
    DECLARE @Ans INT
    DECLARE @NSql NVARCHAR(4000)
    DECLARE @Creador1 VARCHAR(250)
    
    IF @CREADOR <> ''''''
    BEGIN 
        SELECT   @CREADOR1 = LTRIM(RTRIM(LEFT(REPLACE (@CREADOR,',',''),LEN(LTRIM(RTRIM(@CREADOR))) - 3))) 
		SELECT   @CREADOR1 = REPLACE(@CREADOR1,'''','')
	END
	ELSE
	SELECT   @CREADOR1 = ''
    
--    IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TMPREPORTEGENERAL]') AND type in (N'U'))
--DROP TABLE [dbo].[TMPREPORTEGENERAL]

TRUNCATE TABLE  DBO.TMPREPORTEGENERAL  
    
-- Pobla la tabla a exportar en Excel 
 INSERT  INTO DBO.TMPREPORTEGENERAL
 SELECT
    CIA.NOMBRE  Empresa,
    UPPER(TS2.NombreTipoSolicitud) Nivel1,UPPER(TS1.NombreTipoSolicitud) Nivel2,  UPPER(ts.NombreTipoSolicitud) Nivel3,
    Numero_solicitud, 
    REPLACE( REPLACE( REPLACE(REPLACE(ISNULL(LOWER(descripcion), ''),'',''),CHAR(9),''),CHAR(10),''),CHAR(13),'') Descripcion,
    valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Criticidad)[1]','VARCHAR(20)') 'Criticidad',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Motivo)[1]','VARCHAR(100)'),'') 'Motivo',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Solucion)[1]','VARCHAR(100)'),'') 'Tipo_Solucion',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Caso_Proveedor)[1]','VARCHAR(100)'),'') 'Caso_Proveedor',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/MCES)[1]','VARCHAR(20)'),'') 'MCES',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Desarrollo)[1]','VARCHAR(40)'),'') 'Tipo_Desarrollo',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Avance)[1]','VARCHAR(20)'),'') 'Avance',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Entrega)[1]','VARCHAR(20)'),'') 'Entrega_Desarrollo',
    ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Control_de_Cambios)[1]','VARCHAR(20)'),'') 'Control_de_Cambios',
    ISNULL( (select name from tbActive_Directory where sAMAccountName= creador ), creador) 'Nombre_Creador' ,
    fechaCreacion Fecha_Creacion, UPPER(ES.Nombre) 'Estado' , 
    CASE WHEN (SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD ) IS NULL THEN  S.fechaCreacion
		 WHEN	(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO )) IS NULL THEN 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  ) 
		 ELSE 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO ))
        END  Fecha_Estado,
     LTRIM(RTRIM(r.nombre)) + ' ' + LTRIM(rtrim(r.Apellido )) Nombre_responsable, 
     fechaCierre Fecha_Cierre,
     ISNULL((select department from tbActive_Directory where sAMAccountName= creador ), '') 'Area' ,
     Solicitante,
     ISNULL((select displayName from tbActive_Directory where sAMAccountName= solicitante ),'') 'Nombre_Solicitante' ,
     (select title from tbActive_Directory where sAMAccountName= creador ) 'Cargo' ,
     [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,fechaCreacion) , 112), convert(varchar, GETDATE()-1, 112)) Dias_Creacion,     
	CASE WHEN  ES.cierra_solicitud  = 1 THEN 0  
		 ELSE CASE WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
	  'Urgente' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD))  <> 'NUEVO DESARROLLO'  THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) , 112), convert(varchar, GETDATE()-1, 112)) 
		ELSE CASE WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Alta' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar,  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_alta,Ts.unidaddeMedida)  ) , 112), convert(varchar, GETDATE()-1, 112))
		ELSE CASE WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Media' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_media,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE CASE WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			'Baja' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN 
		 [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE CASE WHEN   LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 0 then 999999   
		 ELSE CASE WHEN    LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 1 then
		     [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)'), 112), convert(varchar, GETDATE()-1, 112))
		ELSE  0 
		 --ELSE  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
			END END END END END END END 'Dias_incumplimiento',
        REPLACE( REPLACE(REPLACE(isnull((Select top 1 descripcion from tbSeguimiento_Seguimiento WHERE fk_Solicitud = s.idsolicitud and idseguimiento = (select MAX(idseguimiento) from tbSeguimiento_Seguimiento WHERE 
	 fk_Solicitud = s.idsolicitud)),''),CHAR(9),''),CHAR(10),''),CHAR(13),'')  'Ultimo_Seguimiento',
         ISNULL((select displayName from tbActive_Directory where sAMAccountName= REPLACE( REPLACE(REPLACE(isnull((Select top 1 usuario from tbSeguimiento_Seguimiento WHERE fk_Solicitud = s.idsolicitud and idseguimiento = (select MAX(idseguimiento) from tbSeguimiento_Seguimiento WHERE 
	 fk_Solicitud = s.idsolicitud)),''),CHAR(9),''),CHAR(10),''),CHAR(13),'') ),'') 'Usuario_USeguimiento',
      (Select top 1 FECHASEGUIMIENTO  from tbSeguimiento_Seguimiento WHERE fk_Solicitud = s.idsolicitud and idseguimiento = (select MAX(idseguimiento) from tbSeguimiento_Seguimiento WHERE 
     fk_Solicitud = s.idsolicitud))  'Fecha_USeguimiento'
     --INTO dbo.TMPREPORTEGENERAL
FROM DBO.TBSEGUIMIENTO_SOLICITUD S
INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD ES ON S.ESTADO = ES.IDSOL
INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS   ON S.FK_TIPOSOLICITUD = TS.IDTIPOSOLICITUD
LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS1   ON TS.IDTIPOSOL_PADRE = TS1.IDTIPOSOLICITUD
LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS2   ON TS1.IDTIPOSOL_PADRE = TS2.IDTIPOSOLICITUD
LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE R       ON RESPONSABLE  = USUARIONT 
LEFT JOIN DBO.TBSEGUIMIENTO_RELTIPOSOL_EMPRESA    AS C  ON S.FK_TIPOSOLICITUD  = C.IDTIPOSOL 
LEFT JOIN DBO.TBSEGUIMIENTO_EMPRESA   AS CIA  ON C.IDEMPRESA  = CIA.ID_EMPRESA  
WHERE 
    s.FechaAsignacion  >= CASE WHEN @FechaIni<> ''		THEN @FechaIni ELSE s.FechaAsignacion  END  
and s.FechaAsignacion  <= CASE WHEN @FechaFin <> ''		THEN @FechaFin ELSE s.FechaAsignacion  END  
and s.Estado			= CASE WHEN @Estado <> ''		THEN @Estado ELSE s.Estado  END  
and s.Responsable		= CASE WHEN @Asignado <> ''		THEN @Asignado ELSE s.Responsable  END  
and s.Area_Creador		= CASE WHEN @Area <> ''			THEN @Area ELSE s.Area_Creador  END  
and s.solicitante		= CASE WHEN @Creador1 <> ''		THEN @Creador1 ELSE s.solicitante  END  
and s.Fk_TipoSolicitud  = CASE WHEN @TipoSolicitud  <> '' and @TipoSolicitud   <> '0' THEN @TipoSolicitud  ELSE s.Fk_TipoSolicitud  END  
and s.Prioridad			= CASE WHEN @Prioridad  <> '0'	THEN @Prioridad  ELSE s.Prioridad  END  
and  s.Numero_Solicitud like 
CASE WHEN @IDSOLICITUD  = '' THEN   S.NUMERO_SOLICITUD
     WHEN @IDSOLICITUD  ='0' THEN S.NUMERO_SOLICITUD
     ELSE '%'+ @IDSOLICITUD +'%' END  

-- Nombre archivo Excel    
 DECLARE    @strNomArchivo AS VARCHAR(50)
 
 
 SET @strNomArchivo = '\\DBVDO01\A2\REPORTEHD_' +  convert(varchar,getdate(),112) + '.XLS'


---Consulta del  Excel que genera la aplicacion

    SET @NSql = 'SELECT ''EL ARCHIVO GENERADO ES ' + LTRIM(rtrim( @strNomArchivo))  + ''' numero_solicitud,'''' descripcion,'''' Tipo_Desarrollo,'''' Area ,
     '''' Nivel1,  ''''  Nivel2,    ''''  Nivel3,''''  Criticidad,''''  Fecha_Entrega,''''  Avance,''''  Nombre_Creador ,
     ''''  fechaCreacion,    '''' Estado ,  ''''  Nombre_responsable,''''  fechaCierre,      ''''   Solicitante,
     ''''  Nombre_Solicitante ,   ''''  Cargo , ''''  Ubicacion, ''''  Ultimo_Seguimiento,''''  Fecha_Estado '
    
   
    EXECUTE  Sp_ExecuteSql @NSql
    



GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteUsuarioByEstado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	Nombre	:	dbo.PaSeguimiento_ReporteEstadoByFecha
	Fecha	:	27 DE JUNIO DE 2012
	Autor	:	ANDRES VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados
	
	2 Autor:	
	  Fecha:	
	  Descripcion: 
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteUsuarioByEstado]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@IDEMPRESA INT
AS
BEGIN
	
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT FECHA , RESPONSABLE ,' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(		
		SELECT  CONVERT(VARCHAR(15), FECHACREACION, 101 ) AS FECHA , RESPONSABLE , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
		INNER JOIN DBO.tbActive_Directory A ON S.creador = A.sAMAccountName
		WHERE AREA_CREADOR != '''' 
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
		GROUP BY CONVERT(VARCHAR(15), FECHACREACION, 101 ) , RESPONSABLE, E.NOMBRE
	) AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	)AS PIVOTTABLE ORDER BY 1'
	
	EXEC sp_executesql @sql

END



GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteUsuarioByEstadoConsolidado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	:	PaSeguimiento_ReporteUsuarioByEstadoConsolidado
	Fecha	:	27 DE JUNIO DE 2012
	Autor	:	ANDRES VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados
	
	2 Autor:	
	  Fecha:	
	  Descripcion: 
	  
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteUsuarioByEstadoConsolidado]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@IDEMPRESA INT
AS
BEGIN
	
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT RESPONSABLE,' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(		
		SELECT  RESPONSABLE , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD 
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL 
		INNER JOIN DBO.tbActive_Directory A ON S.creador=A.sAMAccountName
		WHERE AREA_CREADOR != '''' 
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
		GROUP BY  RESPONSABLE, E.NOMBRE
	) AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	)AS PIVOTTABLE ORDER BY 1'
	
	EXEC sp_executesql @sql

END


GO
/****** Object:  StoredProcedure [dbo].[PaSeguimiento_ReporteUsuarioByEstadoVencidas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	:	dbo.PaSeguimiento_ReporteUsuarioByEstadoVencidas
	Fecha	:	27 DE JUNIO DE 2012
	Autor	:	ANDRES VARGAS SQDM
	
	Descripcion:
	
	Modificaciones:
	1 Autor:	RONALD R. GONZALEZ E.
	  Fecha:	03 de OCTUBRE de 2012
	  Descripcion:	Se modifica por cambio en los estados
	
	2 Autor:	
	  Fecha:	
	  Descripcion:
	  
*/
CREATE PROCEDURE [dbo].[PaSeguimiento_ReporteUsuarioByEstadoVencidas]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@IDEMPRESA INT
AS
BEGIN
	
	DECLARE @sql AS nvarchar(MAX)
	DECLARE @CAMPOS AS NVARCHAR(MAX)
	DECLARE @TOTAL AS NVARCHAR(MAX)
	DECLARE @CAMPOSPVT AS NVARCHAR(MAX)
	
	SET @CAMPOS = DBO.fnCampos_ESTADOSOLICITUD_Pivot('C')
	SET @CAMPOSPVT = DBO.fnCampos_ESTADOSOLICITUD_Pivot('P')
	SET @TOTAL = DBO.fnCampos_ESTADOSOLICITUD_Pivot('S')
	
	SET @sql = N'SELECT RESPONSABLE,' + @CAMPOS
		+',('+@TOTAL+') AS TOTAL
	FROM 
	(
		SELECT RESPONSABLE , E.NOMBRE AS ESTADO , COUNT(0) CANTIDAD  
		FROM DBO.TBSEGUIMIENTO_SOLICITUD S
		LEFT JOIN 
			(	SELECT  MAX(FACHAFINAL) AS FECHA_FINAL , FK_SOLICITUD AS SOLICITUD 
				FROM DBO.TBSEGUIMIENTO_SEGUIMIENTO
				GROUP BY FK_SOLICITUD
			) AS SE ON S.IDSOLICITUD = SE.SOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD T ON S.FK_TIPOSOLICITUD = T.IDTIPOSOLICITUD
		INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E ON S.ESTADO = E.IDSOL
		INNER JOIN DBO.tbActive_Directory A ON S.creador=A.sAMAccountName 
		WHERE 
			((ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA,UNIDADDEMEDIDA)) < GETDATE() AND E.NOMBRE != ''Finalizado'')
			OR (E.NOMBRE = ''Finalizado'' AND SE.FECHA_FINAL > ISNULL(FECHAFINALIZACION,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,TIEMPOTAREA,UNIDADDEMEDIDA))))
			AND FECHACREACION >= '''+CAST(@FECHA_INI AS NVARCHAR)+''' 
			AND FECHACREACION <= '''+CAST(@FECHA_FIN AS NVARCHAR)+''' 
			AND A.idcompany = '+CAST(@IDEMPRESA AS NVARCHAR)+'
		GROUP BY  RESPONSABLE, E.NOMBRE
	 ) AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ('+@CAMPOSPVT+',[TOTAL])
	)AS PIVOTTABLE ORDER BY 1'
	
	EXEC sp_executesql @sql

END


GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_ValidarRegla]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: paSeguimiento_ValidarRegla
	Autor:	Yoany Gomez Zapata
	Fecha:	28 de Septiembre 2010

	Descripcion: 

	Modificaciones:
	Autor:					Fecha:
	Descripcion:
*/
CREATE PROCEDURE [dbo].[paSeguimiento_ValidarRegla]
@IDSOLICITUD INT,	
@REGLA VARCHAR(500)
AS
BEGIN
	--SET @IDSOLICITUD = 1
	--SET @REGLA = 'DESCRIPCION = ''prueba de yoany'''

	DECLARE @SQL VARCHAR(5000)
	SET @SQL = ''
	SET @SQL = @SQL + 'SELECT IDSOLICITUD FROM dbo.tbSeguimiento_Solicitud '
	SET @SQL = @SQL + 'WHERE IDSOLICITUD =' + CONVERT(VARCHAR(50),@IDSOLICITUD) + ' AND ' + @REGLA

	--PRINT @SQL
	EXEC(@SQL)
END



GO
/****** Object:  StoredProcedure [dbo].[paSeguimiento_XmlCamposDinamicosSolicitud]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 25 de abril de 2011
-- Description:	Consulta XML campos dinamicos por solicitud
-- EXEC paSeguimiento_XmlCamposDinamicosSolicitud 1884
-- =============================================
create PROCEDURE [dbo].[paSeguimiento_XmlCamposDinamicosSolicitud] 
@idsolicitud int
AS

BEGIN
	SET NOCOUNT ON;
	SELECT VALOR_CAMPOS_DINAMICOS FROM TBSEGUIMIENTO_SOLICITUD
	WHERE IDSOLICITUD=@IDSOLICITUD
END

GO
/****** Object:  StoredProcedure [dbo].[proc_generate_excel_with_columns]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[proc_generate_excel_with_columns]
(
    @db_name    varchar(100),
    @table_name varchar(100),   
    @file_name  varchar(100)
)
as

--Generate column names as a recordset
declare @columns varchar(8000), @sql varchar(8000), @data_file varchar(100)
select 
    @columns=coalesce(@columns+',','')+column_name+' as '+column_name 
from 
    information_schema.columns
where 
    table_name=@table_name
select @columns=''''''+replace(replace(@columns,' as ',''''' as '),',',',''''')

--Create a dummy file to have actual data
select @data_file=substring(@file_name,1,len(@file_name)-charindex('\',reverse(@file_name)))+'\data_file.xls'
--print @data_file
--Generate column names in the passed EXCEL file
set @sql='exec master..xp_cmdshell ''bcp " select * from (select '+@columns+') as t" queryout "'+@file_name+'" -c -T'''
--print(@sql)
exec(@sql)

--Generate data in the dummy file
set @sql='exec master..xp_cmdshell ''bcp "select * from '+@db_name+'..'+@table_name+'" queryout "'+@data_file+'" -c -T'''
--print(@sql)
exec(@sql)

--Copy dummy file to passed EXCEL file
set @sql= 'exec master..xp_cmdshell ''type '+@data_file+' >> "'+@file_name+'"'''
exec(@sql)

--Delete dummy file 
set @sql= 'exec master..xp_cmdshell ''del '+@data_file+''''
exec(@sql)

GO
/****** Object:  StoredProcedure [dbo].[Script_resumenextractos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: DBO.paExtractos_ReporteExtractos
	Autor: Yoany Gomez Zapata
	Fecha:  03 de Octubre de 2011
	
	Descripcion : Permite generar el reporte de validacion de pruebas en la generacion de extractos
	
	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	
*/
CREATE PROCEDURE [dbo].[Script_resumenextractos]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME
AS
BEGIN
	SELECT 
		IDCLIENTE , SALDO, ISNULL([MVTO OPERACIONES A PLAZO],0) [OPERACIONES A PLAZO]
		,ISNULL([MVTO CONTABLE MENSUAL],0) [MOVIMIENTO]
		,ISNULL([PORTAFOLIO RENTA FIJA],0) [RENTA FIJA]
		,ISNULL([PORTAFOLIO ACCIONES],0) [ACCIONES]
		,ISNULL([NADA],0) [NADA]
		INTO #TEMP_CLIENTES
	FROM
	(

		SELECT DISTINCT C.IDCLIENTE AS IDCLIENTE, SALDO, ISNULL([TIPO REGISTRO],'NADA') AS ESTADO, COUNT(0) CANTIDAD 
		FROM DBOYD.DBO.TBLEXTRACTOS_CLIENTESPROCESAR C
		LEFT JOIN  DBOYD.DBO.TBLEXTRACTOS_PORTAFOLIO P ON  C.IDCLIENTE = P.[CODIGO CLIENTE]
		GROUP BY C.IDCLIENTE , SALDO , [TIPO REGISTRO]
	) 
	AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ([MVTO OPERACIONES A PLAZO],[MVTO CONTABLE MENSUAL],[PORTAFOLIO RENTA FIJA],[PORTAFOLIO ACCIONES],[NADA])
	)	AS PIVOTTABLE  ;

	SELECT 
		GETDATE() AS FECHA_PROCESO , @FECHA_INI AS FECHA_INICIAL , 
		@FECHA_FIN  AS  FECHA_FINAL , 0 AS MONTO_MINIMO, 
		200000000 AS MONTO_MAXIMO , IDCLIENTE ,CLI.STRNRODOCUMENTO AS DOCUMENTO,
		CLI.STRNOMBRE AS NOMBRE,  SALDO, R.STRNOMBRE AS [NOMBRE COMERCIAL],
		CASE  WHEN [OPERACIONES A PLAZO] > 0 THEN '1' ELSE '0' END  AS [OPERACIONES A PLAZO],
		CASE  WHEN [MOVIMIENTO] > 0 THEN '1' ELSE '0' END  AS [MOVIMIENTO],
		CASE  WHEN [RENTA FIJA] > 0 THEN '1' ELSE '0' END  AS [RENTA FIJA] ,
		CASE  WHEN [ACCIONES] > 0 THEN '1' ELSE '0' END  AS [ACCIONES],
		ISNULL(CLI.strEnviarInformeEconomico,0) AS [ENVIO CORREO], 
		CASE CLI.STRTIPOSEGMENTO WHEN 17 THEN 'VIP' ELSE '' END AS CLIENTE_VIP ,
		CASE (SELECT TOP 1 1 FROM  DBOYD.DBO.TBLCONCILIACIONCDB  WITH(NOLOCK) WHERE DOCUMENTO_OYD = CLI.STRNRODOCUMENTO AND CONVERT(VARCHAR(20), FECHA_CORTE, 101) = CONVERT(VARCHAR(20), @FECHA_FIN, 101) )
		WHEN 1 THEN '1' ELSE '0' END INCONSISTENCIAS 

	FROM #TEMP_CLIENTES
	INNER JOIN DBOYD.DBO.TBLCLIENTES CLI WITH(NOLOCK) ON  CLI.LNGID = #TEMP_CLIENTES.IDCLIENTE
	INNER JOIN  DBOYD.DBO.TBLCLIENTESRECEPTORES CR WITH(NOLOCK) ON CR.LNGIDCOMITENTE  = CLI.LNGID AND CR.LOGLIDER = 1
	INNER JOIN DBOYD.DBO.TBLRECEPTORES R WITH(NOLOCK) ON CR.STRIDRECEPTOR = R.STRID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_tarea_escalamiento_devueltosUsuarios]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_tarea_escalamiento_devueltosUsuarios]
as
-- Ejecucion exec sp_tarea_escalamiento_devueltosUsuarios
BEGIN
--select * from #TMPESCALA
--drop  table #TMPESCALA

SELECT
 CIA.NOMBRE  Empresa,
 ltrim(rtrim(TS2.NombreTipoSolicitud)) + '/'  + ltrim(rtrim( TS1.NombreTipoSolicitud )) + '/' + replace(ltrim(rtrim( ts.NombreTipoSolicitud)), '/',' O ') TipoSolicitud ,
 idsolicitud , 
 numero_solicitud, 
REPLACE( REPLACE( REPLACE(REPLACE(ISNULL( lower(descripcion), ''),'
',''),CHAR(9),''),CHAR(10),''),CHAR(13),'') descripcion,
 isnull((select department from tbActive_Directory where sAMAccountName= creador ), '') 'Area' ,
 TS2.NombreTipoSolicitud Nivel1,TS1.NombreTipoSolicitud Nivel2,  ts.NombreTipoSolicitud Nivel3,
 valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Criticidad)[1]','VARCHAR(20)') 'Criticidad',
 ISNULL(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Tipo_Desarrollo)[1]','VARCHAR(40)'),'') 'Tipo_Desarrollo',
 fechaCreacion,  
 lower(ES.Nombre) 'Estado' ,   
 responsable,    
 LTRIM(rtrim(ISNULL(r.nombre,''))) + ' ' + LTRIM(rtrim(ISNULL(r.Apellido,'') )) Nombre_responsable, 
 fechaCierre,  
  CASE	 WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
	  'Urgente' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD))  <> 'NUEVO DESARROLLO'  THEN  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) 
			 ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Alta' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_alta,Ts.unidaddeMedida)  )
			 ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Media' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN   convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_media,Ts.unidaddeMedida))
		 	ELSE  CASE WHEN   SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			'Baja' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN 
		 convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FECHAASIGNACION,Ts.prioridad_baja,Ts.unidaddeMedida))
		 ELSE  CASE WHEN  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 0 then GETDATE() -900   
		 ELSE  CASE WHEN   LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 1 then
		     valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')
			 --ELSE  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		END END END END END END   Fechalimite,
Solicitante,
(select displayName from tbActive_Directory where sAMAccountName= Solicitante  ) 'Nombre_Solicitante' ,
(select title from tbActive_Directory where sAMAccountName= creador ) 'Cargo' ,
	CASE WHEN  ES.cierra_solicitud  = 1 THEN 0 
		ELSE CASE	 WHEN    SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
	  'Urgente' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD))  <> 'NUEVO DESARROLLO'  THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.Prioridad_urgente,Ts.unidaddeMedida) ) , 112), convert(varchar, GETDATE()-1, 112)) 
		ELSE  CASE WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Alta' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar,  convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_alta,Ts.unidaddeMedida)  ) , 112), convert(varchar, GETDATE()-1, 112))
		ELSE  CASE WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			  'Media' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_media,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE  CASE 	 WHEN  SUBSTRING(CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12,
               CHARINDEX('</CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) - ( CHARINDEX('<CRITICIDAD>', CONVERT(VARCHAR(MAX), s.Valor_Campos_Dinamicos), 5) + 12))=
			'Baja' AND  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) <> 'NUEVO DESARROLLO' THEN 
		 [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 ELSE  CASE WHEN LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 0 then 999999   
		 ELSE  CASE WHEN  LTRIM(RTRIM(TS.NOMBRETIPOSOLICITUD)) =  'NUEVO DESARROLLO' and ISDATE(valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)')) = 1 then
		     [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, valor_campos_dinamicos.value('(/cdb/CamposDinamicos/Fecha_Finalizacion)[1]','VARCHAR(20)'), 112), convert(varchar, GETDATE()-1, 112))
		  ELSE  0 
		 --ELSE  [dbo].[fnSeguimiento_DiferenciaFechas] (convert(varchar, convert(datetime,DBO.FNSEGUIMIENTO_CALCULARTIEMPOSOL(FechaCreacion,Ts.prioridad_baja,Ts.unidaddeMedida)) , 112), convert(varchar, GETDATE()-1, 112))
		 END END END END END END END  'Dias_Incumplimiento',
ISNULL((Select top 1 descripcion from tbSeguimiento_Seguimiento WHERE idSeguimiento  = (select MAX(idSeguimiento) from tbSeguimiento_Seguimiento WHERE  fk_Solicitud = s.idsolicitud)),'')  'Ultimo_Seguimiento',
  CASE WHEN (SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD ) IS NULL THEN  S.fechaCreacion
		 WHEN	(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO )) IS NULL THEN 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  ) 
		 ELSE 
				(SELECT MIN(FECHASEGUIMIENTO) FROM  TBSEGUIMIENTO_SEGUIMIENTO   WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO = S.ESTADO  AND FECHASEGUIMIENTO >
				(SELECT MAX(FECHASEGUIMIENTO) FROM TBSEGUIMIENTO_SEGUIMIENTO WHERE FK_SOLICITUD = S.IDSOLICITUD  AND ESTADO <> S.ESTADO ))
        END   Fecha_Estado,
      (select displayName from tbActive_Directory where sAMAccountName= r.usuariont_superior ) 'Nombre_Superior' ,
    u.manager,
u.sAMAccountName,
u.Mail EMail_solicitante ,
J.Mail EMail_Superior 
INTO #TMPESCALA
FROM dbo.tbSeguimiento_Solicitud s
	INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD ES ON S.ESTADO = ES.IDSOL
	INNER JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS ON S.FK_TIPOSOLICITUD = TS.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS1 ON TS.IDTIPOSOL_PADRE = TS1.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_TIPOSOLICITUD TS2 ON TS1.IDTIPOSOL_PADRE = TS2.IDTIPOSOLICITUD
	LEFT JOIN DBO.TBSEGUIMIENTO_RESPONSABLE R ON RESPONSABLE  = USUARIONT 
	LEFT JOIN DBO.tbActive_Directory  AS u  ON u.sAMAccountName  = Solicitante
	LEFT JOIN DBO.tbActive_Directory  AS J  ON j.displayName  = u.manager --and  u.sAMAccountName  = Solicitante
	LEFT JOIN DBO.TBSEGUIMIENTO_RELTIPOSOL_EMPRESA    AS C  ON S.FK_TIPOSOLICITUD  = C.IDTIPOSOL 
	LEFT JOIN DBO.TBSEGUIMIENTO_EMPRESA   AS CIA  ON C.IDEMPRESA  = CIA.ID_EMPRESA  
 WHERE S.ESTADO NOT IN (9,8)
 --and C.IDEMPRESA = 2
 and u.manager is not null
 and s.estado in (2,--Devuelto a Usuario
 --7,--Pendiente cierre de usuario
 10,--PENDIENTE APROBACION COTIZACION
 12,--PRUEBAS DE USUARIO
 ----13,--Pendiente por Priorizar
 15)--PENDIENTE APROBACION DEL JEFE
 order by  u.manager, Solicitante 
 
 
 
Declare @idsuperior varchar(50)
Declare @email nvarchar(200)
Declare @emailcopia nvarchar(1000)

DECLARE cursorenviomail CURSOR FOR 
   SELECT distinct manager usuariont_superior,EMail_Superior correo_electronico,
    (SELECT EMail_solicitante+ ' ; '  FROM (select distinct EMail_solicitante,manager from #TMPESCALA) t2 
      WHERE t1.manager = t2.manager 
      FOR XML PATH('') ) AS Mail_Solicitantes 
   FROM #TMPESCALA t1
   where EMail_Superior is not null 


 OPEN cursorenviomail
FETCH NEXT FROM cursorenviomail 
 INTO @idsuperior,@email,@emailcopia
 
WHILE @@FETCH_STATUS = 0 
BEGIN 


SET DATEFORMAT YMD

Declare @strSql nvarchar(800)

Declare @strNomArchivo nvarchar(60)


DECLARE @Servidor nvarchar(20)

SET @Servidor ='localhost'


DECLARE @DESTINATARIOS NVARCHAR(100)
DECLARE @ENCOPIA NVARCHAR(100) 
DECLARE @tableHTML  NVARCHAR(MAX) 

SET DATEFORMAT YMD

SELECT @DESTINATARIOS = LTRIM(RTRIM(@EMAIL))
--SELECT @DESTINATARIOS ='carlos.jimenez@casadebolsa.com.co'
SELECT @ENCOPIA = @emailcopia
--print @ENCOPIA
SET @tableHTML =
    N'<H4>Apreciado Usuario: </H4>' +
    N'<H4>Es importante  su apoyo en la gestión a las solicitudes de su área, dado que estamos atentos a que sus colaboradores nos brinden la retroalimentación  solicitada en cada uno de los casos de la herramienta de Help Desk relacionados a continuación y de esta manera brindar una solución a los mismos.</H4>' +
    N'<H4>Recuerde que si trascurridos 5 días, no se recibe retroalimentación en el caso, este cambiara su estado a Pendiente cierre de Usuario. </H4>' +
    N'<H2>RELACION DE SOLICITUDES </H2>' +
	N'<table border="1">' +
    N'<th>Caso</th><th>TipoSolicitud</th><th>descripcion</th><th>Criticidad</th>' +
    N'<th>Solicitante</th><th>Estado</th><th>Ultimo_seguimiento</th>' +
    N'<th>Link</th></tr>' +
    CAST ( ( 
    SELECT td = ltrim(rtrim(numero_solicitud )),       '',
                    td = ltrim(rtrim(TipoSolicitud)), '',
                    td = ltrim(rtrim(descripcion)), '',
                    td = ltrim(rtrim(Criticidad)), '',
                    td = ltrim(rtrim(Nombre_Solicitante)), '',
                    td = ltrim(rtrim(Estado)), '',
                    td = ltrim(rtrim(replace(REPLACE(isnull(Ultimo_Seguimiento,'' ), CHAR(13),''),CHAR(10),''))), '',
                   --td = ' http://cfsrv01141/HelpDesk//EncuestaServicio.aspx?idsol='+   ltrim(rtrim(idsolicitud)) , '',
                    td = ' http://cfsrv01141/HelpDesk/RegistrarSolicitud.aspx?idsol='+   ltrim(rtrim(idsolicitud)) , ''
                    --td = wo.OrderQty, '',
                    --td = wo.DueDate, '',
                    --td = (p.ListPrice - p.StandardCost) * wo.OrderQty


 from #TMPESCALA
where manager = @idsuperior  

              FOR XML PATH('tr'), TYPE 
    ) AS NVARCHAR(MAX) ) +
    N'</table>' ;


EXEC msdb.dbo.sp_send_dbmail

@profile_name = 'HelpDeskProfile',

@subject='Mensaje Automatico del sistema - Escalamiento Diario de Solicitudes Help Desk ',

@recipients = @destinatarios,

--@copy_recipients = @ENCOPIA,

@body = @tableHTML ,

@body_format='HTML'



FETCH NEXT FROM cursorenviomail 
 INTO @idsuperior,@email,@emailcopia
END 
CLOSE cursorenviomail 
DEALLOCATE cursorenviomail 
END 

GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarCliente]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	: Operaciones.paOperaciones_ConsultarSaldosCarteras
	Fecha	: 28 de Septiembre de 2011
	Autor	: Yoany Gomez Zapata
	
	Descripcion	: Permite la consulta de los saldos de cartera para el envio via correo a los clientes
	
	Modificaciones :
	Autor	:						Fecha	:
	Descripcion	:	
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ConsultarCliente]
@DOCUMENTO varchar(50)
as
BEGIN
	SELECT 
	ISNULL(tblclientes.strEMail,'') AS CORREO , tblclientes.strEnviarInformeEconomico 
	FROM dbsafyr.dbo.TBLSUSCRIPTORES
	inner join dboydderivados.dbo.tblclientes on 
	TBLSUSCRIPTORES.VCHDOCID =
	CASE tblclientes.STRTIPOIDENTIFICACION 
	WHEN 'N' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9)) 
	WHEN 'R' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9))
	ELSE tblclientes.STRNRODOCUMENTO COLLATE SQL_Latin1_General_CP1_CI_AS END
	WHERE
	TBLSUSCRIPTORES.VCHDOCID = @DOCUMENTO
	and tblclientes.strEnviarInformeEconomico = '1'
END

GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarClientesByParams]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Operaciones.paOperaciones_ConsultarClientesByParams 'ygomez',''

/*
	Nombre: Operaciones.paOperaciones_ConsultarClientesByParams
	Autor:	Yoany Gomez Zapata
	Fecha:  06/02/2011
	
	Descripcion: Consulta de clientes area comrecial
	
	Modficaciones:
	Autor:					Fecha:
	Descripcion:
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ConsultarClientesByParams]
@SOLICITANTE VARCHAR(30), 
@IDCLIENTE VARCHAR(17)
AS
BEGIN

DECLARE @FILTROUSUARIO BIT
DECLARE @SQL VARCHAR(8000)

SET @FILTROUSUARIO = 0
SET @SQL = ''


IF  EXISTS (SELECT 1 FROM DBOYD.DBO.TBLCLIENTESRECEPTORES H INNER JOIN DBOYD.DBO.TBLUSUARIOSSUCURSALES S  ON H.STRIDRECEPTOR = S.STRIDRECEPTOR WHERE S.STRUSUARIOAPP = @SOLICITANTE )
BEGIN
	SET @FILTROUSUARIO = 1
END




SET @SQL = @SQL + 'SELECT DISTINCT C.LNGID, L.STRDESCRIPCION, C.STRNRODOCUMENTO, C.STRNOMBRE , '
SET @SQL = @SQL + 'CASE C.STRENVIARINFORMEECONOMICO '
SET @SQL = @SQL + 'WHEN 1 THEN ''AUTORIZADO'' ELSE ''NO AUTORIZADO'' END [ENVIO CORREO ELECTRONICO], '
SET @SQL = @SQL + 'CASE ISNULL(E.ID_SOL_EXCLUIDO,0) WHEN 0 THEN ''NO EXCLUIDO''  ELSE ''EXCLUIDO'' END [EXENTO COBRO ADMON] ,'
SET @SQL = @SQL + 'CASE ISNULL(C.STRTIPOSEGMENTO,0) WHEN 17 THEN ''SI''  ELSE ''NO'' END [ES VIP] '
SET @SQL = @SQL + 'FROM DBOYD.DBO.TBLCLIENTES C '
SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLCLIENTESRECEPTORES CR ON LTRIM(RTRIM(C.LNGID)) = LTRIM(RTRIM(CR.LNGIDCOMITENTE))  '
SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLRECEPTORES R ON LTRIM(RTRIM(CR.STRIDRECEPTOR)) = LTRIM(RTRIM(R.STRID))  AND R.LOGACTIVO = 1 '
SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLRECEPTORES R1 ON R.LNGIDMESA = R1.LNGIDMESA AND R1.LOGLIDERMESA = 1 '
SET @SQL = @SQL + 'INNER JOIN DBOYD.DBO.TBLLISTA  L ON  L.STRRETORNO = C.STRTIPOIDENTIFICACION AND L.STRTOPICO = ''TIPOID'' '
SET @SQL = @SQL + 'LEFT JOIN DBOYD.DBO.TBLCOBROPORTAFOLIO_EXCLUIDOS E ON LTRIM(RTRIM(E.IDCLIENTE)) = LTRIM(RTRIM(C.LNGID)) '
SET @SQL = @SQL + 'WHERE (1=1)'

IF @IDCLIENTE <> '' AND @FILTROUSUARIO = 1
	SET @SQL = @SQL + 'AND (R1.STRLOGIN = '''+ @SOLICITANTE + ''' AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' + @IDCLIENTE + ''') OR (R.STRLOGIN = ''' + @SOLICITANTE + ''' AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' +  @IDCLIENTE +''') '

IF @IDCLIENTE <> '' AND @FILTROUSUARIO = 0
	SET @SQL = @SQL + 'AND ltrim(rtrim(LNGIDCOMITENTE)) = ''' + @IDCLIENTE + ''''
	
IF @IDCLIENTE = '' AND @FILTROUSUARIO = 1
	SET @SQL = @SQL + 'AND (R1.STRLOGIN = ''' + @SOLICITANTE + ''') OR (R.STRLOGIN = ''' +  @SOLICITANTE + ''')'
	
	SET @SQL = @SQL + ' order by  4'

EXEC(@SQL)
END




GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarClienteVIP]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre	: Operaciones.[paOperaciones_ConsultarClienteVIP]
	Fecha	: 28 de Septiembre de 2011
	Autor	: Yoany Gomez Zapata
	
	Descripcion	: Permite la consulta de los saldos de cartera para el envio via correo a los clientes
	
	Modificaciones :
	Autor	:						Fecha	:
	Descripcion	:	
*/
create PROCEDURE [Operaciones].[paOperaciones_ConsultarClienteVIP]
@IDCLIENTE varchar(50)
as
BEGIN
	SELECT LNGID FROM dboyd.dbo.tblclientes
	WHERE ltrim(rtrim(lngID)) = ltrim(rtrim(@IDCLIENTE))
	and STRTIPOSEGMENTO = 17
END

GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarConciliacionByFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre	: Operaciones.[[paOperaciones_ConsultarConciliacionByFecha]]
	Fecha	: 28 de Septiembre de 2011
	Autor	: Yoany Gomez Zapata
	
	
	Modificaciones :
	Autor	:						Fecha	:
	Descripcion	:	
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ConsultarConciliacionByFecha]
@fecha_corte varchar(50)
as
BEGIN
	
DECLARE @PDTMHASTACONCILIACION DATETIME
IF EXISTS (SELECT ID FROM DBOYD.DBO.TBLDIASHABILESCDB WHERE FECHA = @fecha_corte)
	BEGIN
		SET @PDTMHASTACONCILIACION =  @fecha_corte
	END
	ELSE
	BEGIN
		SELECT @PDTMHASTACONCILIACION = MAX(FECHA) FROM DBOYD.DBO.TBLDIASHABILESCDB WHERE FECHA < @fecha_corte		
	END	
	
	SELECT TOP 1 * FROM DBOYD.DBO.TBLCONCILIACIONCDB
	WHERE FECHA_CORTE = @PDTMHASTACONCILIACION
END





GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarReposByFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	
	Nombre: Operaciones.paOperaciones_ConsultarReposByFecha 
	Autor:	Yoany Gomez Zapata
	Fecha:	28 de Enero 2010
	
	Descripcion: Permite la consulta de las operaciones repo realizadas a un corte diario
	
	Modificaciones:
	1.	Autor:							Fecha:
		Desecripcion:	
*/


CREATE PROCEDURE [Operaciones].[paOperaciones_ConsultarReposByFecha] 
AS
BEGIN
SET DATEFORMAT YMD

DECLARE @REPOS TABLE 
(
	LNGIDCOMITENTE CHAR(17),
	DTMLIQUIDACION	DATETIME,
	STRHORAGRABACION VARCHAR(8),
	DTMCUMPLIMIENTO_INICIO DATETIME,
	FECHA_REAL DATETIME, 
	USUARIO VARCHAR(20)
)

DECLARE @DATEREPO DATETIME
DECLARE @DATEULTIMA DATETIME
DECLARE @FECHA_PROCESO_FINAL DATETIME

SELECT @FECHA_PROCESO_FINAL = FECHA_PROCESO_REPO FROM OPERACIONES.PARAMETROS
SET @DATEREPO = DATEADD(DAY, 1, @FECHA_PROCESO_FINAL) 

INSERT INTO @REPOS
SELECT	RS.LNGIDCOMITENTE, T.DTMLIQUIDACION ,T.STRHORAGRABACION, RS.DTMCUMPLIMIENTO_INICIO , 
CAST(DATEPART(YEAR,T.DTMLIQUIDACION) AS VARCHAR(4)) + '-' + 
REPLICATE('0', (2-LEN(RTRIM(LTRIM(CAST(DATEPART(MONTH,T.DTMLIQUIDACION) AS VARCHAR(2))))))) + LTRIM(RTRIM(CAST(DATEPART(MONTH,T.DTMLIQUIDACION) AS VARCHAR(2)))) + '-' + 
REPLICATE('0', (2-LEN(RTRIM(LTRIM(CAST(DATEPART(DAY,T.DTMLIQUIDACION) AS VARCHAR(2))))))) + LTRIM(RTRIM(CAST(DATEPART(DAY,T.DTMLIQUIDACION) AS VARCHAR(2)))) + ' ' + 
T.STRHORAGRABACION + '.000' AS FECHA_REAL, S.STRUSUARIOAPP AS USUARIO
FROM DBOYD.DBO.FN_REPOS_Y_SIMULTANEAS_ACTIVAS (@DATEREPO) RS
INNER JOIN DBOYD.DBO.TBLCLIENTESRECEPTORES CR ON	RS.LNGIDCOMITENTE = CR.LNGIDCOMITENTE
INNER JOIN DBOYD.DBO.TBLRECEPTORES R ON	CR.STRIDRECEPTOR = R.STRID
INNER JOIN DBOYD.DBO.TBLESPECIES E ON E.STRID = RS.STRIDESPECIE
INNER JOIN DBOYD.DBO.TBLLIQUIDACIONES T ON RS.LNGID = T.LNGID AND RS.LNGPARCIAL = T.LNGPARCIAL AND RS.STRTIPO = T.STRTIPO AND RS.DTMLIQUIDACION = T.DTMLIQUIDACION
INNER JOIN dboyd.DBO.TBLUSUARIOSSUCURSALES S WITH(NOLOCK) ON S.STRIDRECEPTOR = CR.STRIDRECEPTOR
ORDER BY RS.DTMCUMPLIMIENTO_INICIO

SELECT @DATEULTIMA = MAX(FECHA_REAL) FROM @REPOS WHERE FECHA_REAL > @FECHA_PROCESO_FINAL

-- ACTUALIZANDO LA FECHA DE PROCESO
IF @DATEULTIMA IS NOT NULL
BEGIN
	UPDATE OPERACIONES.PARAMETROS  SET FECHA_PROCESO_REPO = @DATEULTIMA
END

SELECT * FROM @REPOS 
WHERE FECHA_REAL > @FECHA_PROCESO_FINAL 

END






GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ConsultarSaldosCarteras]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
      Nombre      :     Operaciones.paOperaciones_ConsultarSaldosCarteras
      Fecha :     14 de Abril de 2011
      Autor :     Yoany Gomez Zapata
      
      Descripcion :     Permite la consulta de los saldos de cartera para el envio via correo a los clientes
      
      Modificaciones    :
      Autor :                                  Fecha :
      Descripcion :     
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ConsultarSaldosCarteras]
AS
BEGIN
      
            SET DATEFORMAT ymd
      SELECT  
            TBLENCARGOS.INTENCARGO AS ENCARGO,
            TBLSUSCRIPTORES.VCHDOCID AS IDENTIFICACION,
            REPLACE( CASE TBLSUSCRIPTORES.CHRTIPO  
            WHEN 'N' THEN LTRIM(TBLSUSCRIPTORES.VCHAPELLIDO1) 
            + ' '  + LTRIM(TBLSUSCRIPTORES.VCHAPELLIDO2)
            + ' '  + LTRIM(TBLSUSCRIPTORES.VCHNOMBRE1) 
            + ' '  + LTRIM(TBLSUSCRIPTORES.VCHNOMBRE2)
            ELSE TBLSUSCRIPTORES.VCHRAZONSOCIAL  END, 'Ñ', 'N') NOMBRE,
            SUM(TBLENCARGOS.NUMVALORPESOS) AS SALDO,
            SUM(TBLENCARGOS.NUMUNIDADES) AS UNIDADES,
            --CONVERT(VARCHAR(15), GETDATE(),101)AS FECHA ,
            --GETDATE() 
            (SELECT MAX(datFechaAct) 
                        FROM DBSAFYR.dbo.tblPortafolioPorDias with(nolock) where vchCodigoPortafolio = TBLENCARGOS.VCHCODIGOPORTAFOLIO)
            AS FECHA , 
            ISNULL((
                  SELECT NUMVALORUNIDAD 
                  FROM  DBSAFYR.DBO.TBLHISTORICOUNIDAD 
                  WHERE VCHCODIGOPORTAFOLIO = TBLENCARGOS.VCHCODIGOPORTAFOLIO 
                  AND CONVERT(VARCHAR(15) , DATFECHAACT, 101) = CONVERT(VARCHAR(15) ,( 
                        SELECT MAX(datFechaAct) 
                        FROM DBSAFYR.dbo.tblPortafolioPorDias with(nolock) where vchCodigoPortafolio = TBLENCARGOS.VCHCODIGOPORTAFOLIO 
                  ), 101) 
            ),0)
            AS VLRUNIDAD, 
      --    'YGOMEZ@CASADEBOLSA.COM.CO' AS CORREO
            CASE ISNULL(tblclientes.strEMail,'') 
            WHEN '' THEN '' 
            ELSE tblclientes.strEMail + ';SaldosCC@casadebolsa.com.co' END AS CORREO
      FROM dbsafyr.dbo.TBLENCARGOS, dbsafyr.dbo.TBLSUSCRIPTORES ,dbsafyr.dbo.TBLCONFIGURACIONFONDOS, dboyd.dbo.tblclientes
      WHERE TBLENCARGOS.INTCODSUSCRIPTOR = TBLSUSCRIPTORES.INTCODSUSCRIPTOR 
      AND TBLENCARGOS.VCHCODIGOPORTAFOLIO=TBLCONFIGURACIONFONDOS.VCHCODIGOFONDO
      AND TBLENCARGOS.NUMVALORPESOS > 0
      --and TBLENCARGOS.INTENCARGO in (5423,3799)
      --AND ISNULL(TBLSUSCRIPTORES.VCHEMAIL,'') <> ''
      --AND   TBLENCARGOS.VCHCODIGOPORTAFOLIO ='OCCIVALOR' 
      AND  TBLENCARGOS.CHRESTADO NOT IN ('A') 
     
      --AND  TBLSUSCRIPTORES.VCHDOCID = 
      --CASE tblclientes.STRTIPOIDENTIFICACION 
      --WHEN 'N' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9)) 
      --WHEN 'R' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9))
      --ELSE tblclientes.STRNRODOCUMENTO COLLATE SQL_Latin1_General_CP1_CI_AS END
     
     and ltrim(rtrim(TBLSUSCRIPTORES.vchCodigoMigracion)) = ltrim(rtrim(tblclientes.lngID)) COLLATE SQL_Latin1_General_CP1_CI_AS 
     
      and tblclientes.strEnviarInformeEconomico = '1'
      and TBLENCARGOS.VCHCODIGOPORTAFOLIO not in ('VISTA_MULTIPLUS','MULTIPLUS','OCCIPREMIUM')
      GROUP BY    TBLENCARGOS.INTENCARGO, 
                        TBLSUSCRIPTORES.VCHDOCID, 
                        TBLSUSCRIPTORES.CHRTIPO,
                        TBLSUSCRIPTORES.VCHAPELLIDO1,
                        TBLSUSCRIPTORES.VCHNOMBRE1, 
                        TBLSUSCRIPTORES.VCHNOMBRE2, 
                        TBLSUSCRIPTORES.VCHAPELLIDO2,
                        TBLSUSCRIPTORES.VCHRAZONSOCIAL, 
                        TBLENCARGOS.INTCODSUSCRIPTOR,
                        TBLENCARGOS.VCHCODIGOPORTAFOLIO, 
                        tblclientes.strEMail
      ORDER BY TBLENCARGOS.INTCODSUSCRIPTOR  ASC
END


GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_GenerarExtractoCarteras]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: paOperaciones_GenerarExtractoCarteras
	Autor: Yoany Gomez Zapata
	Fecha 01/02/2011
	
	Descripcion: Permite obtener los datos para la generacion del extracto de safyr
	
	Modficaciones:
	Descripcion:
	Autor:				Fecha
	
*/


--exec Operaciones.paOperaciones_GenerarExtractoCarteras 'OCCIVALOR','2011-12-01 12:59:53','2011-12-31 12:59:53',5534,6365,'2012-01-29 00:00:00',0,0
--EXEC Operaciones.paOperaciones_GenerarExtractoCarteras 'OCCIVALOR','2012-02-01 00:00:00','2012-02-06 00:00:00',5374,6173 ,'2012-02-06 00:00:00',0,0

--drop table #TEMPENCABEZADO
--drop table #TEMPMOVIMIENTO
--
--DECLARE @PiePaginaExtracto TABLE
--(
--	SaldoInicial FLOAT NULL,
--	SaldoInicialUnidades FLOAT NULL,
--	Creditos FLOAT NULL,
--	CreditosUnidades FLOAT NULL,
--	Debitos FLOAT NULL,
--	DebitosUnidades FLOAT NULL,
--	Rendimientos FLOAT NULL,
--	RendimientosUnidades FLOAT NULL,
--	Retenciones FLOAT NULL,
--	RetencionesUnidades FLOAT NULL,
--	SaldoFinal FLOAT NULL,
--	SaldoFinalUnidades FLOAT NULL,
--	vchCodigoPortafoliodet VARCHAR(30),
--	intEncargodet INT
--)
--INSERT INTO @PiePaginaExtracto
--EXEC DBSAFYR.DBO.PiePaginaExtracto	'OCCIVALOR','2012-02-01 00:00:00','2012-02-06 00:00:00',5374
--
--
--SELECT * 
--INTO #TEMPENCABEZADO
--FROM OPERACIONES.VVIEWENCABEZADOEXTRACTO WITH(NOLOCK)
--WHERE VCHCODIGOPORTAFOLIO = 'OCCIVALOR'
--AND ( CAST([ENCARGO] AS BIGINT) = 5374) AND DATFECHAACT = '2012-02-06 00:00:00'
--AND ( CAST( [INTCODSUSCRIPTOR] AS BIGINT) = 6173)
--
--SELECT  VCHCODIGOPORTAFOLIO as VCHCODIGOPORTAFOLIOMOV ,INTENCARGO,DATFECHA,OPERACION ,CREDITO,DEBITO,UNIDADES,NUMVALORUNIDAD,SALDO 
--INTO #TEMPMOVIMIENTO
--FROM OPERACIONES.VIEWDETALLEMOVIMIENTOEXTRACTO  WITH(NOLOCK)
--WHERE  VCHCODIGOPORTAFOLIO = 'OCCIVALOR'  AND INTENCARGO =5374  
--AND DATFECHA BETWEEN  '2012-02-01 00:00:00' AND  '2012-02-06 00:00:00'
--	
--SELECT *
--into #tempResult
--FROM #TEMPENCABEZADO  --, Operaciones.vRevisoriaFondo , Operaciones.vDatosDefensor
--left join  #TEMPMOVIMIENTO on #TEMPENCABEZADO.Encargo = #TEMPMOVIMIENTO.intEncargo
--left join  @PiePaginaExtracto A on A.intEncargodet = #TEMPENCABEZADO.Encargo
----select * from #tempResult


CREATE PROCEDURE [Operaciones].[paOperaciones_GenerarExtractoCarteras]
	@PORTAFOLIO VARCHAR(15),
	@FECHA_INICIAL DATETIME,
	@FECHA_FINAL DATETIME,
	@ENCARGO INT,
	@INTCODSUSCRIPTOR INT, 
	@FECHA_ACT DATETIME,
	@VALORUNIDADINI FLOAT,  
	@VALORUNIDADFIN FLOAT
AS
BEGIN


SELECT @VALORUNIDADINI = numValorUnidad  
FROM   DBSAFYR.DBO.tblHistoricoUnidad  
WHERE vchCodigoPortafolio = @PORTAFOLIO
AND datFechaAct = @FECHA_INICIAL


SELECT @VALORUNIDADFIN = numValorUnidad  
FROM  DBSAFYR.DBO.tblHistoricoUnidad  
WHERE vchCodigoPortafolio = @PORTAFOLIO
AND datFechaAct = @FECHA_FINAL


--exec sp_executesql N' SELECT SUM(ISNULL(numValorComision,0) + ISNULL(numValorComisionExito,0)) Comision  ,SUM(numValorFondo)  ValorFondo  ,(DATEDIFF(DAY,@P1,@P2) + 1) Dias  ,(SELECT ISNULL(SUM(numValorDeGiro),0) numValorDeGiro FROM tblOperaciones,tblTipoOperaciones WHERE tblOperaciones.vchCodigoPortafolio=tblHistoricoUnidad.vchCodigoPortafolio  AND tblOperaciones.datFechaCuadre <= tblHistoricoUnidad.datFechaAct AND tblOperaciones.datFechaCumplimiento > tblHistoricoUnidad.datFechaAct AND tblOperaciones.chrEstado in (''C'') AND tblOperaciones.chrTipoOperacion=tblTipoOperaciones.chrTipoOpe and tblTipoOperaciones.vchTipoInv=01)  CXP  ,(SELECT ISNULL(SUM(numValorDeGiro),0) numValorDeGiro FROM tblOperaciones,tblTipoOperaciones WHERE tblOperaciones.vchCodigoPortafolio=tblHistoricoUnidad.vchCodigoPortafolio  AND tblOperaciones.datFechaCuadre <= tblHistoricoUnidad.datFechaAct AND tblOperaciones.datFechaCumplimiento > tblHistoricoUnidad.datFechaAct AND tblOperaciones.chrEstado in (''C'') AND tblOperaciones.chrTipoOperacion=tblTipoOperaciones.chrTipoOpe and tblTipoOperaciones.vchTipoInv=02) CXC  FROM tblhistoricoUnidad  WHERE vchCodigoPortafolio=''OCCIVALOR'' and datFechaAct BETWEEN @P3 AND @P4  GROUP BY vchCodigoPortafolio,datFechaAct 	',N'@P1 datetime,@P2 datetime,@P3 datetime,@P4 datetime','2011-12-01 00:00:00','2011-12-31 00:00:00','2011-12-01 00:00:00','2011-12-31 00:00:00'

DECLARE @PiePaginaExtracto TABLE
(
	SaldoInicial FLOAT NULL,
	SaldoInicialUnidades FLOAT NULL,
	Creditos FLOAT NULL,
	CreditosUnidades FLOAT NULL,
	Debitos FLOAT NULL,
	DebitosUnidades FLOAT NULL,
	Rendimientos FLOAT NULL,
	RendimientosUnidades FLOAT NULL,
	Retenciones FLOAT NULL,
	RetencionesUnidades FLOAT NULL,
	SaldoFinal FLOAT NULL,
	SaldoFinalUnidades FLOAT NULL,
	vchCodigoPortafolioPie VARCHAR(30),
	intEncargoPie INT
)
INSERT INTO @PiePaginaExtracto
EXEC DBSAFYR.DBO.PiePaginaExtracto	@PORTAFOLIO, @FECHA_INICIAL , @FECHA_FINAL , @ENCARGO


SELECT * 
INTO #TEMPENCABEZADO
FROM OPERACIONES.VVIEWENCABEZADOEXTRACTO WITH(NOLOCK)
WHERE VCHCODIGOPORTAFOLIO = @PORTAFOLIO
AND ( CAST([ENCARGO] AS BIGINT) = @ENCARGO) AND DATFECHAACT = @FECHA_FINAL
AND ( CAST( [INTCODSUSCRIPTOR] AS BIGINT) = @INTCODSUSCRIPTOR)
   
SELECT  VCHCODIGOPORTAFOLIO as  VCHCODIGOPORTAFOLIOMOD ,INTENCARGO,DATFECHA,OPERACION ,CREDITO,DEBITO,UNIDADES,NUMVALORUNIDAD,SALDO 
INTO #TEMPMOVIMIENTO
FROM OPERACIONES.VIEWDETALLEMOVIMIENTOEXTRACTO  WITH(NOLOCK)
WHERE  VCHCODIGOPORTAFOLIO = @PORTAFOLIO  AND INTENCARGO =@ENCARGO  
AND DATFECHA BETWEEN  @FECHA_INICIAL AND  @FECHA_FINAL   




	
SELECT @FECHA_INICIAL FECHAINI ,@FECHA_FINAL FECHAFIN, @VALORUNIDADINI VALORUNIDADINI , @VALORUNIDADFIN VALORUNIDADFIN, 
'' Observacion, DATEDIFF(DAY, @FECHA_INICIAL , @FECHA_FINAL) as NumDias, '' NotaSecundario,  (SELECT numComisionFija FROM DBSAFYR.DBO.tblConfiguracionFondos  WHERE vchCodigoFondo=@PORTAFOLIO) RemuneracionCobrada, * 
into #tempResult
FROM #TEMPENCABEZADO  --, Operaciones.vRevisoriaFondo , Operaciones.vDatosDefensor
left join  #TEMPMOVIMIENTO on #TEMPENCABEZADO.Encargo = #TEMPMOVIMIENTO.intEncargo
left join  @PiePaginaExtracto A on A.intEncargoPie = #TEMPENCABEZADO.Encargo

select * from #tempResult , Operaciones.vRevisoriaFondo , Operaciones.vDatosDefensor



END


GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_MovimientoExtractos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Operaciones].[paOperaciones_MovimientoExtractos]
@cartera varchar(50), 
@encargo int, 
@fechaIni datetime, 
@fechaFin datetime
AS
BEGIN
	SELECT  vchCodigoPortafolio,intEncargo,datFecha,Operacion  ,Credito,Debito,Unidades,numValorUnidad,Saldo 
	FROM Operaciones.viewDetalleMovimientoExtracto 
	WHERE  vchCodigoPortafolio = @cartera  AND intEncargo =@encargo  
	AND datFecha between  @fechaIni and @fechaFin ORDER BY datFecha
END


GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ReporteExtractosPruebas]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Nombre: DBO.paExtractos_ReporteExtractos
	Autor: Yoany Gomez Zapata
	Fecha:  03 de Octubre de 2011
	
	Descripcion : Permite generar el reporte de validacion de pruebas en la generacion de extractos
	
	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	
	EXEC [Operaciones].[paOperaciones_ReporteExtractosPruebas] '2011-12-31 00:00:00.000','2012-01-31 00:00:00.000',0,200000000
	
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ReporteExtractosPruebas]
@FECHA_INI DATETIME, 
@FECHA_FIN DATETIME,
@MONTOMINIMO INT , 
@MONTOMAXIMO INT 
AS
BEGIN


	SELECT [CODIGO CLIENTE] , [NRO DCTO CLIENTE]  ,  ESPECIE ,  I.STRISIN ,  SUM([CANTIDAD ACCIONES]) AS SALDO
	INTO #TEMP 
	FROM dboyd.DBO.TBLEXTRACTOS_PORTAFOLIO P
	INNER JOIN dboyd.dbo.TBLESPECIESISIN I ON P.ESPECIE = I.STRIDESPECIE
	WHERE --NOT ([TIPO REGISTRO] = 'MVTO OPERACIONES A PLAZO'  AND MERCADO = 'Simultanea Pasiva') 
	--AND 
	[TIPO REGISTRO] != 'MVTO CONTABLE MENSUAL'  
	GROUP BY  [CODIGO CLIENTE] ,   ESPECIE ,  [NRO DCTO CLIENTE] ,   I.STRISIN

	SELECT STRIDESPECIE , NROIDSOLICITANTE, I.STRISIN, SUM(SALDOTOTAL + SALDOREPOPASIVO) as SALDOTOTAL
	INTO #TEMP2 
	FROM dboyd.DBO.TBLDECEVAL_CDB E
	INNER JOIN dboyd.dbo.TBLESPECIESISIN I ON E.ISIN = I.STRISIN
	WHERE 
	FECHAFICHERO =  CONVERT(VARCHAR(20), @FECHA_FIN, 112)
	GROUP BY STRIDESPECIE,NROIDSOLICITANTE , I.STRISIN
	--UNION 
	--SELECT  I.STRIDESPECIE , LNGNRODOCOYD , (SELECT TOP 1 E.STRISIN FROM  dboyd.dbo.TBLESPECIESISIN E 
	--WHERE E.STRIDESPECIE = I.STRIDESPECIE )
	--, DBLCANTIDADFONDO  
	--FROM  
	--DBOYD.DBO.TBLCONCILIACIONTITULOSDCV I 


	SELECT [CODIGO CLIENTE],ESPECIE, SALDO AS SALDO_PORTAFOLIO , SUM(D.SALDOTOTAL) AS SALDO_DEPOSITO  
	INTO #TEMPFINAL
	FROM #TEMP P
	INNER JOIN #TEMP2 D ON D.NROIDSOLICITANTE = P.[NRO DCTO CLIENTE] AND P.ESPECIE = D.STRIDESPECIE  and  d.strISIN = p.strISIN
	GROUP BY [CODIGO CLIENTE],ESPECIE, SALDO
	
	SELECT * 
	INTO #TEMPFINAL1
	FROM 
	#TEMPFINAL WHERE  SALDO_PORTAFOLIO <> SALDO_DEPOSITO

	SELECT 
		IDCLIENTE , SALDO, ISNULL([MVTO OPERACIONES A PLAZO],0) [OPERACIONES A PLAZO]
		,ISNULL([MVTO CONTABLE MENSUAL],0) [MOVIMIENTO]
		,ISNULL([PORTAFOLIO RENTA FIJA],0) [RENTA FIJA]
		,ISNULL([PORTAFOLIO ACCIONES],0) [ACCIONES]
		,ISNULL([Repo Activo],0) [Repo Activo]
		,ISNULL([Repo Pasivo],0)  [Repo Pasivo]
		,ISNULL([Simultanea Activa],0) [Simultanea Activa]
		,ISNULL([Simultanea Pasiva],0)[Simultanea Pasiva]
		,ISNULL([NADA],0) [NADA]
		INTO #TEMP_CLIENTES
	FROM
	(

		SELECT DISTINCT C.IDCLIENTE AS IDCLIENTE, SALDO,CASE [TIPO REGISTRO] WHEN 'MVTO OPERACIONES A PLAZO' THEN Mercado
		ELSE ISNULL([TIPO REGISTRO],'NADA') END AS ESTADO, COUNT(0) CANTIDAD 
		FROM DBOYD.DBO.TBLEXTRACTOS_CLIENTESPROCESAR C
		LEFT JOIN  DBOYD.DBO.TBLEXTRACTOS_PORTAFOLIO P ON  C.IDCLIENTE = P.[CODIGO CLIENTE]
		GROUP BY C.IDCLIENTE , SALDO , [TIPO REGISTRO], Mercado
	) 
	AS S
	PIVOT
	(
		SUM(CANTIDAD)
		FOR ESTADO IN ([MVTO OPERACIONES A PLAZO],[MVTO CONTABLE MENSUAL],[PORTAFOLIO RENTA FIJA],[PORTAFOLIO ACCIONES],[Repo Activo],[Repo Pasivo],[Simultanea Activa],[Simultanea Pasiva],[NADA])
	)	AS PIVOTTABLE  ;

	SELECT 
		GETDATE() AS FECHA_PROCESO , @FECHA_INI AS FECHA_INICIAL , 
		@FECHA_FIN  AS  FECHA_FINAL , @MONTOMINIMO AS MONTO_MINIMO, 
		@MONTOMAXIMO AS MONTO_MAXIMO , IDCLIENTE ,CLI.STRNRODOCUMENTO AS DOCUMENTO,
		CLI.STRNOMBRE AS NOMBRE,  SALDO, R.STRNOMBRE AS [NOMBRE COMERCIAL],
		CASE  WHEN [OPERACIONES A PLAZO] > 0 THEN '1' ELSE '0' END  AS [OPERACIONES A PLAZO],
		CASE  WHEN [MOVIMIENTO] > 0 THEN '1' ELSE '0' END  AS [MOVIMIENTO],
		CASE  WHEN [RENTA FIJA] > 0 THEN '1' ELSE '0' END  AS [RENTA FIJA] ,
		CASE  WHEN [ACCIONES] > 0 THEN '1' ELSE '0' END  AS [ACCIONES],
		
		CASE  WHEN [Repo Activo] > 0 THEN '1' ELSE '0' END  AS [Repo Activo],
		CASE  WHEN [Repo Pasivo] > 0 THEN '1' ELSE '0' END  AS [Repo Pasivo],
		CASE  WHEN [Simultanea Activa] > 0 THEN '1' ELSE '0' END  AS  [Simultanea Activa],
		CASE  WHEN [Simultanea Pasiva] > 0 THEN '1' ELSE '0' END  AS [Simultanea Pasiva],
		
		ISNULL(CLI.strEnviarInformeEconomico,0) AS [ENVIO CORREO], 
		CASE CLI.STRTIPOSEGMENTO WHEN 17 THEN 'VIP' ELSE '' END AS CLIENTE_VIP ,
		CASE (SELECT TOP 1 1 FROM  DBOYD.DBO.TBLCONCILIACIONCDB  WITH(NOLOCK) WHERE DOCUMENTO_OYD = CLI.STRNRODOCUMENTO AND CONVERT(VARCHAR(20), FECHA_CORTE, 101) = CONVERT(VARCHAR(20), @FECHA_INI, 101) )
		WHEN 1 THEN '1' ELSE '0' END INCONSISTENCIAS_FECHA_INICIO ,
		CASE (SELECT TOP 1 1 FROM  DBOYD.DBO.TBLCONCILIACIONCDB  WITH(NOLOCK) WHERE DOCUMENTO_OYD = CLI.STRNRODOCUMENTO AND CONVERT(VARCHAR(20), FECHA_CORTE, 101) = CONVERT(VARCHAR(20), @FECHA_FIN, 101) )
		WHEN 1 THEN '1' ELSE '0' END INCONSISTENCIAS_FECHA_FIN ,
		CASE (SELECT TOP 1 1 FROM  #TEMPFINAL1  WITH(NOLOCK) WHERE LTRIM(RTRIM([CODIGO CLIENTE])) = LTRIM(RTRIM(CLI.LNGID)) )
		WHEN 1 THEN '1' ELSE '0' END CONCILIACION
	
	FROM #TEMP_CLIENTES
	INNER JOIN DBOYD.DBO.TBLCLIENTES CLI WITH(NOLOCK) ON  CLI.LNGID = #TEMP_CLIENTES.IDCLIENTE
	INNER JOIN  DBOYD.DBO.TBLCLIENTESRECEPTORES CR WITH(NOLOCK) ON CR.LNGIDCOMITENTE  = CLI.LNGID AND CR.LOGLIDER = 1
	INNER JOIN DBOYD.DBO.TBLRECEPTORES R WITH(NOLOCK) ON CR.STRIDRECEPTOR = R.STRID
END







GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_ReporteExtractosPruebasNoGenerados]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop table #TEMP_DATOS
/*
	Nombre: DBO.paExtractos_ReporteExtractos
	Autor: Yoany Gomez Zapata
	Fecha:  03 de Octubre de 2011
	
	Descripcion : Permite generar el reporte de validacion de pruebas en la generacion de extractos
	
	Modificaciones:
	Autor:							Fecha:
	Descripcion:
	
*/
CREATE PROCEDURE [Operaciones].[paOperaciones_ReporteExtractosPruebasNoGenerados]
AS
BEGIN
SELECT 
      CODCLIENTE ,  ISNULL([MVTO OPERACIONES A PLAZO],0) [MVTO OPERACIONES A PLAZO]
      ,ISNULL([MVTO CONTABLE MENSUAL],0) [MVTO CONTABLE MENSUAL]
      ,ISNULL([PORTAFOLIO RENTA FIJA],0) [PORTAFOLIO RENTA FIJA]
      ,ISNULL([PORTAFOLIO ACCIONES],0) [PORTAFOLIO ACCIONES]
      INTO #TEMP_DATOS
      FROM 
      (
            SELECT 
            [CODIGO CLIENTE]  AS CODCLIENTE,[TIPO REGISTRO] AS ESTADO , COUNT(0) CANTIDAD 
            FROM dbOYD.dbo.TBLEXTRACTOS_PORTAFOLIO S
            GROUP BY [CODIGO CLIENTE]   , [TIPO REGISTRO]
      ) 
      AS S
      PIVOT
      (
            SUM(CANTIDAD)
            FOR ESTADO IN ([MVTO OPERACIONES A PLAZO],[MVTO CONTABLE MENSUAL],[PORTAFOLIO RENTA FIJA],[PORTAFOLIO ACCIONES])
      )AS PIVOTTABLE  ;

      SELECT #TEMP_DATOS.CODCLIENTE,  
      CASE ISNULL(C.IDCLIENTE,'') WHEN '' THEN 'NO' ELSE 'SI' END AS GENERA_EXTRACTO, C.IDCLIENTE,
      [MVTO OPERACIONES A PLAZO],[MVTO CONTABLE MENSUAL],[PORTAFOLIO RENTA FIJA],[PORTAFOLIO ACCIONES], ISNULL(ENVIOCORREO,0) AS ENVIOCORREO , SALDO,
      case cli.strtiposegmento when 17 then 'VIP' ELSE '' END AS CLIENTE_VIP
      FROM dbOYD.dbo.tblExtractos_ClientesProcesar C
      RIGHT JOIN  #TEMP_DATOS ON  C.IDCLIENTE =  #TEMP_DATOS.CODCLIENTE
      inner join dbOYD.dbo.tblclientes cli on  cli.lngID = #TEMP_DATOS.CODCLIENTE
      WHERE C.PROCESADO IS NULL AND C.IDCLIENTE IS NOT NULL
END
GO
/****** Object:  StoredProcedure [Operaciones].[paOperaciones_RevisoriaFondo]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Operaciones].[paOperaciones_RevisoriaFondo] 
AS
SELECT TOP 1 vchNombre, vchEmail,vchTelefono  FROM dbSafyr.dbo.tblRevisoriaFondo 


GO
/****** Object:  StoredProcedure [Operaciones].[paOperacionesPortafolioCarteras]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Operaciones.paOperacionesPortafolioCarteras '12/28/2010',38995709

/*
	Nombre: Operaciones.paOperacionesPortafolioCarteras
	Autor:	Yoany GOmez Zapata
	Fecha:  27 de Enero de 2010
	
	Descripcion : Permite la consulta del portafolio de un cliente para las carteras colectivas
	
	Modificaciones: 
	1.	Autor:						Fecha:
		Descripcion:  
*/
CREATE PROCEDURE [Operaciones].[paOperacionesPortafolioCarteras]
@FECHA DATETIME,
@FIDEICOMITENTE FLOAT 
AS

	DECLARE @FECHA_INI DATETIME
	SET @FECHA_INI = CONVERT(VARCHAR(2),DATEPART(MONTH,@FECHA)) + '/' + '01/' +  CONVERT(VARCHAR(4),DATEPART(YEAR,@FECHA)) 

	-- --1 -- OCCIVALOR
	-- --8 -- PREMIUM
	--SELECT	S.FONDO,
	--		F.FIDEICOMISO,
	--		S.VALOR,
	--		F.FECHA_CONST,
	--		F.FECHA_VTO, 
	--		(
	--			SELECT VLR_UNIDAD_NETA 
	--			FROM ADMONFONDOS.DBO.HRICOUNIDAD WITH(NOLOCK) 
	--			WHERE FECHA = @FECHA-1 AND FONDO = S.FONDO	
	--		) AS VALOR_UNIDAD_NETAI, 
	--		H.VLR_UNIDAD_NETA,
	--		ROUND((POWER((H.VLR_UNIDAD_NETA/(SELECT VLR_UNIDAD_NETA FROM ADMONFONDOS.DBO.HRICOUNIDAD WITH(NOLOCK) WHERE FECHA = @FECHA_INI-1 AND FONDO = S.FONDO)),(365.0/-(DATEDIFF(DAY,@FECHA,CONVERT(DATETIME,@FECHA_INI))-1)))-1)*100,4) AS TASA, 
	--		(
	--			SELECT SUM(VALOR)
	--			FROM ADMONFONDOS.DBO.HRICOTRANSA
	--			WHERE FECHA BETWEEN @FECHA_INI AND @FECHA
	--			AND TIPO IN ('U','X') AND FONDO = S.FONDO AND FIDEICOMISO = F.FIDEICOMISO 
	--			GROUP BY FONDO,RED,OFICINA,FIDEICOMISO
	--		) AS RENDIMIENTO
	----INTO #TEMP 
	--FROM ADMONFONDOS.DBO.SALCLI S WITH(NOLOCK) 
	--INNER JOIN ADMONFONDOS.DBO.FIDEICOMISOS F WITH(NOLOCK) ON S.FONDO = F.FONDO AND 
	--								S.FIDEICOMISO = F.FIDEICOMISO AND 
	--								S.FIDEICOMITENTE = F.FIDEICOMITENTE
	--INNER JOIN ADMONFONDOS.DBO.HRICOUNIDAD H WITH(NOLOCK) ON S.FECHA = H.FECHA AND 
	--								S.FONDO = H.FONDO
	--WHERE	S.FECHA = @FECHA AND 
	--		S.FIDEICOMITENTE = @FIDEICOMITENTE
	--UNION ALL
	---- 2 -- MULTIPLUS
	--SELECT	S.FONDO,
	--		F.FIDEICOMISO,
	--		S.VALOR,
	--		F.FECHA_CONST,
	--		F.FECHA_VTO, 
	--		(
	--			SELECT VLR_UNIDAD_NETA 
	--			FROM ADMONFONDOS_vp.DBO.HRICOUNIDAD WITH(NOLOCK) 
	--			WHERE FECHA = @FECHA-1 AND FONDO = S.FONDO	
	--		) AS VALOR_UNIDAD_NETAI, 
	--		H.VLR_UNIDAD_NETA,
	--		ROUND((POWER((H.VLR_UNIDAD_NETA/(SELECT VLR_UNIDAD_NETA FROM ADMONFONDOS_vp.DBO.HRICOUNIDAD WITH(NOLOCK) WHERE FECHA = @FECHA_INI-1 AND FONDO = S.FONDO)),(365.0/-(DATEDIFF(DAY,@FECHA,CONVERT(DATETIME,@FECHA_INI))-1)))-1)*100,4) AS TASA, 
	--		(
	--			SELECT SUM(VALOR)
	--			FROM ADMONFONDOS_vp.DBO.HRICOTRANSA
	--			WHERE FECHA BETWEEN @FECHA_INI AND @FECHA
	--			AND TIPO IN ('U','X') AND FONDO = S.FONDO AND FIDEICOMISO = F.FIDEICOMISO 
	--			GROUP BY FONDO,RED,OFICINA,FIDEICOMISO
	--		) AS RENDIMIENTO
	----INTO #TEMPMULTIPLUS 
	--FROM ADMONFONDOS_vp.DBO.SALCLI S WITH(NOLOCK) 
	--INNER JOIN ADMONFONDOS_vp.DBO.FIDEICOMISOS F WITH(NOLOCK) ON S.FONDO = F.FONDO AND 
	--								S.FIDEICOMISO = F.FIDEICOMISO AND 
	--								S.FIDEICOMITENTE = F.FIDEICOMITENTE
	--INNER JOIN ADMONFONDOS_vp.DBO.HRICOUNIDAD H WITH(NOLOCK) ON S.FECHA = H.FECHA AND 
	--								S.FONDO = H.FONDO
	--WHERE	S.FECHA = @FECHA AND 
	--		S.FIDEICOMITENTE = @FIDEICOMITENTE
					
	--SELECT * FROM #TEMP
	--UNION ALL
	--SELECT * FROM #TEMPMULTIPLUS 
		
		-- TOMANDO LA INFORMACION DE SAFYR
		SELECT 
		case E.VCHCODIGOPORTAFOLIO 
		when 'OCCIVALOR' THEN 1 
		when 'OCCIPREMIUM' THEN 8 
		ELSE  2 END
		FONDO , E.INTENCARGO FIDEICOMISO , se.NUMVALORPESOS VALOR , E.DATFECHA FECHA_CONST, E.DATFECHAVENCIMIENTO FECHA_VTO,
		(	
			SELECT NUMVALORUNIDAD  
			FROM  dbsafyr.dbo.TBLHISTORICOUNIDAD  
			WHERE VCHCODIGOPORTAFOLIO = e.VCHCODIGOPORTAFOLIO AND DATFECHAACT =@FECHA-1
		) VALOR_UNIDAD_NETAI,
		(	
			SELECT NUMVALORUNIDAD  
			FROM  dbsafyr.dbo.TBLHISTORICOUNIDAD  
			WHERE VCHCODIGOPORTAFOLIO = e.VCHCODIGOPORTAFOLIO AND DATFECHAACT =@FECHA
		)VLR_UNIDAD_NETA
		, 
		(POWER(((	
			SELECT NUMVALORUNIDAD  
			FROM  dbsafyr.dbo.TBLHISTORICOUNIDAD  
			WHERE VCHCODIGOPORTAFOLIO = e.VCHCODIGOPORTAFOLIO AND DATFECHAACT =@FECHA
		)/
		(	
			SELECT NUMVALORUNIDAD  
			FROM  dbsafyr.dbo.TBLHISTORICOUNIDAD  
			WHERE VCHCODIGOPORTAFOLIO = e.VCHCODIGOPORTAFOLIO AND DATFECHAACT =@FECHA_INI-1
		)
		),(365.0/-(DATEDIFF(DAY,@FECHA ,CONVERT(DATETIME,@FECHA_INI))-1)))-1)*100 AS TASA
		, 0 RENDIMIENTO 
		FROM dbsafyr.dbo.TBLENCARGOS  E
		INNER JOIN  dbsafyr.dbo.TBLSUSCRIPTORES S ON  E.INTCODSUSCRIPTOR = S.INTCODSUSCRIPTOR
		INNER JOIN  dbsafyr.dbo.TBLSALDOSENCARGOS SE ON E.INTENCARGO  = SE.INTENCARGO AND  SE.DATFECHA = @FECHA
		and E.INTCODSUSCRIPTOR = Se.INTCODSUSCRIPTOR
		WHERE S.VCHDOCID = CONVERT(VARCHAR(30), CAST(@FIDEICOMITENTE AS bigINT))--AND E.NUMVALORPESOS > 0
		
		--PRINT CONVERT(VARCHAR(30), CAST(@FIDEICOMITENTE AS INT))
		--select *
		--FROM dbsafyr.dbo.TBLENCARGOS  E
		--INNER JOIN  dbsafyr.dbo.TBLSUSCRIPTORES S ON  E.INTCODSUSCRIPTOR = S.INTCODSUSCRIPTOR
		--INNER JOIN  dbsafyr.dbo.TBLSALDOSENCARGOS SE ON E.INTENCARGO  = SE.INTENCARGO AND  SE.DATFECHA = '12/28/2010'
		--WHERE S.VCHDOCID = '38995709' --AND E.NUMVALORPESOS > 0
		
		--SELECT * FROM DBSAFYR.DBO.TBLSALDOSENCARGOS SE WHERE SE.INTENCARGO = 848 AND DATFECHA = '12/28/2010'

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ActualizarFormula]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Actualizar las ecuaciones existentes
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ActualizarFormula]
@IDFORMULA INT,
@VARIABLE VARCHAR(20),
@ECUACION VARCHAR(200),
@DESCRIPCION VARCHAR(200),
@CAMPO VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @PERMITIR BIT
	SET @PERMITIR=1
	
	IF(LEN(@VARIABLE)= 0 OR LEN(@ECUACION)= 0)
	BEGIN
		SET @PERMITIR=0
	END
	
	IF(LEN(@DESCRIPCION)= 0)
	BEGIN
		SET @DESCRIPCION=NULL
	END
	
	IF(LEN(@CAMPO)= 0)
	BEGIN
		SET @CAMPO=NULL
	END
	ELSE
	BEGIN
		SELECT @CAMPO=TABLE_SCHEMA+'.'+TABLE_NAME+'.'+COLUMN_NAME  
		FROM INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA='Riesgos' and (TABLE_NAME='irlHistorico' or TABLE_NAME='valoresHistoricosCartera')
		and COLUMN_NAME=@CAMPO
	END
	
	IF @PERMITIR=1
	BEGIN
		UPDATE RIESGOS.FORMULAS SET VARIABLE=@VARIABLE,ECUACION=@ECUACION,DESCRIPCION=@DESCRIPCION,CAMPO=@CAMPO
		WHERE ID=@IDFORMULA
	END
	
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ActualizarHomologacionNemotecnicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Actualizar las homologaciones configuradas
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ActualizarHomologacionNemotecnicos]
@ID INT,
@MNEMOTECNICOSEN VARCHAR(15),
@NEMOTECNICOLOCAL VARCHAR(15)
AS
BEGIN
	SET NOCOUNT ON;
UPDATE Riesgos.HomologacionNemotecnico SET MnemotecnicoSEN=@MNEMOTECNICOSEN, NemotecnicoLocal=@NEMOTECNICOLOCAL
WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ActualizarPrioridadFormulaCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Actualizar prioridad de las ecuaciones
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ActualizarPrioridadFormulaCartera]
@IDCARTERA INT,
@IDFORMULA INT,
@PRIORIDAD INT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Riesgos.formulasCartera SET PRIORIDAD=@PRIORIDAD
	WHERE idCartera=@IDCARTERA AND idformula=@IDFORMULA

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ActualizarValoresHistoricoCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 21/07/2011
-- Description:	Actualizar los valores historicos calculados
-- EXEC Riesgos.paCalculoIRL_ActualizarValoresHistoricoCartera 4,'2011-05-01','disp',5000
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ActualizarValoresHistoricoCartera]
@IDCARTERA INT,
@FECHAPROCESO VARCHAR(15),
@SCHEMA VARCHAR(50),
@TABLE VARCHAR(50),
@FIELD VARCHAR(50),
@VALOR DECIMAL(35,15)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @SELECT VARCHAR(200)

IF @TABLE='irlHistorico'
BEGIN
	SET @SELECT= 'UPDATE '+@SCHEMA+'.'+@TABLE+' SET '+@FIELD+'='+CAST(@VALOR AS VARCHAR)+' WHERE IDCARTERA='+CAST(@IDCARTERA AS VARCHAR)+' AND FECHACALCULOIRL='''+@FECHAPROCESO+'''' 
END

IF @TABLE='valoresHistoricosCartera'
BEGIN
	SET @SELECT= 'UPDATE '+@SCHEMA+'.'+@TABLE+' SET '+@FIELD+'='+CAST(@VALOR AS VARCHAR)+' WHERE IDCARTERA='+CAST(@IDCARTERA AS VARCHAR)+' AND FECHAHISTORICO='''+@FECHAPROCESO+'''' 
END

PRINT (@SELECT)
EXEC (@SELECT)
			
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarAsignacionEcuacionesCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener la asignacion de las ecuaciones por cartera
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarAsignacionEcuacionesCartera]
@IDCARTERA INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ID,VARIABLE,DESCRIPCION,ECUACION,RIESGOS.FNCALCULOIRL__ASIGNACIONECUACION(ID,@IDCARTERA) ASIGNADA,RIESGOS.FNCALCULOIRL__PRIORIDADECUACION (ID,@IDCARTERA) PRIORIDAD
	FROM RIESGOS.FORMULAS
ORDER BY PRIORIDAD
END

GO
/****** Object:  StoredProcedure [Riesgos].[pacalculoIRL_ConsultarCamposDisponiblesVariables]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener los campos para guardar u obtener los valores de la variable
-- =============================================
CREATE PROCEDURE [Riesgos].[pacalculoIRL_ConsultarCamposDisponiblesVariables]
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT TABLE_SCHEMA,TABLE_NAME as TABLA,COLUMN_NAME as CAMPO,TABLE_SCHEMA+'.'+TABLE_NAME+'.'+COLUMN_NAME AS INFOCAMPO  
	FROM INFORMATION_SCHEMA.COLUMNS
	where TABLE_SCHEMA='Riesgos' and (TABLE_NAME='irlHistorico' or TABLE_NAME='valoresHistoricosCartera')
	and COLUMN_NAME not like '%id%' and COLUMN_NAME not like '%fecha%'


END

GO
/****** Object:  StoredProcedure [Riesgos].[pacalculoIRL_ConsultarCampoVariables]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener el campo configurado para guardar u obtener los valores de la variable
-- =============================================
CREATE PROCEDURE [Riesgos].[pacalculoIRL_ConsultarCampoVariables]
@IDCARTERA INT,
@ID VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
SELECT F.CAMPO 
FROM RIESGOS.FORMULAS F INNER JOIN RIESGOS.FORMULASCARTERA FC
ON F.ID=FC.IDFORMULA
WHERE F.VARIABLE=@ID AND FC.IDCARTERA = @IDCARTERA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarCarteras]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las carteras colectivas existentes
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarCarteras]
AS
BEGIN
	SET NOCOUNT ON;
SELECT * FROM Riesgos.CarterasColectivas
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarCarterasById]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las carteras colectivas existentes
-- =============================================
Create PROCEDURE [Riesgos].[paCalculoIRL_ConsultarCarterasById]
@IdCartera int
AS
BEGIN
	SET NOCOUNT ON;
SELECT * FROM Riesgos.CarterasColectivas
where Id = @IdCartera
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarCompartimientosCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener compartimientos para las carteras colectivas existentes
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarCompartimientosCartera]
@CARTERA VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
SELECT NombreCartera FROM Riesgos.CarterasColectivas
WHERE IdCarteraPadre IN (
SELECT Id FROM Riesgos.CarterasColectivas
WHERE NombreCartera=@CARTERA
)
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarEcuaciones]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las ecuaciones existentes
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarEcuaciones]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT F.ID,F.VARIABLE,F.ECUACION,F.DESCRIPCION, SUBSTRING(F.CAMPO,CHARINDEX('.',F.CAMPO,9)+1,LEN(F.CAMPO)-CHARINDEX('.',F.CAMPO,9)) AS CAMPO
		FROM RIESGOS.FORMULAS F
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarEcuacionesCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las carteras colectivas existentes
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarEcuacionesCartera]
@IDCARTERA INT
AS
BEGIN
	SET NOCOUNT ON;
		SELECT FC.IDCARTERA,FC.IDFORMULA,F.VARIABLE,F.ECUACION,F.DESCRIPCION 
		FROM RIESGOS.FORMULASCARTERA FC INNER JOIN RIESGOS.FORMULAS F
		ON FC.IDFORMULA=F.ID
		WHERE FC.IDCARTERA = @IDCARTERA AND FC.PRIORIDAD IS NOT NULL
		ORDER BY FC.PRIORIDAD
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarEstadoCierreCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 21/07/2011
-- Description:	Consultar estado cierre de la cartera colectiva en safyr
-- EXEC Riesgos.paCalculoIRL_ConsultarEstadoCierreCartera 'OCCIVALOR','2011-05-08 00:00:00'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarEstadoCierreCartera]
@CARTERA VARCHAR (20),
@FECHAPROCESAR VARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE 
	@ULTIMAFECHACIERRE DATETIME,
	@RESULTADO INT
	
	SELECT @ULTIMAFECHACIERRE = MAX(DATFECHAACT)
	FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD
	WHERE VCHCODIGOPORTAFOLIO=@CARTERA

	IF CAST(@FECHAPROCESAR AS DATETIME) <=  @ULTIMAFECHACIERRE
		BEGIN
			SET @RESULTADO = 1
		END
	ELSE
		BEGIN
			SET @RESULTADO = 0
		END
		
	SELECT @RESULTADO AS RESULTADO
	
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarEstadoCierreCarteraSafyr]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 21/07/2011
-- Description:	Consultar estado cierre de la cartera colectiva en safyr
-- EXEC Riesgos.paCalculoIRL_ConsultarEstadoCierreCartera 'OCCIVALOR','2011-05-08 00:00:00'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarEstadoCierreCarteraSafyr]
@CARTERA VARCHAR (20),
@FECHAPROCESAR VARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE 
	@ULTIMAFECHACIERRE DATETIME,
	@RESULTADO INT
	
	SELECT NOMBRECARTERA 
	INTO #TEMP
	FROM RIESGOS.CARTERASCOLECTIVAS
	WHERE IDCARTERAPADRE IN (
	SELECT ID FROM RIESGOS.CARTERASCOLECTIVAS
	WHERE NOMBRECARTERA=@CARTERA
	)
	
	IF (SELECT COUNT(*) FROM #TEMP) = 0
	BEGIN
		INSERT INTO #TEMP
		VALUES(@CARTERA)		
	END
	
	SELECT MAX(DATFECHAACT) AS FECHA,VCHCODIGOPORTAFOLIO
	INTO #TEMP2
	FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD
	GROUP BY VCHCODIGOPORTAFOLIO
	HAVING VCHCODIGOPORTAFOLIO IN (SELECT NOMBRECARTERA COLLATE SQL_Latin1_General_CP1_CI_AS FROM #TEMP) 
	
	SELECT @ULTIMAFECHACIERRE=MIN(FECHA) FROM #TEMP2
	
	IF CAST(@FECHAPROCESAR AS DATETIME) <=  @ULTIMAFECHACIERRE
		BEGIN
			SET @RESULTADO = 1
		END
	ELSE
		BEGIN
			SET @RESULTADO = 0
		END
		
	SELECT @RESULTADO AS RESULTADO
	
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarFechaUltimoProceso]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener fecha ultimo proceso calculo IRL
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarFechaUltimoProceso]
@IDCARTERA VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
SELECT convert(varchar,DATEADD(DAY,1,ISNULL(MAX(FECHACALCULOIRL),DATEADD(DAY,-76,GETDATE()))),111) AS FECHACALCULOIRL 
FROM RIESGOS.IRLHISTORICO
WHERE IDCARTERA=@IDCARTERA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarHaircutPortafolio]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener Haircut aplicado para cada titulo
-- exec Riesgos.paCalculoIRL_ConsultarHaircutPortafolio '2011-05-01 00:00:00','OCCIVALOR'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarHaircutPortafolio]
@FECHA VARCHAR (15),
@IDCARTERA VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	
SELECT * 
INTO #TEMP_EMISIONESBANREP
FROM RIESGOS.EMISIONESBANREP


UPDATE #TEMP_EMISIONESBANREP SET MNEMOTECNICOSEN=H.NemotecnicoLocal 
FROM #TEMP_EMISIONESBANREP TMP_EBR INNER JOIN Riesgos.HomologacionNemotecnico H
ON TMP_EBR.MNEMOTECNICOSEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS=H.MnemotecnicoSEN

SELECT DISTINCT 
PD.VCHCODIGOTITULO,
CASE WHEN PD.VCHCLASIFICACIONINVERSION='IV' THEN 0.5
ELSE ISNULL(H.VALORHAIRCUT,0.3) END VALORHAIRCUT
FROM DBSAFYR.DBO.TBLPORTAFOLIODETITULOSPORDIAS PD 
INNER JOIN DBSAFYR.DBO.TBLESPECIESHIJAS EH ON PD.INTIDESPECIE = EH.INTIDESPECIE
INNER JOIN DBSAFYR.DBO.TBLESPECIES E ON EH.INTIDPADRE = E.INTID
LEFT JOIN #TEMP_EMISIONESBANREP EBR ON EBR.MNEMOTECNICOSEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS=EH.VCHNEMOTECNICO
LEFT JOIN RIESGOS.HAIRCUTS H ON EBR.EMISION=H.NUMEROEMISION AND H.TCO_PLAZO=1
WHERE PD.VCHCODIGOPORTAFOLIO IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@IDCARTERA,',')) AND DATFECHAACT=@FECHA
AND PD.CHRTIPOSIM NOT IN ('A')
GROUP BY PD.VCHCODIGOTITULO,
CASE WHEN PD.VCHCLASIFICACIONINVERSION='IV' THEN 0.5
ELSE ISNULL(H.VALORHAIRCUT,0.3) END

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarHaircutPortafolioDetallado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener Haircut aplicado para cada titulo
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarHaircutPortafolioDetallado]
@IDCARTERA INT,
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @count int
	
	SELECT NombreCartera 
	INTO #TMP_CARTERAS
	FROM Riesgos.CarterasColectivas WHERE IdCarteraPadre=@IDCARTERA

SELECT @count=COUNT(*) FROM #TMP_CARTERAS

IF @count <= 0
BEGIN
	INSERT INTO #TMP_CARTERAS
	SELECT NombreCartera FROM Riesgos.CarterasColectivas WHERE Id=@IDCARTERA
END

SELECT * 
INTO #TEMP_EMISIONESBANREP
FROM RIESGOS.EMISIONESBANREP


UPDATE #TEMP_EMISIONESBANREP SET MNEMOTECNICOSEN=H.NemotecnicoLocal 
FROM #TEMP_EMISIONESBANREP TMP_EBR INNER JOIN Riesgos.HomologacionNemotecnico H
ON TMP_EBR.MNEMOTECNICOSEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS=H.MnemotecnicoSEN
	
SELECT DISTINCT 
E.VCHDESCRIPCION ESPECIE, EH.VCHNEMOTECNICO NEMOTECNICO, PD.VCHCODIGOTITULO,
SUM(PD.NUMVALORCOMPRA + PD.NUMTOTALAJUSTESAVPN + PD.NUMTOTALAJUSTESATIR - PD.NUMTOTALRENDIMIENTOS) AS VPN,
CASE WHEN PD.VCHCLASIFICACIONINVERSION='IV' THEN 0.5
ELSE ISNULL(H.VALORHAIRCUT,0.3) END VALORHAIRCUT
FROM DBSAFYR.DBO.TBLPORTAFOLIODETITULOSPORDIAS PD 
INNER JOIN DBSAFYR.DBO.TBLESPECIESHIJAS EH ON PD.INTIDESPECIE = EH.INTIDESPECIE
INNER JOIN DBSAFYR.DBO.TBLESPECIES E ON EH.INTIDPADRE = E.INTID
LEFT JOIN #TEMP_EMISIONESBANREP EBR ON EBR.MNEMOTECNICOSEN COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS=EH.VCHNEMOTECNICO
LEFT JOIN RIESGOS.HAIRCUTS H ON EBR.EMISION=H.NUMEROEMISION AND H.TCO_PLAZO=1
WHERE PD.VCHCODIGOPORTAFOLIO IN (SELECT NombreCartera COLLATE SQL_LATIN1_GENERAL_CP1_CI_AS FROM #TMP_CARTERAS) AND DATFECHAACT=@FECHA
AND PD.CHRTIPOSIM NOT IN ('A')
GROUP BY E.VCHDESCRIPCION,EH.VCHNEMOTECNICO,PD.VCHCODIGOTITULO,
CASE WHEN PD.VCHCLASIFICACIONINVERSION='IV' THEN 0.5
ELSE ISNULL(H.VALORHAIRCUT,0.3) END

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarHistoricoByRangoFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener valores historico por rango de fechas
-- EXEC Riesgos.paCalculoIRL_ConsultarDetalleHistoricoByFecha 2,'2011-05-03 00:00:00'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarHistoricoByRangoFecha]
@IDCARTERA INT,
@FECHAINICIAL VARCHAR(20),
@FECHAFIN VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM RIESGOS.VW_HISTORICOCARTERA
	WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO BETWEEN @FECHAINICIAL AND @FECHAFIN
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarHomologacionNemotecnicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las homologaciones configuradas
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarHomologacionNemotecnicos]
AS
BEGIN
	SET NOCOUNT ON;
SELECT * FROM Riesgos.HomologacionNemotecnico
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarIrl]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener el irl por cartera y fecha
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarIrl]
@IDCARTERA VARCHAR(50),
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
SELECT * FROM RIESGOS.IRLHISTORICO
WHERE IDCARTERA=@IDCARTERA AND FECHACALCULOIRL=@FECHA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarIrlDetalleHistoricoByFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener IRL por dia y detalle historico
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarIrlDetalleHistoricoByFecha]
@IDCARTERA INT,
@FECHA VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM RIESGOS.VW_IRLDETALLEHISTORICO
	WHERE IDCARTERA=@IDCARTERA AND FECHACALCULOIRL=@FECHA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarIrlHistoricoByRangoFecha]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener IRL historico por rango de fechas
-- EXEC Riesgos.paCalculoIRL_ConsultarIrlDetalleHistoricoByFecha 2,'2011-05-03 00:00:00'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarIrlHistoricoByRangoFecha]
@IDCARTERA INT,
@FECHAINICIAL VARCHAR(20),
@FECHAFIN VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM RIESGOS.VW_IRLHISTORICO 
	WHERE IDCARTERA=@IDCARTERA AND  FECHACALCULOIRL BETWEEN @FECHAINICIAL AND @FECHAFIN
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarUltimaFechaCierreCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 21/07/2011
-- Description:	Consultar estado cierre de la cartera colectiva en safyr
-- EXEC Riesgos.paCalculoIRL_ConsultarUltimaFechaCierreCartera 'OCCIVALOR'
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarUltimaFechaCierreCartera]
@CARTERA VARCHAR (20)
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT MAX(DATFECHAACT)
	FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD
	WHERE VCHCODIGOPORTAFOLIO=@CARTERA
	
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarValorCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Consultar el valor de la cartera en un tiempo t
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarValorCartera]
@IDCARTERA VARCHAR(50),
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
SELECT valorTotalCartera FROM RIESGOS.VALORESHISTORICOSCARTERA
WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO=@FECHA

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarValorCarteraAnterior]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Consultar el valor de la cartera en un tiempo t
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarValorCarteraAnterior]
@IDCARTERA VARCHAR(50),
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
SELECT valorTotalCarteraAnterior FROM RIESGOS.VALORESHISTORICOSCARTERA
WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO=@FECHA

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarValoresHistoricosCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener valores historicos cartera
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarValoresHistoricosCartera]
@IDCARTERA VARCHAR(50),
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
SELECT * FROM RIESGOS.VALORESHISTORICOSCARTERA
WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO=@FECHA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarVariablesEcuaciones]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Obtener las ecuaciones para cada variable
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarVariablesEcuaciones]
@idCartera int
AS
BEGIN
	SET NOCOUNT ON;
SELECT f.variable,f.ecuacion,f.descripcion,f.campo 
FROM Riesgos.formulas f inner join Riesgos.formulasCartera fc
on f.ID=fc.idformula
where fc.idCartera = @idCartera

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_ConsultarVarianza]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Consultar el valor de la varianza en un tiempo t
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_ConsultarVarianza]
@IDCARTERA VARCHAR(50),
@FECHA VARCHAR (15)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @VARIANZA DECIMAL(20,10)
	
SELECT @VARIANZA=varianza FROM RIESGOS.VALORESHISTORICOSCARTERA
WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO=@FECHA

IF (@VARIANZA IS NULL)
BEGIN
	SET @VARIANZA=0.00026369
END

SELECT @VARIANZA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_EliminarFormulaCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Eliminar registro formula cartera colectiva
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_EliminarFormulaCartera]
@IDCARTERA INT,
@IDFORMULA INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM RIESGOS.FORMULASCARTERA WHERE IDCARTERA=@IDCARTERA AND IDFORMULA=@IDFORMULA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_EliminarHomologacionNemotecnicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Eliminar homologaciones nemotecnicos
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_EliminarHomologacionNemotecnicos]
@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM RIESGOS.HOMOLOGACIONNEMOTECNICO WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_EliminarRegistroError]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Eliminar registros erroneos o incompletos causados por excepciones del sistema
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_EliminarRegistroError]
@IDCARTERA INT,
@FECHA VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
DELETE FROM RIESGOS.IRLHISTORICO
WHERE IDCARTERA=@IDCARTERA AND FECHACALCULOIRL=@FECHA

DELETE FROM RIESGOS.VALORESHISTORICOSCARTERA
WHERE IDCARTERA=@IDCARTERA AND FECHAHISTORICO=@FECHA

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Guardar nuevo registro cartera colectiva
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarCartera]
@CARTERA VARCHAR(50),
@IDCARTERAPADRE INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EXISTE int
	
	SET @EXISTE=0
	
	SELECT @EXISTE=ID FROM Riesgos.CarterasColectivas WHERE NombreCartera=@CARTERA
	
	IF @EXISTE = 0
	BEGIN
		
		IF @IDCARTERAPADRE = 0 
		BEGIN
			INSERT INTO Riesgos.CarterasColectivas (NombreCartera)
			VALUES(@CARTERA)
		END
		ELSE
		BEGIN
			INSERT INTO Riesgos.CarterasColectivas
			VALUES(@CARTERA,@IDCARTERAPADRE)
		END
	END

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarEmision]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 06-07-2011
-- DESCRIPTION:	INSERTAR EMISIONES DESCARGADOS DESDE EL BANCO DE LA REPUBLICA
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarEmision] 
@TITULO	INT,
@PLAZO INT,
@TIPOPLAZO CHAR(1),
@MONEDA	VARCHAR(3),
@EMISION INT,
@MNEMOTECNICOSEN VARCHAR(15),
@FECHAINICIOVIGENCIA DATETIME,
@FECHAVENCIMIENTO DATETIME,
@TASAINTERES DECIMAL(14,4),
@TASASPREAD	DECIMAL(14,4),
@SIGNO CHAR(1),
@PERIODOINTERES	CHAR(1),
@TIPO VARCHAR(10),
@CODIGOISIN	VARCHAR(15),
@CODIGOCFI VARCHAR(7)
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO RIESGOS.EMISIONESBANREP
VALUES(
@TITULO,
@PLAZO,
@TIPOPLAZO,
@MONEDA,
@EMISION,
@MNEMOTECNICOSEN,
@FECHAINICIOVIGENCIA,
@FECHAVENCIMIENTO,
@TASAINTERES,
@TASASPREAD,
@SIGNO,
@PERIODOINTERES,
@TIPO,
@CODIGOISIN,
@CODIGOCFI
)

SELECT @@ROWCOUNT

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarFormula]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Insertar nuevas ecuaciones
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarFormula]
@VARIABLE VARCHAR(20),
@ECUACION VARCHAR(200),
@DESCRIPCION VARCHAR(200),
@CAMPO VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	
		DECLARE @PERMITIR BIT
	SET @PERMITIR=1
	
	IF(LEN(@VARIABLE)= 0 OR LEN(@ECUACION)= 0)
	BEGIN
		SET @PERMITIR=0
	END
	
	IF(LEN(@DESCRIPCION)= 0)
	BEGIN
		SET @DESCRIPCION=NULL
	END
	
		IF(LEN(@CAMPO)= 0)
	BEGIN
		SET @CAMPO=NULL
	END
	ELSE
	BEGIN
		SELECT @CAMPO=TABLE_SCHEMA+'.'+TABLE_NAME+'.'+COLUMN_NAME  
		FROM INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA='Riesgos' and (TABLE_NAME='irlHistorico' or TABLE_NAME='valoresHistoricosCartera')
		and COLUMN_NAME=@CAMPO
	END
	
	IF @PERMITIR=1
	BEGIN
		INSERT INTO RIESGOS.FORMULAS
		VALUES(@VARIABLE,@ECUACION,@DESCRIPCION,@CAMPO)
	END
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarFormulaCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Guardar nuevo registro formula cartera colectiva
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarFormulaCartera]
@IDCARTERA INT,
@IDFORMULA INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EXISTE INT
	
	SET @EXISTE=0
	
	SELECT @EXISTE=1 FROM RIESGOS.FORMULASCARTERA WHERE IDCARTERA=@IDCARTERA AND IDFORMULA=@IDFORMULA
	
	IF @EXISTE = 0
	BEGIN
		INSERT INTO RIESGOS.FORMULASCARTERA
		VALUES(@IDCARTERA,@IDFORMULA,null)
	END

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarHaircut]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 06-07-2011
-- DESCRIPTION:	INSERTAR HAIRCUTS DESCARGADOS DESDE EL BANCO DE LA REPUBLICA
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarHaircut] 
@FECHADESDE DATETIME,
@FECHAHASTA DATETIME,
@NUMEROEMISION INT,
@VALORHAIRCUT DECIMAL(12,2),
@TCO_PLAZO INT
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO RIESGOS.HAIRCUTS
VALUES(@FECHADESDE,@FECHAHASTA,@NUMEROEMISION,@VALORHAIRCUT,@TCO_PLAZO)

SELECT @@ROWCOUNT
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarHomologacionNemotecnicos]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	Insertar homologaciones nemotecnicos
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarHomologacionNemotecnicos]
@MNEMOTECNICOSEN VARCHAR(15),
@NEMOTECNICOLOCAL VARCHAR(15)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EXIST INT
	
	SELECT @EXIST=COUNT(ID) FROM RIESGOS.HOMOLOGACIONNEMOTECNICO
	WHERE MNEMOTECNICOSEN=@MNEMOTECNICOSEN

	IF @EXIST = 0 AND LEN(@MNEMOTECNICOSEN) > 0 AND LEN(@NEMOTECNICOLOCAL) > 0 
	BEGIN	
		INSERT INTO RIESGOS.HOMOLOGACIONNEMOTECNICO
		VALUES(@MNEMOTECNICOSEN,@NEMOTECNICOLOCAL)
	END
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarLogDescargaArchivosBanRep]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 06-07-2011
-- DESCRIPTION:	INSERTAR LOG ARCHIVOS DESCARGADOS DESDE EL BANCO DE LA REPUBLICA
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarLogDescargaArchivosBanRep] 
@RUTA	VARCHAR(150),
@FECHAACTUALIZACION DATETIME,
@TOTALREG INT
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO Riesgos.logDescargaArchivosBanRep
VALUES(
@RUTA,
@FECHAACTUALIZACION,
@TOTALREG
)

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_InsertarValoresInicialesHistoricoCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 21/07/2011
-- Description:	Insertar registros Riesgos.valoresHistoricosCartera
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_InsertarValoresInicialesHistoricoCartera]
@IDCARTERA INT,
@FECHAHISTORICO DATETIME,
@VALORTOTALCARTERA DECIMAL(20,4),
@VALORTOTALCARTERAANT DECIMAL(20,4)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EXIST INT
	
	SELECT @EXIST=COUNT(*) FROM RIESGOS.VALORESHISTORICOSCARTERA
	WHERE idCartera=@IDCARTERA AND fechaHistorico=@FECHAHISTORICO
	
	IF @EXIST = 0
	BEGIN
		INSERT INTO RIESGOS.VALORESHISTORICOSCARTERA(IDCARTERA,FECHAHISTORICO,VALORTOTALCARTERA,VALORTOTALCARTERAANTERIOR)
		VALUES(@IDCARTERA,@FECHAHISTORICO,@VALORTOTALCARTERA,@VALORTOTALCARTERAANT)

		INSERT INTO RIESGOS.IRLHISTORICO(IDCARTERA,FECHACALCULOIRL)
		VALUES(@IDCARTERA,@FECHAHISTORICO)
	END

END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_LimpiarTablaEmision]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	LIMPIAR TABLE HAIRCUT
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_LimpiarTablaEmision]
AS
BEGIN
	SET NOCOUNT ON;
TRUNCATE TABLE Riesgos.emisionesBanRep
END

GO
/****** Object:  StoredProcedure [Riesgos].[paCalculoIRL_LimpiarTablaHaircut]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 11/07/2011
-- Description:	LIMPIAR TABLE HAIRCUT
-- =============================================
CREATE PROCEDURE [Riesgos].[paCalculoIRL_LimpiarTablaHaircut]
AS
BEGIN
	SET NOCOUNT ON;
TRUNCATE TABLE Riesgos.haircuts
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarAperturasAdicionesCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 08-06-2011
-- DESCRIPTION:	OBTENER INFORMACION CONSOLIDADA DE APERTURAS Y ADICIONES EN LAS CARTERAS COLECTIVAS
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarAperturasAdicionesCartera] 
	@FECHAACT DATETIME,
	@CARTERA VARCHAR(80)
AS

BEGIN
	SELECT dpm.vchCodigoPortafolio, 
	dpm.datFecha AS FechaOperacion, 
	dpm.intEncargo AS Encargo, 
	s.intCodSuscriptor AS CodSuscriptor, 
	CASE s.chrTipo 
			WHEN 'N' THEN LTRIM(s.vchApellido1) + ' ' + 
						 (CASE WHEN s.vchApellido2 IS NOT NULL THEN LTRIM(s.vchApellido2 + ' ') ELSE '' END) + 
						 LTRIM(s.vchNombre1) + ' ' + 
						 (CASE WHEN s.vchNombre2 IS NOT NULL THEN LTRIM(s.vchNombre2) ELSE '' END)
			ELSE s.vchRazonSocial END AS NombreSuscriptor,
	dpm.numValor AS ValorOperacion, 
	ISNULL((dpm.numValor/hu.numValorUnidad),0) AS NoUnidades, 
	m.vchNumeroDocumento AS NoComprobrobante, 
	e.vchCodComisionista AS CodComercial, 
	t.vchNombre AS NombreComercial,
	m.chrUserNameIng AS UsuarioRegistro, 
	ISNULL(cb.vchNumeroCuenta,'') AS CuentaBancaria, 
	CASE WHEN cb.vchNumeroCuenta IS NOT NULL THEN ISNULL((SELECT b.vchNombre FROM dbsafyr.dbo.tblBancos b WHERE cb.vchBanco = b.vchCodigo),'') ELSE '' END AS Banco, 
	CASE dpm.vchCodTipoMovimiento WHEN 'AP' THEN 'APERTURA' WHEN 'AD' THEN 'ADICION' WHEN 'NC' THEN 'NOTA CREDITO' ELSE dpm.vchCodTipoMovimiento END AS TipoOperacion, 
	CASE dpm.vchCodPago WHEN 'T' THEN 'TRASNFER.' WHEN 'E' THEN 'EFECTIVO' WHEN 'C' THEN 'CHEQUE' ELSE dpm.vchCodPago END AS FormaPago,
	dpm.datFechaConsignacion AS FechaDeposito,
	SUBSTRING(e.vchEncargoMigracion,7,6) vchEncargoMigracion,
	dpm.datHora HoraRegistro,
	d.vchDireccion AS DireccionCliente,
	c.vchNombre AS CiudadCliente
	FROM dbsafyr.dbo.tblDetallePagosMovimientos dpm, dbsafyr.dbo.tblMovimientos m, dbsafyr.dbo.tblEncargos e, dbsafyr.dbo.tblSuscriptores s, dbsafyr.dbo.tblCuentaBancaria cb, dbsafyr.dbo.tblComisionistas t, dbsafyr.dbo.tblHistoricoUnidad hu, dbsafyr.dbo.tblDirecciones d, dbsafyr.dbo.tblCiudades c
	WHERE (m.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@cartera,',')))
	AND m.vchCodTipoMovimiento IN ('AP','AD','NC')
	AND m.chrEstado <> 'A'
	AND m.datFecha =@FECHAACT
	AND dpm.vchCodigoPortafolio = m.vchCodigoPortafolio
	AND dpm.intEncargo = m.intEncargo
	AND dpm.intMovimiento = m.intMovimiento
	AND m.vchCodigoPortafolio = e.vchCodigoPortafolio
	AND m.intEncargo = e.intEncargo
	AND e.intCodSuscriptor = s.intCodSuscriptor
	AND dpm.intCuenta = cb.intConsecutivo
	AND e.vchCodComisionista = t.vchCodComisionista
	AND hu.vchCodigoPortafolio = m.vchCodigoPortafolio
	AND hu.datFechaAct = m.datFecha
	AND e.intCodSuscriptor = d.intCodSuscriptor
	AND e.intDireccion = d.intSecuencia
	AND d.intCiudad = c.intCiudad
	AND m.bitR <> 1
	AND m.intEncargo NOT IN (SELECT EP.intEncargoHijo FROM dbsafyr.dbo.tblEncargosParentesco EP WHERE EP.vchCodigoPortafolio = m.vchCodigoPortafolio AND Ep.datFechaOperacion=@FECHAACT)

	ORDER BY dpm.datFecha, dpm.intMovimiento
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarCierreCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 08-06-2011
-- DESCRIPTION:	OBTENER INFORMACION CONSOLIDADA LAS CARTERAS COLECTIVAS
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarCierreCartera] 
	@FECHAACT DATETIME,
	@CARTERA VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;

SELECT
      H.VCHCODIGOPORTAFOLIO, 
       ISNULL((SELECT NUMVALORFONDO FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-1,H.DATFECHAACT)),0) VALORFONDOANT
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-1,H.DATFECHAACT)),0) VALORUNIDADANT
      ,ISNULL((SELECT NUMUNIDADESCIRCULACION FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-1,H.DATFECHAACT)),0) UNIDADESCIRCULACIONANT
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('AP') AND CHRESTADO NOT IN('A') AND CHRESTADOORIGINALENCARGO <> 'R' AND INTENCARGO NOT IN (SELECT DISTINCT INTENCARGOHIJO FROM DBSAFYR.DBO.TBLENCARGOSPARENTESCO EP WHERE EP.VCHCODIGOPORTAFOLIO = H.VCHCODIGOPORTAFOLIO)),0) AS APERTURAS
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('AD') AND CHRESTADO NOT IN('A')),0) AS ADICIONES
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('NC') AND CHRESTADO NOT IN('A')),0) AS NOTASCREDITO
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('RT') AND CHRESTADO NOT IN('A')),0) AS RETIROS
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('RTI') AND CHRESTADO NOT IN('A')),0) AS RETIROSIMPUESTOS
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('CA') AND CHRESTADO NOT IN('A')),0) AS CANCELACIONES
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('CAI') AND CHRESTADO NOT IN('A')),0) AS CANCELACIONESIMPUESTOS
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('RP') AND CHRESTADO NOT IN('A')),0) AS PENALIZACIONES
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('ND') AND CHRESTADO NOT IN('A')),0) AS NOTASDEBITO
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('CHD') AND CHRESTADO NOT IN('A')),0) AS MOVIMIENTOSANULACIONES
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('UTX') AND CHRESTADO NOT IN('A')),0) AS MOVIMIENTOSRENDIMIENTOSEXTRAS
      ,ISNULL((SELECT SUM(NUMVALOR) FROM DBSAFYR.DBO.TBLDETALLEPAGOSMOVIMIENTOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA = H.DATFECHAACT AND VCHCODTIPOMOVIMIENTO IN ('RFX') AND CHRESTADO NOT IN('A')),0) AS MOVIMIENTOSRETENCIONESEXTRAS
      ,ISNULL(H.NUMRENDIMIENTOS,0) RENDIMIENTOSABONADOS
      ,ISNULL(H.NUMVALORCOMISION,0) COMISIONCOBRADA
      ,ISNULL(H.NUMVALORCOMISIONEXITO,0) COMISIONEXITO
      ,ISNULL(H.NUMVALORIVA,0) IVACOBRADO
      ,ISNULL(H.NUMVALORRETENCION,0) RETENCIONPRACTICADA
      ,ISNULL(H.NUMVALORFONDO,0) VALORFONDO
      ,ISNULL(H.NUMVALORUNIDAD,0) VALORUNIDAD
      ,ISNULL(H.NUMUNIDADESCIRCULACION,0) UNIDADESCIRCULACION
      ,ISNULL(H.NUMVALORCOMISIONACU,0) COMISIONCOBRADAACU
      ,ISNULL(H.NUMVALORIVAACU,0) IVACOBRADOACU
      ,ISNULL(H.NUMVALORIMPUESTOACU,0) NUMVALORIMPUESTOACU
      ,ISNULL(H.NUMVALORRETENCIONACU,0) RETENCIONPRACTICADAACU
      ,ISNULL((SELECT COUNT(INTENCARGO) FROM DBSAFYR.DBO.TBLSALDOSENCARGOSDEFINITIVOS WITH(NOLOCK)WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA =H.DATFECHAACT),0) ENCARGOSPROCESADOS
      ,ISNULL((SELECT COUNT(DISTINCT INTCODSUSCRIPTOR) FROM DBSAFYR.DBO.TBLSALDOSENCARGOSDEFINITIVOS WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHA =H.DATFECHAACT AND NUMVALORPESOS <> 0),0) CLIENTESACTIVOS
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-7,H.DATFECHAACT)),0) VALORUNIDADSEMANAL
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-30,H.DATFECHAACT)),0) VALORUNIDADMENSUAL
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-180,H.DATFECHAACT)),0) VALORUNIDADSEMESTRAL
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-365,H.DATFECHAACT)),0) VALORUNIDADANUAL
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT =DATEADD(DAY,-(DAY(H.DATFECHAACT)),H.DATFECHAACT)),0) VALORUNIDADMESCORRIDO
      ,ISNULL((SELECT NUMVALORUNIDAD FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD WITH(NOLOCK) WHERE VCHCODIGOPORTAFOLIO =H.VCHCODIGOPORTAFOLIO AND DATFECHAACT ='01/01/'+ CAST(YEAR(H.DATFECHAACT) AS CHAR(4))),0) VALORUNIDADANOCORRIDO
      ,DAY(H.DATFECHAACT) AS DIASMESCORRIDO
      ,DATEDIFF(DAY,'01/01/' + CAST(YEAR(H.DATFECHAACT) AS CHAR(4)), H.DATFECHAACT) AS DIASANOCORRIDO
      ,ISNULL((SELECT CASE WHEN CHRTIPOTASACOMISION = 'T' AND VCHTIPOCOMISIONFIJA = 'P' THEN NUMCOMISIONFIJA ELSE 0 END FROM DBSAFYR.DBO.TBLCONFIGURACIONFONDOS WITH(NOLOCK) WHERE VCHCODIGOFONDO = H.VCHCODIGOPORTAFOLIO),0) FACTORCOMISION
FROM DBSAFYR.DBO.TBLHISTORICOUNIDAD H WITH(NOLOCK) 
WHERE H.DATFECHAACT=@FECHAACT AND H.VCHCODIGOPORTAFOLIO=@CARTERA
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarComprasyVentasCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 13-06-2011
-- Description:	Consultar Compras y ventas carteras colectivas
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarComprasyVentasCartera]
@FechaAct datetime,
@CodigoPortafolio varchar(80)
AS
BEGIN
	SET NOCOUNT ON;
		select
		intConsecutivo,vchCodigoPortafolio,datFechaCuadre,vchLiquidacion,chrTipoOperacion,vchClasificacion,
		vchTipoCumplimiento,vchCodPlazo,chrEstadoDePosicion,o.intIDEspecie,numValorNominal,numPrecio,
		numValorDeGiro,numBaseAutoRetencion,numAutoRetencion,numTotalAjustes,numIva,numCosto,numValorCompra,
		numValorUtilidad,numTIRCompra,numVPNMercado,numVARTasa,numVARUnidad,datFechaOperacion,
		datFechaCumplimiento,vchArchivo,o.chrEstado,numComision,numTIRCompraOriginal,numValorPrecioLimpioCompra,
		vchClasificacionInversion,chrTipoRetefuente,chrTipoOpeDV,
		eh.vchNemotecnico,datFechaEmision,datFechaVencimiento,numTasa,eh.numPorcenAutoretencion,e.vchDescripcion
		FROM dbSafyr.DBO.tblOperaciones O 
		INNER JOIN dbSafyr.DBO.tblSociedades S ON S.intCodSociedad = O.intCodContraparte 
		INNER JOIN dbSafyr.DBO.tblEspeciesHijas EH ON o.intIDEspecie = eh.intIDEspecie
		INNER JOIN dbSafyr.DBO.TblEspecies E ON E.intID = EH.intIDPadre 
		INNER JOIN dbSafyr.DBO.tblTitulos T ON E.vchTipoTitulo = T.vchTitulo
		where datFechaOperacion=@FechaAct and vchClasificacion='NORMAL'
		and vchcodigoportafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@CodigoPortafolio,','))
		order by vchCodigoPortafolio
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarCupones]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 13-06-2011
-- Description:	Consulta de cupones Carteras colectivas (Safyr)
--EXEC Riesgos.paWebServiceSafyr_ConsultarCupones '2011-04-15 00:00:00','OCCIVALOR'
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarCupones] 
@FechaAct datetime,
@CodigoPortafolio varchar(80)
AS
BEGIN
	SET NOCOUNT ON;
SELECT PTD.VCHCODIGOPORTAFOLIO, PTD.INTIDESPECIE,'RPI' AS VCHTIPORENDIMIENTO,PTD.VCHCLASIFICACION,
EH.VCHNEMOTECNICO, EH.DATFECHAEMISION,EH.DATFECHAVENCIMIENTO,FDE.INTIDFLUJO,
FDE.DATFECHAFLUJO, FDE.INTNUMDIASENTREFLUJOS,PTD.VCHCODIGOTITULO,PTD.DATFECHACOMPRA,
PTD.NUMRENDIMIENTOS,PTD.NUMTOTALRENDIMIENTOSANT,PTD.NUMTOTALRENDIMIENTOS,PTD.VCHMETODOVALORACION,
PTD.NUMVALORNOMINAL,PTD.NUMVALORCOMPRA,ptd.chrEstado
FROM DBSAFYR.DBO.TBLPORTAFOLIODETITULOSPORDIAS PTD, DBSAFYR.DBO.TBLESPECIESHIJAS EH, DBSAFYR.DBO.TBLESPECIES E ,  DBSAFYR.DBO.TBLFLUJOSDEESPECIES FDE
WHERE PTD.INTIDESPECIE = EH.INTIDESPECIE  
AND E.INTID = EH.INTIDPADRE 
AND EH.INTIDESPECIE = FDE.INTIDESPECIE  AND E.BITPAGARECONFLUJOSIRREGULARES = 0
AND (FDE.DATFECHAFLUJO <> EH.DATFECHAVENCIMIENTO)
AND (FDE.DATFECHAFLUJO=PTD.DATFECHAACT)  
AND PTD.VCHCODIGOPORTAFOLIO IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@CodigoPortafolio,','))
AND PTD.DATFECHAACT=@FechaAct AND PTD.NUMRENDIMIENTOS > 0
AND PTD.CHRESTADO='A'
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarDisponible]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 13-06-2011
-- Description:	Consulta el disponible de las carteras colectivas
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarDisponible] 
@FechaAct datetime,
@CodigoPortafolio varchar(80)
AS
BEGIN
	SET NOCOUNT ON;

SELECT  scb.datFecha
		,cb.vchCodigoPortafolio
		,cb.vchNumeroCuenta
		,cb.intConsecutivo
		,b.vchNombre
		,(scb.numValor - scb.numRendimientos) numValor
		,scb.numValor VnpHoy
		,scb.numRendimientos Diferencia
FROM dbSafyr.dbo.tblCuentaBancaria cb 
INNER JOIN dbSafyr.dbo.tblSaldoCuentasBancariasFondos scb ON cb.intConsecutivo = scb.intCuenta 
INNER JOIN dbSafyr.dbo.tblBancos b ON cb.vchBanco =  b.vchCodigo
WHERE     (cb.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@CodigoPortafolio,',')) AND (scb.datFecha = @FechaAct))

END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarPortafolioDetallado]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Olaciregui
-- Create date: 08-06-2011
-- Description:	Obtener informacion detallada del portafolio de cada una cartera colectiva
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarPortafolioDetallado] 
	@FechaAct datetime, 
	@codPortafolio varchar(80)
AS
BEGIN
SET NOCOUNT ON;

SELECT 
pd.vchCodigoTitulo,
pd.vchClasificacion Clasificacion,
pd.chrTipoSim TipoSimultanea, 
e.vchDescripcion Especie, 
eh.vchNemotecnico Nemotecnico, 
em.vchNombreEmisor NombreEmisor, 
(DATENAME(dd,eh.datFechaEmision) + '/' + CAST(DATEPART(mm,eh.datFechaEmision) AS VARCHAR(2)) + '/' + DATENAME(yyyy,eh.datFechaEmision)) FechaEmision, 
(DATENAME(dd,eh.datFechaVencimiento) + '/' + CAST(DATEPART(mm,eh.datFechaVencimiento) AS VARCHAR(2)) + '/' + DATENAME(yyyy, eh.datFechaVencimiento)) FechaVencimiento, 
CASE  e.vchTipoTitulo WHEN 'PRF' THEN DATEDIFF(DAY, pd.datFechaAct, eh.datFechaVencimiento) ELSE 0 END DiasAlVencimiento, 
pd.numDuracion DuracionMeses, 
(eh.numTasa * 100) TasaFacial, 
e.chrPeriodicidad PeriodicidadPago, 
pd.datFechaCompra AS FechaCompra, 
SUM(pd.numValorNominal) ValorNominal, 
SUM(pd.numValorCompra) ValorCompra, 
pd.numTIRCompraOriginal TirCompraOriginal, 
SUM(pd.numValorCompra + pd.numTotalAjustesAVPN + pd.numTotalAjustesATIR - pd.numTotalRendimientos) Vpn, 
pd.numTIRDeVPN TirdeVpn, 
pd.vchMetodoValoracion MetodoValoracion, 
CASE WHEN pd.numValorPrecio <> 0 THEN pd.numValorPrecio ELSE pd.numMargen END ValorInfoval, 
SUM(pd.numTotalAjustesAVPN) CausacionAjusteVpn, 
pd.vchClasificacionInversion 
FROM dbSafyr.dbo.tblPortafolioDeTitulosPorDias pd, dbSafyr.dbo.tblEspeciesHijas eh, dbSafyr.dbo.tblEspecies e, dbSafyr.dbo.tblEmisores em, dbSafyr.dbo.tblOperaciones op,dbSafyr.dbo.tblTitulos t 
WHERE pd.intIDEspecie = eh.intIDEspecie AND 
eh.intIDPadre = e.intID AND 
e.vchCodEmisor = em.vchCodEmisor AND 
pd.vchCodigoPortafolio = op.vchCodigoPortafolio AND 
pd.intConsecutivoOperacion = op.intConsecutivo AND 
pd.chrTipoSim NOT IN ('A') AND 
e.vchTipoTitulo = t.vchTitulo AND 
pd.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@codPortafolio,',')) AND 
pd.datFechaAct = @FechaAct
GROUP BY
pd.vchCodigoTitulo,
pd.vchClasificacion, 
pd.chrTipoSim, 
e.vchDescripcion, 
eh.vchNemotecnico, 
em.vchNombreEmisor, 
(DATENAME(dd,eh.datFechaEmision) + '/' + CAST(DATEPART(mm,eh.datFechaEmision) AS VARCHAR(2)) + '/' + DATENAME(yyyy,eh.datFechaEmision)), 
(DATENAME(dd,eh.datFechaVencimiento) + '/' + CAST(DATEPART(mm,eh.datFechaVencimiento) AS VARCHAR(2)) + '/' + DATENAME(yyyy, eh.datFechaVencimiento)), 
CASE  e.vchTipoTitulo WHEN 'PRF' THEN DATEDIFF(DAY, pd.datFechaAct, eh.datFechaVencimiento) ELSE 0 END, 
pd.numDuracion, 
(eh.numTasa * 100), 
e.chrPeriodicidad, 
pd.numTIRCompraOriginal, 
pd.numTIRDeVPN, 
pd.vchMetodoValoracion, 
CASE WHEN pd.numValorPrecio <> 0 THEN pd.numValorPrecio ELSE pd.numMargen END, pd.datFechaCompra,
pd.vchClasificacionInversion
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarReposCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 13-06-2011
-- Description:	Consulta de repos Carteras colectivas (Safyr)
--EXEC Riesgos.paWebServiceSafyr_ConsultarReposCartera '2011-05-06 00:00:00','OCCIPREMIUM'
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarReposCartera] 
@FechaAct datetime,
@CodigoPortafolio varchar(80)
AS
BEGIN
	SET NOCOUNT ON;
SELECT  O.vchCodigoPortafolio, 
O.datFechaCuadre AS datFechaCuadre,
O.datFechaOperacion AS datFechaOperacion,
O.intConsecutivo, O.vchLiquidacion, O.chrTipoOperacion, 
O.vchClasificacion, O.chrTipoSIM, 
O.chrEstadoDePosicion, T.chrClasificacion, 
O.intIDEspecie, E.vchTipoTitulo, 
EH.vchNemotecnico, 
EH.datFechaEmision AS Emision,
EH.datFechaVencimiento AS Vencimiento, 
E.vchTasaRef, EH.numTasa*100 AS TasaFacial,  E.chrPeriodicidad, O.numValorNominal, O.numTIRCompra, O.numMargenPropio, O.numValorDeGiro, O.numCosto, O.numValorCompra, O.numValorUtilidad, O.numComision, O.numIva, O.numValorDeGiroFuturo, 
isnull(O.datFechaFutura,'') AS Futura, S.vchRazonSocial, O.vchCodComisionista, O.vchArchivo, O.chrEstado  
FROM dbSafyr.DBO.tblOperaciones O 
INNER JOIN dbSafyr.DBO.tblSociedades S ON S.intCodSociedad = O.intCodContraparte 
INNER JOIN dbSafyr.DBO.tblEspeciesHijas EH ON o.intIDEspecie = eh.intIDEspecie
INNER JOIN dbSafyr.DBO.TblEspecies E ON E.intID = EH.intIDPadre 
INNER JOIN dbSafyr.DBO.tblTitulos T ON E.vchTipoTitulo = T.vchTitulo
WHERE O.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@CodigoPortafolio,',')) AND O.chrEstado <>'A'
AND O.datFechaCuadre = @FechaAct AND O.chrTipoOperacion='V'
AND O.vchClasificacion='REPO'
ORDER BY O.intConsecutivo
END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarRetirosCancelacionesCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		DAVID OLACIREGUI
-- CREATE DATE: 08-06-2011
-- DESCRIPTION:	OBTENER INFORMACION DE CANCELACIONES EN LAS CARTERAS COLECTIVAS
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarRetirosCancelacionesCartera] 
	@FECHAACT DATETIME,
	@CARTERA VARCHAR(80)
AS

BEGIN

DECLARE @SQLQUERY VARCHAR(6000),
        @WHERE VARCHAR(2000),
        @COUNT INT

	SET @COUNT= (SELECT COUNT(items) from Riesgos.fnCalculoIRLSplit(@CARTERA,','))

SET @SQLQUERY =
	'SELECT dpm.vchCodigoPortafolio, 
	dpm.datFecha AS FechaOperacion, 
	dpm.intEncargo AS Encargo, 
	s.intCodSuscriptor AS CodSuscriptor, 
	CASE s.chrTipo 
			WHEN ''N'' THEN LTRIM(s.vchApellido1) + '' '' + 
						 (CASE WHEN s.vchApellido2 IS NOT NULL THEN LTRIM(s.vchApellido2 + '' '') ELSE '''' END) + 
						 LTRIM(s.vchNombre1) + '' '' + 
						 (CASE WHEN s.vchNombre2 IS NOT NULL THEN LTRIM(s.vchNombre2) ELSE '''' END)
			ELSE s.vchRazonSocial END AS NombreSuscriptor,
	dpm.numValor AS ValorOperacion, 
	ISNULL((SELECT dpm1.numValor 
			FROM DBSAFYR.DBO.tblDetallePagosMovimientos dpm1 
			WHERE dpm1.vchCodigoPortafolio = dpm.vchCodigoPortafolio
				AND dpm1.intEncargo = dpm.intEncargo
				AND dpm1.intMovimiento = dpm.intMovimiento
				AND dpm1.vchNumeroDocumento = dpm.vchNumeroDocumento
				AND dpm1.vchCodTipoMovimiento IN (''RTI'',''CAI'')),0) AS ValorImpuesto,
	ISNULL((dpm.numValor/hu.numValorUnidad),0) AS NoUnidades, 
	m.vchNumeroDocumento AS NoComprobrobante, 
	e.vchCodComisionista AS CodComercial, 
	t.vchNombre AS NombreComercial,
	m.chrUserNameIng AS UsuarioRegistro, 
	ISNULL(cb.vchNumeroCuenta,'''') AS CuentaBancaria, 
	CASE WHEN cb.vchNumeroCuenta IS NOT NULL THEN ISNULL((SELECT b.vchNombre FROM DBSAFYR.DBO.tblBancos b WHERE cb.vchBanco = b.vchCodigo),'''') ELSE '''' END AS Banco, 
	CASE dpm.vchCodTipoMovimiento WHEN ''RT'' THEN ''RETIRO'' WHEN ''CA'' THEN ''CANCELACION'' WHEN ''ND'' THEN ''NOTA DEBITO'' ELSE dpm.vchCodTipoMovimiento END AS TipoOperacion, 
	CASE dpm.vchCodPago WHEN ''T'' THEN ''TRASNFER.'' WHEN ''E'' THEN ''EFECTIVO'' WHEN ''C'' THEN ''CHEQUE'' ELSE dpm.vchCodPago END AS FormaPago,
	CASE dpm.vchCodPago WHEN ''C'' THEN ISNULL(dpm.vchDocId + '' - '' + dpm.vchNombre,'''') WHEN ''T'' THEN ISNULL((SELECT ISNULL(C.vchNit,'''') + ''-'' + ISNULL(C.vchNombreTitular,'''') FROM DBSAFYR.DBO.tblCuentaBancaria C WHERE C.intConsecutivo = CAST(dpm.vchCodCuentaDestino AS INT) AND C.bitTitular = 0),'''') ELSE '''' END AS BeneficiarioPago,
	dpm.datFechaConsignacion AS FechaDeposito,
	SUBSTRING(e.vchEncargoMigracion,7,6) vchEncargoMigracion,
	dpm.datHora HoraRegistro,
	CASE dpm.vchCodPago WHEN ''T'' THEN ISNULL((SELECT cb2.vchNumeroCuenta + '' '' + b2.vchNombre FROM DBSAFYR.DBO.tblCuentaBancaria cb2, DBSAFYR.DBO.tblBancos b2 WHERE cb2.intConsecutivo = dpm.vchCodCuentaDestino AND cb2.vchBanco = b2.vchCodigo),'''') ELSE '''' END AS CuentaDestino
	FROM DBSAFYR.DBO.tblDetallePagosMovimientos dpm 
	JOIN DBSAFYR.DBO.tblMovimientos m  ON 	dpm.vchCodigoPortafolio = m.vchCodigoPortafolio AND dpm.intEncargo = m.intEncargo AND dpm.intMovimiento = m.intMovimiento
	JOIN DBSAFYR.DBO.tblEncargos e ON m.vchCodigoPortafolio = e.vchCodigoPortafolio AND m.intEncargo = e.intEncargo
	JOIN DBSAFYR.DBO.tblSuscriptores s ON e.intCodSuscriptor = s.intCodSuscriptor
	JOIN DBSAFYR.DBO.tblCuentaBancaria cb ON dpm.intCuenta = cb.intConsecutivo
	JOIN DBSAFYR.DBO.tblComisionistas t ON e.vchCodComisionista = t.vchCodComisionista
	JOIN DBSAFYR.DBO.tblHistoricoUnidad hu ON hu.vchCodigoPortafolio = m.vchCodigoPortafolio AND hu.datFechaAct = m.datFecha'
	
	
	IF @COUNT = 1
	BEGIN
		SET @WHERE =' WHERE (m.vchCodigoPortafolio IN ('''+@CARTERA+'''))
		AND dpm.vchCodTipoMovimiento IN (''RT'',''CA'',''ND'')
		AND m.chrEstado <> ''A''
		AND m.datFecha ='''+CONVERT(VARCHAR,@FECHAACT,101)
		+''' ORDER BY dpm.datFecha, dpm.intMovimiento'
	END
	ELSE
	BEGIN
		SET @WHERE = ' WHERE (m.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit('''+@CARTERA+''','','')))
		AND dpm.vchCodTipoMovimiento IN (''RT'',''CA'',''ND'')
		AND m.chrEstado <> ''A''
		AND m.datFecha ='''+CONVERT(VARCHAR,@FECHAACT,101)
		+''' ORDER BY dpm.datFecha, dpm.intMovimiento'
	END
	
	
	SET @SQLQUERY = @SQLQUERY + @WHERE
	--PRINT(@SQLQUERY)
	EXECUTE(@SQLQUERY)

END

GO
/****** Object:  StoredProcedure [Riesgos].[paWebServiceSafyr_ConsultarSimultaneasCartera]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	David Olaciregui
-- Create date: 13-06-2011
-- Description:	Consulta de Simultaneas activas Carteras colectivas (Safyr)
--EXEC Riesgos.paWebServiceSafyr_ConsultarSimultaneasCartera '2011-05-06 00:00:00','OCCIPREMIUM'
-- =============================================
CREATE PROCEDURE [Riesgos].[paWebServiceSafyr_ConsultarSimultaneasCartera] 
@FechaAct datetime,
@CodigoPortafolio varchar(80)
AS
BEGIN
	SET NOCOUNT ON;
SELECT  O.vchCodigoPortafolio, 
O.datFechaCuadre AS datFechaCuadre,
O.datFechaOperacion AS datFechaOperacion,
O.intConsecutivo, O.vchLiquidacion, O.chrTipoOperacion, 
O.vchClasificacion, O.chrTipoSIM, 
O.chrEstadoDePosicion, T.chrClasificacion, 
O.intIDEspecie, E.vchTipoTitulo, 
EH.vchNemotecnico, 
EH.datFechaEmision AS Emision,
EH.datFechaVencimiento AS Vencimiento, 
E.vchTasaRef, EH.numTasa*100 AS TasaFacial,  E.chrPeriodicidad, O.numValorNominal, O.numTIRCompra, O.numMargenPropio, O.numValorDeGiro, O.numCosto, O.numValorCompra, O.numValorUtilidad, O.numComision, O.numIva, O.numValorDeGiroFuturo, 
isnull(O.datFechaFutura,'') AS Futura, S.vchRazonSocial, O.vchCodComisionista, O.vchArchivo, O.chrEstado  
FROM dbSafyr.DBO.tblOperaciones O 
INNER JOIN dbSafyr.DBO.tblSociedades S ON S.intCodSociedad = O.intCodContraparte 
INNER JOIN dbSafyr.DBO.tblEspeciesHijas EH ON o.intIDEspecie = eh.intIDEspecie
INNER JOIN dbSafyr.DBO.TblEspecies E ON E.intID = EH.intIDPadre 
INNER JOIN dbSafyr.DBO.tblTitulos T ON E.vchTipoTitulo = T.vchTitulo
WHERE O.vchCodigoPortafolio IN (select items collate SQL_Latin1_General_CP1_CI_AS from Riesgos.fnCalculoIRLSplit(@CodigoPortafolio,',')) AND O.chrEstado <>'A'
AND O.datFechaCuadre = @FechaAct AND O.chrTipoOperacion='V'
AND O.vchClasificacion='SIM'
ORDER BY O.intConsecutivo
END

GO
/****** Object:  StoredProcedure [Seguridad].[paActualizarSeguridad]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Seguridad].[paActualizarSeguridad]
AS
BEGIN
	DECLARE @Usuario VARCHAR(100),@Cargo VARCHAR(100), @Depto VARCHAR(100)
	DECLARE @Id_Rol INT, @Id_Grupo INT
	IF EXISTS (SELECT 1 FROM SYSOBJECTS WHERE name = 'Active_Directory' AND XTYPE = 'U')
		DROP TABLE Active_Directory

	SELECT sAMAccountName, givenName, sn, displayName, title, department,telephoneNumber,physicalDeliveryOfficeName, 
	CASE WHEN streetAddress IS NULL THEN CONVERT(VARCHAR,DATEADD(MONTH,-1,GETDATE()),20) ELSE streetAddress END streetAddress
	INTO Active_Directory
	FROM
	OpenQuery(ADSI,'SELECT telephoneNumber,streetAddress,physicalDeliveryOfficeName, department, title, sAMAccountName, displayName, Name, givenName, sn, userAccountControl  FROM ''LDAP://DC=valooccidente,DC=net''')
	WHERE sAMAccountName IS NOT NULL AND DEPARTMENT IS NOT NULL

	DECLARE Cur_Usuario CURSOR FOR
		SELECT sAMAccountName, title, department 
		FROM Active_Directory
		WHERE TITLE IS NOT NULL
		
		OPEN  Cur_Usuario
			FETCH NEXT FROM Cur_Usuario INTO @Usuario, @Cargo,@Depto
			WHILE @@FETCH_STATUS=0    
			BEGIN    
				EXEC Seguridad.paSeguridadGrupoRol @Depto,@Cargo
				FETCH NEXT FROM Cur_Usuario INTO @Usuario, @Cargo,@Depto
			END  
		CLOSE Cur_Usuario  
		DEALLOCATE Cur_Usuario
END

GO
/****** Object:  StoredProcedure [Seguridad].[paInsertarSeguridadAplicacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Seguridad].[paInsertarSeguridadAplicacion] 
@sigla VARCHAR(10),
@nombre_aplicacion VARCHAR(50),
@url_aplicacion VARCHAR(100),
@Imagen VARCHAR(50)
AS
BEGIN
	INSERT INTO  Seguridad.Aplicacion VALUES(@sigla,@nombre_aplicacion,@url_aplicacion,@Imagen,1)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerAccionByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerAccionByID
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene una accion por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerAccionByID]
@IDACCION INT 
AS
BEGIN
	SELECT * FROM Seguridad.Accion WITH(NOLOCK)
	WHERE ID_ACCION  = 	@IDACCION
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerAccionByNivel]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerAccionByNivel
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene las aplicaciones por grupo
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerAccionByNivel]
@id_nivel INT 
AS
BEGIN
	SELECT * FROM Seguridad.NivelAccion WITH(NOLOCK)
	WHERE id_nivel = @id_nivel
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerAplicacionByGrupo]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerAplicacionByGrupo
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene las aplicaciones por grupo
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerAplicacionByGrupo]
@id_grupo INT 
AS
BEGIN
	SELECT * FROM Seguridad.GrupoAplicacion WITH(NOLOCK)
	WHERE id_grupo = @id_grupo
END





GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerAplicacionByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerAplicacionByID
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene una Aplicacion por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerAplicacionByID]
@ID_APLICACION INT 
AS
BEGIN
	SELECT * FROM Seguridad.Aplicacion WITH(NOLOCK)
	WHERE ID_APLICACION  = 	@ID_APLICACION
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerGrupoByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerAplicacionByID
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene un grupo por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerGrupoByID]
@id_grupo INT 
AS
BEGIN
	SELECT * FROM Seguridad.Grupo WITH(NOLOCK)
	WHERE id_grupo  = 	@id_grupo
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerGrupoByRol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerGrupoByRol
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene los roles de un grupo
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerGrupoByRol]
@id_rol INT 
AS
BEGIN
	SELECT * FROM Seguridad.GrupoRol WITH(NOLOCK)
	WHERE id_rol = @id_rol
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerNivelByAplicacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerNivelByAplicacion
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene las aplicaciones por grupo
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerNivelByAplicacion]
@id_aplicacion INT 
AS
BEGIN
	SELECT * FROM Seguridad.Nivel WITH(NOLOCK)
	WHERE id_aplicacion = @id_aplicacion
END




GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerNivelByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerNivelByID
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene un nivel por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerNivelByID]
@id_nivel INT 
AS
BEGIN
	SELECT * FROM Seguridad.Nivel WITH(NOLOCK)
	WHERE id_nivel  = 	@id_nivel
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerRolByGrupo]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerRolByGrupo
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene los roles de un grupo
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerRolByGrupo]
@id_grupo INT 
AS
BEGIN
	SELECT * FROM Seguridad.GrupoRol WITH(NOLOCK)
	WHERE id_grupo = @id_grupo
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerRolByID]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerRolByID
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene un nivel por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerRolByID]
@id_rol INT 
AS
BEGIN
	SELECT * FROM Seguridad.Rol WITH(NOLOCK)
	WHERE id_rol  = 	@id_rol
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerRolByNombre]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Nombre: Seguridad.paSeguridad_ObtenerRolByNombre
	Autor: Yoany Gomez Zapata
	Fecha: 13 de Octubre 2010

	Descripcion : Obtiene un nivel por ID
*/
CREATE PROCEDURE [Seguridad].[paSeguridad_ObtenerRolByNombre]
@nombre varchar(200) 
AS
BEGIN
	SELECT * FROM Seguridad.Rol WITH(NOLOCK)
	WHERE nombre  = 	@nombre
END



GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridad_ObtenerRolNivel]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Luis valois cruz
-- Create date: 27/10/2010
-- Description:	
---execute 
-- =============================================

CREATE  PROCEDURE [Seguridad].[paSeguridad_ObtenerRolNivel]
	
@idrol as float,
@idNivel as float

AS

select count(id_nivel) from Seguridad.RolNivel with(nolock)
where id_rol=@idrol 
and  id_nivel = @idNivel
GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadAccion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*CREAR ACCIONES*/
CREATE  PROCEDURE [Seguridad].[paSeguridadAccion]
@nombre_aplicacion VARCHAR(50),
@Accion VARCHAR(50)
AS
BEGIN	
	DECLARE @IdAplicacion INT
	
	SELECT @IdAplicacion = id_aplicacion 
	FROM Seguridad.Aplicacion 
	WHERE nombre = @nombre_aplicacion
	
	--CREAR ACCIONES
	INSERT INTO Seguridad.Accion VALUES (@IdAplicacion, @Accion,1)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadGrupoAplicacion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Seguridad].[paSeguridadGrupoAplicacion] 
@Area VARCHAR(50),
@nombre_aplicacion VARCHAR(50)
AS
BEGIN
	
	DECLARE @IdAplicacion INT, @IdGrupo INT
	
	SELECT @IdAplicacion = id_aplicacion 
	FROM Seguridad.Aplicacion 
	WHERE nombre = @nombre_aplicacion
	
	IF NOT EXISTS (SELECT 1	FROM Seguridad.Grupo WHERE nombre_grupo = @Area)
	BEGIN
		INSERT INTO Seguridad.Grupo VALUES (@Area,1)
	END
	
	SELECT @IdGrupo = id_grupo
	FROM Seguridad.Grupo
	WHERE nombre_grupo = @Area
	
	--ASOCIAR UN GRUPO A LA APLICACION
	INSERT INTO Seguridad.GrupoAplicacion VALUES(@IdGrupo, @IdAplicacion)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadGrupoNivel]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*OPCIONAL GRUPO = AREA*/
CREATE  PROCEDURE [Seguridad].[paSeguridadGrupoNivel]
@Area VARCHAR(50),
@Nivel VARCHAR(50)
AS
BEGIN
	DECLARE @IdGrupo INT, @IdNivel INT

	SELECT @IdGrupo = id_grupo
	FROM Seguridad.Grupo
	WHERE nombre_grupo = @Area
	
	SELECT @IdNivel = id_nivel
	FROM Seguridad.Nivel
	WHERE nombre = @Nivel
	
	INSERT INTO  Seguridad.GrupoNivel VALUES(@IdGrupo, @IdNivel)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadGrupoRol]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [Seguridad].[paSeguridadGrupoRol]
@Area VARCHAR(50),
@Rol VARCHAR(50)
AS
BEGIN
	DECLARE @IdGrupo INT, @IdRol INT
	
	IF NOT EXISTS (SELECT 1	FROM Seguridad.Grupo WHERE nombre_grupo = @Area)
	BEGIN
		INSERT INTO Seguridad.Grupo VALUES (@Area,1)
	END
	IF NOT EXISTS (SELECT 1 FROM Seguridad.Rol WHERE nombre = @Rol)
	BEGIN
		INSERT INTO Seguridad.Rol VALUES (@Rol,1)
	END
	
	SELECT @IdGrupo = id_grupo
	FROM Seguridad.Grupo
	WHERE nombre_grupo = @Area
	
	SELECT @IdRol = id_rol
	FROM Seguridad.Rol
	WHERE nombre = @Rol
	
	--IF NOT EXISTS(SELECT 1 FROM Seguridad.GrupoRol WHERE id_rol = @IdRol)
	--BEGIN
		INSERT INTO  Seguridad.GrupoRol VALUES(@IdGrupo, @IdRol)
	--END
END


GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadNivel]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*El nivel es el tipo de usuario CREAR LOS NIVELES DE LA APLICACION*/
CREATE  PROCEDURE [Seguridad].[paSeguridadNivel]
@Nivel VARCHAR(50),
@nombre_aplicacion VARCHAR(50)
AS
BEGIN
	DECLARE @IdAplicacion INT
	
	SELECT @IdAplicacion = id_aplicacion 
	FROM Seguridad.Aplicacion 
	WHERE nombre = @nombre_aplicacion
	
	--CREAR LOS NIVES DE LA APLICACION
	INSERT INTO Seguridad.Nivel VALUES (@Nivel, @IdAplicacion,1)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadNivelAccion]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*ASOCIAR ACCION A NIVEL PERMISO */
CREATE  PROCEDURE [Seguridad].[paSeguridadNivelAccion]
@Nivel VARCHAR(50),
@Accion VARCHAR(50)
AS
BEGIN
	DECLARE @IdAccion INT, @IdNivel INT
	
	SELECT @IdNivel = id_nivel
	FROM Seguridad.Nivel
	WHERE nombre = @Nivel
	
	SELECT @IdAccion = id_accion
	FROM  Seguridad.Accion
	WHERE nombre = @Accion
	
	--ASOCIAR ACCION A NIVEL PERMISO 
	INSERT INTO Seguridad.NivelAccion VALUES (@IdNivel,@IdAccion)
END

GO
/****** Object:  StoredProcedure [Seguridad].[paSeguridadRolNivel]    Script Date: 11/25/2020 9:08:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*OPCIONAL SI EXISTE GrupoNivel no es necesario*/
CREATE  PROCEDURE [Seguridad].[paSeguridadRolNivel]
@Nivel VARCHAR(50),
@Rol VARCHAR(50)
AS
BEGIN
	DECLARE @IdNivel INT, @IdRol INT
	
	SELECT @IdRol =  id_rol
	FROM Seguridad.Rol
	WHERE nombre = @Rol
	
	SELECT @IdNivel = id_nivel
	FROM Seguridad.Nivel
	WHERE nombre = @Nivel
	
	INSERT INTO Seguridad.RolNivel VALUES(@IdRol, @IdNivel)
END


GO
