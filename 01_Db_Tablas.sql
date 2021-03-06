USE [DbHelpDesk]
GO
/****** Object:  Table [Criptografia].[Entidad]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Criptografia].[Entidad](
	[id_entidad] [int] IDENTITY(1,1) NOT NULL,
	[nit] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[correo_electronico] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Entidad] PRIMARY KEY CLUSTERED 
(
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Criptografia].[KeyEntidad]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Criptografia].[KeyEntidad](
	[id_key] [int] IDENTITY(1,1) NOT NULL,
	[id_entidad] [int] NOT NULL,
	[key_publica] [varchar](8000) NOT NULL,
	[nombre_key_privada] [varchar](100) NOT NULL,
	[key_privada] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_KeyEntidad] PRIMARY KEY CLUSTERED 
(
	[id_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Criptografia].[Parametros]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Criptografia].[Parametros](
	[ruta_key_privadas] [varchar](500) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Active_Directory]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Active_Directory](
	[sAMAccountName] [nvarchar](4000) NULL,
	[givenName] [nvarchar](4000) NULL,
	[sn] [nvarchar](4000) NULL,
	[displayName] [nvarchar](4000) NULL,
	[title] [nvarchar](4000) NULL,
	[department] [nvarchar](4000) NULL,
	[telephoneNumber] [nvarchar](4000) NULL,
	[physicalDeliveryOfficeName] [nvarchar](4000) NULL,
	[streetAddress] [nvarchar](4000) NULL,
	[idcompany] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APLICACIONES]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APLICACIONES](
	[EMPRESA] [nvarchar](60) NULL,
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[ABREVIATURA] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arch]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arch](
	[cuenta] [float] NULL,
	[tipoident] [nvarchar](255) NULL,
	[tipoident1] [nvarchar](255) NULL,
	[doc] [nvarchar](255) NULL,
	[doc1] [nvarchar](255) NULL,
	[nombre] [nvarchar](255) NULL,
	[nombre1] [nvarchar](255) NULL,
	[nombre2] [nvarchar](255) NULL,
	[nombre3] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PARAMETRIZACION]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAMETRIZACION](
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[RESPONSABLE] [nvarchar](250) NULL,
	[PRIORIDAD_URGENTE] [int] NULL,
	[PRIORIDAD_ALTA] [int] NULL,
	[PRIORIDAD_MEDIA] [int] NULL,
	[PRIORIDAD_BAJA] [int] NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[UNIDAD_MEDIDA] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PARAMETRIZACIONCORVUS]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONCORVUS](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONDESENCRIPCION]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONDESENCRIPCION](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONEVALUACION]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONEVALUACION](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONMITRA]    Script Date: 11/25/2020 9:00:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONMITRA](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONONBASEE]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONONBASEE](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONONBASEFC]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONONBASEFC](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONONBASELC]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONONBASELC](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETRIZACIONSAP]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETRIZACIONSAP](
	[TIPOLOGIA1] [nvarchar](250) NULL,
	[TIPOLOGIA2] [nvarchar](250) NULL,
	[TIPOLOGIA3] [nvarchar](250) NULL,
	[LOGIN_RESPONSABLE] [nvarchar](50) NULL,
	[INFORMAR_A] [nvarchar](200) NULL,
	[ABREVIATURA] [nvarchar](50) NULL,
	[TIEMPOTAREA] [int] NULL,
	[TIEMPOCRITICO] [int] NULL,
	[UNIDADDEMEDIDA] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[relTipoSol_ResponsableArea]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[relTipoSol_ResponsableArea](
	[Area] [varchar](100) NULL,
	[responsable] [varchar](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbActive_Directory]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbActive_Directory](
	[sAMAccountName] [nvarchar](4000) NULL,
	[displayName] [nvarchar](4000) NULL,
	[Name] [nvarchar](4000) NULL,
	[givenName] [nvarchar](4000) NULL,
	[sn] [nvarchar](4000) NULL,
	[userAccountControl] [int] NULL,
	[Mail] [nvarchar](4000) NULL,
	[company] [nvarchar](4000) NULL,
	[title] [nvarchar](4000) NULL,
	[department] [nvarchar](4000) NULL,
	[telephoneNumber] [nvarchar](4000) NULL,
	[physicalDeliveryOfficeName] [nvarchar](4000) NULL,
	[streetAddress] [nvarchar](4000) NULL,
	[idcompany] [int] NULL,
	[isActiveAccount] [bit] NULL,
	[manager] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TbEscalamiento]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TbEscalamiento](
	[Empresa] [varchar](150) NULL,
	[TipoSolicitud] [varchar](8000) NULL,
	[numero_solicitud] [varchar](100) NULL,
	[descripcion] [varchar](500) NULL,
	[Area] [nvarchar](4000) NULL,
	[Nivel1] [varchar](250) NULL,
	[Nivel2] [varchar](250) NULL,
	[Nivel3] [varchar](250) NULL,
	[Criticidad] [varchar](20) NULL,
	[Tipo_Desarrollo] [varchar](40) NULL,
	[fechaCreacion] [datetime] NULL,
	[Estado] [varchar](50) NULL,
	[responsable] [varchar](50) NULL,
	[Nombre_responsable] [varchar](501) NULL,
	[fechaCierre] [datetime] NULL,
	[Fechalimite] [datetime] NULL,
	[Solicitante] [varchar](50) NULL,
	[Nombre_Solicitante] [nvarchar](4000) NULL,
	[Cargo] [nvarchar](4000) NULL,
	[Dias_Incumplimiento] [int] NULL,
	[Ultimo_Seguimiento] [varchar](500) NULL,
	[Fecha_Estado] [datetime] NULL,
	[Nombre_Superior] [nvarchar](4000) NULL,
	[usuariont_superior] [varchar](50) NULL,
	[correo_electronico] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcasosxfinalizar]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcasosxfinalizar](
	[Empresa] [varchar](150) NULL,
	[idsolicitud] [int] NOT NULL,
	[numero_solicitud] [varchar](100) NULL,
	[descripcion] [varchar](500) NULL,
	[fechaCreacion] [datetime] NULL,
	[Solicitante] [varchar](50) NULL,
	[Nombre_Solicitante] [nvarchar](4000) NULL,
	[Cargo] [nvarchar](4000) NULL,
	[Ultimo_Seguimiento] [varchar](500) NULL,
	[Fecha_Estado] [datetime] NULL,
	[mail_solicitante] [nvarchar](4000) NULL,
	[nro_dias] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblempleados_Valoocidente]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblempleados_Valoocidente](
	[intIdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[strCodInternoEmp] [varchar](12) NOT NULL,
	[strPrimerNombre] [varchar](100) NOT NULL,
	[strSegundoNombre] [varchar](100) NULL,
	[strPrimerApellido] [varchar](30) NOT NULL,
	[strSegundoApellido] [varchar](30) NULL,
	[strCedula] [varchar](15) NOT NULL,
	[intIdCiudadCedula] [int] NOT NULL,
	[dtmFechaNac] [datetime] NULL,
	[intIdSexo] [int] NOT NULL,
	[intIdCargo] [int] NOT NULL,
	[intIdSucursal] [int] NOT NULL,
	[bitActivo] [bit] NOT NULL,
	[strTel1] [varchar](20) NULL,
	[strTel2] [varchar](20) NULL,
	[strCelular] [varchar](20) NULL,
	[strLocalizador] [varchar](20) NULL,
	[strEmail] [varchar](60) NULL,
	[strDireccion] [varchar](60) NULL,
	[dtmFechaIngreso] [datetime] NULL,
	[intIdCentroCosto] [int] NOT NULL,
	[strLogin] [varchar](50) NOT NULL,
	[intIdFirma] [int] NOT NULL,
	[dtmActualizacion] [datetime] NOT NULL,
	[strUsuario] [varchar](50) NOT NULL,
	[strNombre] [varchar](263) NULL,
	[strCodEmpleado] [varchar](4) NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[tblempleados_Valoocidente] ADD [userNameSetFx] [varchar](50) NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbletb_excluircobro_CdB]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbletb_excluircobro_CdB](
	[LNGIDCOMITENTE] [char](17) NOT NULL,
	[NOMBRE_INVERSIONISTA] [varchar](50) NULL,
	[CDCUENTA] [varchar](50) NULL,
	[IDCUENTA] [varchar](50) NULL,
	[CUENTA] [varchar](50) NULL,
	[EMISOR] [varchar](50) NULL,
	[ESPECIE] [varchar](50) NULL,
	[DESCRIPCIONESPECIE] [varchar](500) NULL,
	[FUNGDEPOSITO] [varchar](50) NULL,
	[CLASETITULO] [varchar](50) NULL,
	[DESC_CLASETITULO] [varchar](50) NULL,
	[FECHAEXPEDICION] [varchar](50) NULL,
	[FECHAVENCIMIENTO] [varchar](50) NULL,
	[TASA] [varchar](50) NULL,
	[MODALIDAD] [varchar](50) NULL,
	[SPREAD] [varchar](50) NULL,
	[TASANOMINAL] [varchar](50) NULL,
	[EFECTIVA] [varchar](50) NULL,
	[PERIODICIDAD] [varchar](50) NULL,
	[VIGENCIA] [varchar](50) NULL,
	[EXPRESADO] [varchar](50) NULL,
	[FECHAMOV] [varchar](50) NULL,
	[HORAMOV] [varchar](50) NULL,
	[NUMOPERACION] [varchar](50) NULL,
	[MECANISMO] [varchar](50) NULL,
	[TIPOMOVIMIENTO] [varchar](50) NULL,
	[LIQUIDACIONCONTADO] [varchar](50) NULL,
	[LIQUIDACIONPLAZO] [varchar](50) NULL,
	[FECHAOPERACION] [varchar](50) NULL,
	[NOMBREDEPORIGEN] [varchar](50) NULL,
	[NITDEPORIGEN] [varchar](50) NULL,
	[CODIGODEPORIGEN] [varchar](50) NULL,
	[NOMBREDEPDESTINO] [varchar](50) NULL,
	[NITDEPDESTINO] [varchar](50) NULL,
	[CODIGODEPDESTINO] [varchar](50) NULL,
	[FECHAREF] [varchar](50) NULL,
	[NUMOPEREF] [varchar](50) NULL,
	[VALORMOVIMIENTO] [varchar](50) NULL,
	[COMISIONISTA] [varchar](50) NULL,
	[etb_fusion] [float] NOT NULL,
	[otras_fusion] [float] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbLogTrasladoCartera]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbLogTrasladoCartera](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[IdTraslado] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Valor_traslado] [numeric](16, 0) NULL,
	[Fecha_traslado] [datetime] NULL,
	[Fecha_proceso] [datetime] NULL,
	[Descripcion] [varchar](100) NULL,
	[Usuario] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbParametrosTrasladoSaldo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbParametrosTrasladoSaldo](
	[Valorsaldocaja] [numeric](16, 2) NULL,
	[STRCONSECUTIVO] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_ActualizacionAutomaticaSolicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_ActualizacionAutomaticaSolicitud](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Estado_Origen] [numeric](18, 0) NULL,
	[estado_destino] [numeric](18, 0) NULL,
	[condicion] [nchar](200) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_Aplicaciones]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Aplicaciones](
	[id_aplicacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre_aplicacion] [varchar](200) NULL,
	[tipo_alpicacion] [varchar](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Area]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Area](
	[id_Area] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[activo] [bit] NULL,
	[usuario_reponsable] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_CampoDinamico]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_CampoDinamico](
	[id_campo] [int] IDENTITY(1,1) NOT NULL,
	[tipo_campo] [int] NOT NULL,
	[nombre_campo] [varchar](100) NOT NULL,
	[tipo_solicitud] [int] NOT NULL,
	[valor_default] [varchar](5000) NULL,
	[long_min] [int] NULL,
	[long_max] [int] NULL,
	[select_campo] [varchar](5000) NULL,
	[valor_campo] [varchar](5000) NULL,
	[valor_texto] [varchar](5000) NULL,
	[lista_items] [varchar](5000) NULL,
	[ORDEN] [int] NULL,
	[filtro] [bit] NULL,
	[seguimiento] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Criticidadc]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Criticidadc](
	[idCritidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_DiasFestivos]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_DiasFestivos](
	[fecha_festivo] [datetime] NULL,
	[activo] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_Empresa]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Empresa](
	[id_Empresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[activo] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_EstadoByTsol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_EstadoByTsol](
	[IdTipoSolicitud] [int] NULL,
	[IdEstado] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_EstadoSolicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_EstadoSolicitud](
	[IdSol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NULL,
	[cierra_solicitud] [bit] NULL,
	[notifica] [bit] NULL,
	[orden_prioridad] [int] NULL,
	[Multiples_asignados] [bit] NULL,
	[ColorFondo] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_GruposSol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_GruposSol](
	[idGrupoSol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_Grupo] [varchar](100) NOT NULL,
 CONSTRAINT [pk_GruposSol] PRIMARY KEY CLUSTERED 
(
	[idGrupoSol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_GrupoUsuarios]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_GrupoUsuarios](
	[idGrupoSol] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_NivelServicio]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_NivelServicio](
	[idNivel] [int] IDENTITY(1,1) NOT NULL,
	[nombreNivel] [varchar](150) NOT NULL,
	[visible] [bit] NOT NULL,
 CONSTRAINT [PK_tbSeguimiento_NivelServicio] PRIMARY KEY CLUSTERED 
(
	[idNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Parametros]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Parametros](
	[ruta_arch_solicitud] [varchar](500) NULL,
	[ruta_arch_seguimiento] [varchar](500) NULL,
	[sigla_sol] [varchar](50) NULL,
	[color_exedido] [varchar](50) NULL,
	[idtiposol_form_software] [int] NULL,
	[hora_inicio_laboral] [int] NULL,
	[hora_fin_laboral] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_PrioridadSolicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_PrioridadSolicitud](
	[idPrioridad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NULL,
	[color] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_RelAplicaciones_Solicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_RelAplicaciones_Solicitud](
	[id_aplicacion] [int] NOT NULL,
	[id_solicitud] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_RelArch_Seguimiento]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_RelArch_Seguimiento](
	[idrelArch] [int] IDENTITY(1,1) NOT NULL,
	[id_seg] [int] NULL,
	[numero_solicitud] [varchar](100) NULL,
	[nombre_archivo] [varchar](500) NULL,
	[descripcion_arch] [varchar](500) NULL,
	[fecha_cargue] [datetime] NULL,
	[usuario] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_RelArch_Solicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_RelArch_Solicitud](
	[idrelArch] [int] IDENTITY(1,1) NOT NULL,
	[id_sol] [int] NULL,
	[numero_solicitud] [varchar](100) NULL,
	[nombre_archivo] [varchar](500) NULL,
	[descripcion_arch] [varchar](500) NULL,
	[fecha_cargue] [datetime] NULL,
	[usuario] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_RelDatos_Solicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_RelDatos_Solicitud](
	[id_solicitud] [int] NOT NULL,
	[certificado] [bit] NULL,
	[posicion] [varchar](100) NULL,
	[software_add] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_RelDatosBasicos_Solicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_RelDatosBasicos_Solicitud](
	[id_solicitud] [int] NOT NULL,
	[nombre_funcionario] [varchar](200) NULL,
	[fecha_ingreso] [datetime] NULL,
	[id_sucursal] [int] NULL,
	[id_area] [int] NULL,
	[numero_identificacion] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_relTipoSol_Empresa]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_relTipoSol_Empresa](
	[idTipoSol] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
 CONSTRAINT [PK_tbSeguimiento_relTipoSol_Empresa] PRIMARY KEY CLUSTERED 
(
	[idTipoSol] ASC,
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_relTipoSol_Grupo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_relTipoSol_Grupo](
	[idTipoSol] [int] NOT NULL,
	[idGrupoSol] [int] NOT NULL,
	[idempresa] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_relTipoSol_Responsable]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_relTipoSol_Responsable](
	[idTipoSol] [int] NOT NULL,
	[usuario_responsable] [varchar](50) NOT NULL,
	[idempresa] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_relTipoSol_TipoSol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_relTipoSol_TipoSol](
	[idTipoSolicitud] [int] NOT NULL,
	[idTipoSolicitud_auto] [int] NOT NULL,
	[regla_asignacion] [varchar](500) NULL,
	[activo] [bit] NULL,
	[multiasignado] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Reporte]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Reporte](
	[IdReporte] [int] IDENTITY(1,1) NOT NULL,
	[nombreReporte] [varchar](100) NOT NULL,
	[rutaRdlc] [varchar](100) NOT NULL,
	[origenDatos] [varchar](150) NOT NULL,
	[instancia] [varchar](10) NOT NULL,
	[visible] [bit] NULL,
 CONSTRAINT [PK_tb_seguimiento_Reporte] PRIMARY KEY CLUSTERED 
(
	[IdReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Responsable]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Responsable](
	[cargo] [int] NULL,
	[idResponsable] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Apellido] [varchar](250) NOT NULL,
	[estado] [bit] NULL,
	[usuariont] [varchar](50) NULL,
	[correo_electronico] [varchar](100) NULL,
	[usuariont_superior] [varchar](50) NULL,
	[rol_sistema] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Rol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Rol](
	[id_rol] [int] NOT NULL,
	[nombre_rol] [varchar](50) NULL,
	[administrador] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Seguimiento]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Seguimiento](
	[descripcion] [varchar](500) NULL,
	[fechaInicio] [datetime] NULL,
	[fachaFinal] [datetime] NULL,
	[fk_Solicitud] [int] NULL,
	[idSeguimiento] [int] IDENTITY(1,1) NOT NULL,
	[estado] [int] NULL,
	[USUARIO] [varchar](50) NULL,
	[FECHASEGUIMIENTO] [datetime] NULL,
	[valor_campos_dinamicos] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_Solicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Solicitud](
	[asunto] [varchar](250) NULL,
	[descripcion] [varchar](500) NULL,
	[fechaAsignacion] [datetime] NULL,
	[fechaCreacion] [datetime] NULL,
	[Fechafinalizacion] [datetime] NULL,
	[idsolicitud] [int] IDENTITY(1,1) NOT NULL,
	[prioridad] [int] NULL,
	[responsable] [varchar](50) NULL,
	[fk_tipoSolicitud] [int] NULL,
	[creador] [varchar](250) NULL,
	[estado] [int] NULL,
	[area_creador] [varchar](200) NULL,
	[cargo_creador] [varchar](150) NULL,
	[numero_solicitud] [varchar](100) NULL,
	[correo_notificacion_adicional] [varchar](2000) NULL,
	[numero_solicitud_origen] [varchar](100) NULL,
	[valor_campos_dinamicos] [xml] NULL,
	[ACEPTADA] [bit] NULL,
	[IDNIVELSERVICIO] [int] NULL,
	[Solicitante] [varchar](50) NULL,
	[fechaCierre] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbseguimiento_solicitudNotificacion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbseguimiento_solicitudNotificacion](
	[idSolicitud] [int] NOT NULL,
	[fecha_Escalamiento] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbSeguimiento_Sucursal]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_Sucursal](
	[id_sucursal] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[activo] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_TipoCampoDinamico]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_TipoCampoDinamico](
	[id_campo] [int] NOT NULL,
	[nombre_campo] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_TipoDesarrollo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_TipoDesarrollo](
	[idTipoDes] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_tiposolicitud]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_tiposolicitud](
	[idTipoSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoSolicitud] [varchar](250) NULL,
	[Estado] [bit] NULL,
	[TiempoTarea] [int] NULL,
	[tiempocritico] [int] NULL,
	[unidaddeMedida] [varchar](50) NULL,
	[idtiposol_padre] [int] NULL,
	[sigla_tipo_sol] [varchar](50) NULL,
	[area] [varchar](50) NULL,
	[notifica] [bit] NULL,
	[mail_notifica] [varchar](200) NULL,
	[idPrioridad] [int] NULL,
	[sol_auto] [bit] NULL,
	[NOTIFICASEGUIMIENTO] [bit] NULL,
	[adjuntoRequerido] [bit] NULL,
	[descripcion_tsol] [varchar](500) NULL,
	[prioridad_alta] [int] NULL,
	[Prioridad_media] [int] NULL,
	[Prioridad_baja] [int] NULL,
	[Prioridad_urgente] [int] NULL,
	[Prioridad_critica] [int] NULL,
	[Prioridad_Planeada] [int] NULL,
	[RegistrarSolicitud] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_TurnosSoporte]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSeguimiento_TurnosSoporte](
	[dia_turno] [varchar](10) NULL,
	[turno_mañana] [varchar](50) NULL,
	[turno_noche] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSeguimiento_UsuarioEmpresa]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSeguimiento_UsuarioEmpresa](
	[sAMAccountName] [nvarchar](50) NOT NULL,
	[id_empresa] [numeric](18, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbTrasladoCartera]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTrasladoCartera](
	[IdTraslado] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Valor_traslado] [numeric](16, 2) NOT NULL,
	[Fecha_traslado] [datetime] NOT NULL,
	[Docnotadebito] [int] NULL,
	[Docnotacredito] [int] NULL,
	[Adicion_safyr] [bit] NULL,
	[Apertura_safyr] [bit] NULL,
	[Numero_cartera] [int] NULL,
	[Devolucion_oyd] [bit] NULL,
	[Solicitante_devolucion] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_IdTraslado] PRIMARY KEY CLUSTERED 
(
	[IdTraslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMPDISTRIBUCION]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMPDISTRIBUCION](
	[FECHA_PROCESO] [datetime] NOT NULL,
	[FECHA_INICIAL] [datetime] NULL,
	[FECHA_FINAL] [datetime] NULL,
	[MONTO_MINIMO] [int] NULL,
	[MONTO_MAXIMO] [int] NULL,
	[IDCLIENTE] [char](17) NOT NULL,
	[DOCUMENTO] [varchar](15) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[SALDO] [float] NULL,
	[NOMBRE COMERCIAL] [varchar](50) NOT NULL,
	[OPERACIONES A PLAZO] [varchar](1) NOT NULL,
	[MOVIMIENTO] [varchar](1) NOT NULL,
	[RENTA FIJA] [varchar](1) NOT NULL,
	[ACCIONES] [varchar](1) NOT NULL,
	[ENVIO CORREO] [varchar](1) NOT NULL,
	[CLIENTE_VIP] [varchar](3) NOT NULL,
	[INCONSISTENCIAS_FECHA_INICIO] [varchar](1) NOT NULL,
	[INCONSISTENCIAS_FECHA_FIN] [varchar](1) NOT NULL,
	[CONCILIACION] [varchar](1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempInformeDeuda]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempInformeDeuda](
	[IDCLIENTE] [char](17) NOT NULL,
	[ESPECIE] [varchar](15) NULL,
	[STRNOMBRE] [varchar](50) NULL,
	[TOTAL] [float] NULL,
	[DEUDA] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TMPANSSEGUIMIENTO]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPANSSEGUIMIENTO](
	[asunto] [varchar](250) NULL,
	[descripcion] [varchar](500) NULL,
	[fechaAsignacion] [datetime] NULL,
	[fechaCreacion] [datetime] NULL,
	[Fechafinalizacion] [datetime] NULL,
	[idsolicitud] [int] IDENTITY(1,1) NOT NULL,
	[prioridad] [int] NULL,
	[responsable] [varchar](50) NULL,
	[fk_tipoSolicitud] [int] NULL,
	[creador] [varchar](250) NULL,
	[estado] [int] NULL,
	[area_creador] [varchar](200) NULL,
	[cargo_creador] [varchar](150) NULL,
	[numero_solicitud] [varchar](100) NULL,
	[correo_notificacion_adicional] [varchar](2000) NULL,
	[numero_solicitud_origen] [varchar](100) NULL,
	[valor_campos_dinamicos] [xml] NULL,
	[ACEPTADA] [bit] NULL,
	[IDNIVELSERVICIO] [int] NULL,
	[Solicitante] [varchar](50) NULL,
	[fechaCierre] [datetime] NULL,
	[ans] [int] NOT NULL,
	[CMP_PRIORIDAD] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpDeceval]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpDeceval](
	[dtmdocumento] [datetime] NULL,
	[lngIDDocumento] [float] NULL,
	[strNombreConsecutivo] [nvarchar](255) NULL,
	[lngSecuencia] [float] NULL,
	[lngIDComitente] [float] NULL,
	[VALOR] [float] NULL,
	[strIDCuentaContable] [float] NULL,
	[strDetalle] [nvarchar](255) NULL,
	[strNIT] [float] NULL,
	[strdescripcion] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TMPREPORTEGENERAL]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMPREPORTEGENERAL](
	[Empresa] [varchar](150) NULL,
	[Nivel1] [varchar](250) NULL,
	[Nivel2] [varchar](250) NULL,
	[Nivel3] [varchar](250) NULL,
	[Numero_solicitud] [varchar](100) NULL,
	[Descripcion] [varchar](8000) NULL,
	[Criticidad] [varchar](20) NULL,
	[Motivo] [varchar](100) NOT NULL,
	[Tipo_Solucion] [varchar](100) NOT NULL,
	[Caso_Proveedor] [varchar](100) NOT NULL,
	[MCES] [varchar](20) NOT NULL,
	[Tipo_Desarrollo] [varchar](40) NOT NULL,
	[Avance] [varchar](20) NOT NULL,
	[Entrega_Desarrollo] [varchar](20) NOT NULL,
	[Control_de_Cambios] [varchar](20) NOT NULL,
	[Nombre_Creador] [nvarchar](4000) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Estado] [varchar](50) NOT NULL,
	[Fecha_Estado] [datetime] NULL,
	[Nombre_responsable] [varchar](501) NULL,
	[Fecha_Cierre] [datetime] NULL,
	[Area] [nvarchar](4000) NOT NULL,
	[Solicitante] [varchar](50) NULL,
	[Nombre_Solicitante] [nvarchar](4000) NOT NULL,
	[Cargo] [nvarchar](4000) NULL,
	[Dias_Creacion] [int] NULL,
	[Dias_incumplimiento] [int] NULL,
	[Ultimo_Seguimiento] [varchar](8000) NULL,
	[Usuario_USeguimiento] [nvarchar](4000) NOT NULL,
	[Fecha_USeguimiento] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[CabeceraCetificacionesMasivo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[CabeceraCetificacionesMasivo](
	[Id_Proceso] [int] IDENTITY(1,1) NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[ruta_archivos] [varchar](500) NULL,
	[Id_estado] [int] NULL,
	[numProcesados] [int] NULL,
	[numGenerados] [int] NULL,
	[numEnviados] [int] NULL,
	[fecha_proceso] [datetime] NOT NULL,
	[usuario] [varchar](200) NOT NULL,
	[IP_Proceso] [varchar](50) NULL,
 CONSTRAINT [PK_CabeceraCetificacionesMasivo] PRIMARY KEY CLUSTERED 
(
	[Id_Proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[CabeceraCetificacionesMasivoes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[CabeceraCetificacionesMasivoes](
	[Id_Proceso] [int] IDENTITY(1,1) NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[ruta_archivos] [varchar](500) NULL,
	[Id_estado] [int] NULL,
	[numProcesados] [int] NULL,
	[numGenerados] [int] NULL,
	[numEnviados] [int] NULL,
	[fecha_proceso] [datetime] NOT NULL,
	[usuario] [varchar](200) NOT NULL,
	[IP_Proceso] [varchar](50) NULL,
 CONSTRAINT [PK_CabeceraCetificacionesMasivoes] PRIMARY KEY CLUSTERED 
(
	[Id_Proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[CartaOrdenante]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operaciones].[CartaOrdenante](
	[Carta_id] [bigint] NOT NULL,
	[Ordenante_id] [int] NOT NULL,
 CONSTRAINT [PK_CartaOrdenante] PRIMARY KEY NONCLUSTERED 
(
	[Carta_id] ASC,
	[Ordenante_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Operaciones].[Cartas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[Cartas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[EstadoCarta_id] [int] NOT NULL,
	[FechaVigenciaInicial] [datetime] NOT NULL,
	[FechaVigenciaFinal] [datetime] NOT NULL,
	[IdentificacionCliente] [varchar](30) NOT NULL,
	[NombreClienteUno] [varchar](200) NOT NULL,
	[ApellidoClienteUno] [varchar](20) NOT NULL,
	[NombreClienteDos] [varchar](20) NULL,
	[ApellidoClienteDos] [varchar](20) NULL,
	[NombreSociedad] [varchar](200) NULL,
	[FechaGeneracion] [datetime] NOT NULL,
	[IdCliente] [varchar](17) NOT NULL,
	[ImagePDF] [varchar](max) NULL,
 CONSTRAINT [PK_Cartas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[CarterasColectivas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[CarterasColectivas](
	[Id_Cartera] [int] IDENTITY(1,1) NOT NULL,
	[NombreCartera] [varchar](50) NOT NULL,
	[NitCartera] [varchar](20) NOT NULL,
	[Estado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[CarterasColectivasBancos]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[CarterasColectivasBancos](
	[Id_Banco] [int] NOT NULL,
	[Id_Cartera] [int] NOT NULL,
	[NombreBanco] [varchar](100) NOT NULL,
	[NumeroCuenta] [varchar](20) NOT NULL,
	[TipoCuenta] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionBancos]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionBancos](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[banco] [varchar](250) NULL,
	[cartera] [varchar](250) NULL,
	[nombre_cliente] [varchar](500) NULL,
	[identificacion] [varchar](100) NULL,
	[numero_cta] [varchar](100) NULL,
	[banco_consignacion] [varchar](250) NULL,
	[valor] [float] NULL,
	[numero_cta_consignacion] [varchar](100) NULL,
	[nit_cartera] [varchar](100) NULL,
	[email] [varchar](500) NULL,
	[fecha_ini] [datetime] NULL,
 CONSTRAINT [PK_DetalleCetificacionBancos] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionPortafolio]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionPortafolio](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[Id_Cliente] [bigint] NULL,
	[nombre_cliente] [varchar](500) NULL,
	[fecha_corte] [datetime] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_DetalleCetificacionPortafolio] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionPortafolios]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionPortafolios](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[Id_Cliente] [bigint] NULL,
	[nombre_cliente] [varchar](500) NULL,
	[fecha_corte] [datetime] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_DetalleCetificacionPortafolios] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionReteFuente]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionReteFuente](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[Id_Cliente] [int] NULL,
	[identificacion] [varchar](100) NULL,
	[nombre_cliente] [varchar](500) NULL,
	[fecha_ini] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_DetalleCetificacionReteFuente] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionReteFuentes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionReteFuentes](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[Id_Cliente] [int] NULL,
	[identificacion] [varchar](100) NULL,
	[nombre_cliente] [varchar](500) NULL,
	[fecha_ini] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_DetalleCetificacionReteFuentes] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[DetalleCetificacionSaldos]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[DetalleCetificacionSaldos](
	[Id_det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proceso] [int] NOT NULL,
	[Id_Tipo] [int] NOT NULL,
	[encargo] [int] NOT NULL,
	[nombre_cliente] [varchar](500) NULL,
	[identificacion] [varchar](100) NULL,
	[saldo] [float] NULL,
	[unidades] [int] NOT NULL,
	[fecha_ini] [datetime] NULL,
	[valor_unidad] [float] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_DetalleCetificacionSaldos] PRIMARY KEY CLUSTERED 
(
	[Id_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[Emisores]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[Emisores](
	[Id] [int] NOT NULL,
	[NombreEmisor] [varchar](150) NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_Emisores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[NombreEmisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[EstadoProcesoMasivo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[EstadoProcesoMasivo](
	[Id_Estado] [int] NULL,
	[Descripcion] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[EstadosCarta]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[EstadosCarta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EstadosCarta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[ExtractosClientes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[ExtractosClientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INTCODSUSCRIPTOR] [int] NOT NULL,
	[INTENCARGO] [int] NOT NULL,
	[DATFECHA] [datetime] NULL,
	[VCHCODIGOPORTAFOLIO] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[HistoricoCartaHistoricoOrdenante]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operaciones].[HistoricoCartaHistoricoOrdenante](
	[HistoricoCarta_id] [bigint] NOT NULL,
	[HistoricoOrdenante_id] [int] NOT NULL,
 CONSTRAINT [PK_HistoricoCartaHistoricoOrdenante] PRIMARY KEY NONCLUSTERED 
(
	[HistoricoCarta_id] ASC,
	[HistoricoOrdenante_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Operaciones].[HistoricoCartas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[HistoricoCartas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[EstadoCarta_id] [int] NOT NULL,
	[FechaVigenciaInicial] [datetime] NOT NULL,
	[FechaVigenciaFinal] [datetime] NOT NULL,
	[IdentificacionCliente] [varchar](30) NOT NULL,
	[NombreClienteUno] [varchar](200) NOT NULL,
	[ApellidoClienteUno] [varchar](20) NOT NULL,
	[NombreClienteDos] [varchar](20) NULL,
	[ApellidoClienteDos] [varchar](20) NULL,
	[NombreSociedad] [varchar](200) NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[FechaGeneracion] [datetime] NOT NULL,
	[IdCliente] [varchar](17) NOT NULL,
	[HistoricoEstadoCarta_id] [int] NOT NULL,
	[idCarta] [bigint] NOT NULL,
	[ImagePDF] [varchar](max) NULL,
 CONSTRAINT [PK_HistoricoCartas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[HistoricoCertificaciones]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[HistoricoCertificaciones](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idcliente] [char](17) NOT NULL,
	[FechaGeneracion] [datetime] NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Certificacion] [varbinary](max) NULL,
 CONSTRAINT [PK_HistoricoCertificaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[HistoricoEstadoCartas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[HistoricoEstadoCartas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdCarta] [bigint] NOT NULL,
	[IdEstadoVisado] [bigint] NOT NULL,
	[IdEstadoAutorizado] [bigint] NOT NULL,
	[ObservacionAutorizacion] [varchar](5000) NULL,
	[ObservacionVisado] [varchar](5000) NULL,
 CONSTRAINT [PK_HistoricoEstadoCartas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[HistoricoOperacionesRepo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[HistoricoOperacionesRepo](
	[id_reporte] [int] IDENTITY(1,1) NOT NULL,
	[IdComitente] [char](17) NULL,
	[fecha_real] [datetime] NULL,
	[usuario] [varchar](30) NULL,
	[fecha_reporte] [datetime] NULL,
 CONSTRAINT [PK_HistoricoOperacionesRepo] PRIMARY KEY CLUSTERED 
(
	[id_reporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[HistoricoOrdenantes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[HistoricoOrdenantes](
	[id] [int] NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[NombreUno] [varchar](20) NOT NULL,
	[NombreDos] [varchar](20) NULL,
	[ApellidoUno] [varchar](20) NOT NULL,
	[ApellidoDos] [varchar](20) NULL,
 CONSTRAINT [PK_HistoricoOrdenantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[LogCartas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[LogCartas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Carta_id] [bigint] NOT NULL,
	[FechaLog] [datetime] NOT NULL,
	[Ip] [varchar](20) NOT NULL,
	[InfoCambio] [varchar](512) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LogCartas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[Ordenantes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[Ordenantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[NombreUno] [varchar](20) NOT NULL,
	[NombreDos] [varchar](20) NULL,
	[ApellidoUno] [varchar](20) NOT NULL,
	[ApellidoDos] [varchar](20) NULL,
 CONSTRAINT [PK_Ordenantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[Parametros]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[Parametros](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreFirmaExtractos] [varchar](200) NOT NULL,
	[CargoFirmaExtractos] [varchar](200) NOT NULL,
	[RutaFirma] [varchar](500) NOT NULL,
	[fecha_proceso_repo] [datetime] NULL,
	[RutaCartasRepo] [varchar](1000) NULL,
	[ReportServer_Papeletas] [varchar](200) NULL,
	[ReportPath_Papeletas] [varchar](200) NULL,
	[pathPapeletasMasivo] [varchar](200) NULL,
	[pathPapeletasMasivoProcesados] [varchar](200) NULL,
	[pathPapeletasMasivoEnviados] [varchar](200) NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[NombreFirmaExtractos] ASC,
	[CargoFirmaExtractos] ASC,
	[RutaFirma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[ParametrosExtractos]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[ParametrosExtractos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[MensajeUno] [varchar](8000) NULL,
	[MensajeDos] [varchar](8000) NULL,
	[MensajeAlterno] [varchar](8000) NULL,
	[ValorMensaje] [float] NOT NULL,
 CONSTRAINT [PK_ParametrosExtractos] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[ValorMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[ParametrosRutaMasivo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[ParametrosRutaMasivo](
	[Id_Masivo] [int] NOT NULL,
	[descripcion_proceso] [varchar](1000) NULL,
	[RutaArchivo] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[ParametrosRutaMasivoes]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[ParametrosRutaMasivoes](
	[Id_Masivo] [int] NOT NULL,
	[descripcion_proceso] [varchar](1000) NULL,
	[RutaArchivo] [varchar](1000) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_ParametrosRutaMasivoes] PRIMARY KEY CLUSTERED 
(
	[Id_Masivo] ASC,
	[RutaArchivo] ASC,
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[vClienteByReceptors]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[vClienteByReceptors](
	[CODIGOOYD] [varchar](17) NULL,
	[USUARIO] [varchar](50) NULL,
	[LOGLIDER] [int] NOT NULL,
 CONSTRAINT [PK_vClienteByReceptors] PRIMARY KEY CLUSTERED 
(
	[LOGLIDER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Operaciones].[VersionAplicacion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Operaciones].[VersionAplicacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_version] [varchar](50) NULL,
	[fecha_version] [datetime] NULL,
	[activa] [bit] NULL,
	[ruta_version] [varchar](512) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[CarterasColectivas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Riesgos].[CarterasColectivas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCartera] [varchar](50) NOT NULL,
	[IdCarteraPadre] [int] NULL,
 CONSTRAINT [PK_Riesgos.CarterasColectivas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[emisionesBanRep]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Riesgos].[emisionesBanRep](
	[Titulo] [int] NOT NULL,
	[Plazo] [int] NOT NULL,
	[TipoPlazo] [char](1) NOT NULL,
	[Moneda] [varchar](3) NOT NULL,
	[Emision] [int] NOT NULL,
	[MnemotecnicoSEN] [varchar](15) NULL,
	[FechaInicioVigencia] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[TasaInteres] [decimal](14, 4) NULL,
	[TasaSpread] [decimal](14, 4) NULL,
	[Signo] [char](1) NULL,
	[PeriodoInteres] [char](1) NULL,
	[Tipo] [varchar](10) NULL,
	[CodigoISIN] [varchar](15) NULL,
	[CodigoCFI] [varchar](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[formulas]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Riesgos].[formulas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[variable] [varchar](20) NOT NULL,
	[ecuacion] [varchar](200) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[campo] [varchar](100) NULL,
 CONSTRAINT [PK_Riesgos.formulas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[formulasCartera]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riesgos].[formulasCartera](
	[idCartera] [int] NOT NULL,
	[idformula] [int] NOT NULL,
	[prioridad] [int] NULL,
 CONSTRAINT [PK_Riesgos.formulasCartera] PRIMARY KEY CLUSTERED 
(
	[idCartera] ASC,
	[idformula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Riesgos].[haircuts]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riesgos].[haircuts](
	[fechaDesde] [datetime] NOT NULL,
	[fechaHasta] [datetime] NOT NULL,
	[numeroEmision] [int] NOT NULL,
	[valorHaircut] [decimal](12, 2) NULL,
	[tco_plazo] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Riesgos].[HomologacionNemotecnico]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Riesgos].[HomologacionNemotecnico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MnemotecnicoSEN] [varchar](15) NOT NULL,
	[NemotecnicoLocal] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Riesgos.HomologacionNemotecnico] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[irlHistorico]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riesgos].[irlHistorico](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCartera] [int] NOT NULL,
	[fechaCalculoIRL] [datetime] NOT NULL,
	[IRL] [decimal](20, 4) NULL,
	[ALM] [decimal](20, 4) NULL,
	[RLN] [decimal](20, 4) NULL,
	[FNVC] [decimal](20, 4) NULL,
	[FNVNC] [decimal](20, 4) NULL,
	[rendimiento] [decimal](20, 10) NULL,
 CONSTRAINT [PK_Riesgos.irlHistorico] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Riesgos].[logDescargaArchivosBanRep]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Riesgos].[logDescargaArchivosBanRep](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[rutaArchivo] [varchar](150) NOT NULL,
	[fechaActualizacion] [datetime] NOT NULL,
	[totalRegistros] [int] NOT NULL,
 CONSTRAINT [PK_logDescargaArchivosBanRep] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Riesgos].[valoresHistoricosCartera]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Riesgos].[valoresHistoricosCartera](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCartera] [int] NOT NULL,
	[fechaHistorico] [datetime] NOT NULL,
	[valorTotalCartera] [decimal](20, 4) NOT NULL,
	[valorTotalCarteraAnterior] [decimal](20, 4) NOT NULL,
	[valorNetoCartera] [decimal](20, 4) NULL,
	[valorCompras] [decimal](20, 4) NULL,
	[valorVentas] [decimal](20, 4) NULL,
	[valorSimultaneasActivas] [decimal](20, 4) NULL,
	[valorSimultaneasPasivas] [decimal](20, 4) NULL,
	[valorCupones] [decimal](20, 4) NULL,
	[valorRedenciones] [decimal](20, 4) NULL,
	[disponible] [decimal](20, 4) NULL,
	[valorIngresos] [decimal](20, 4) NULL,
	[valorEgresos] [decimal](20, 4) NULL,
	[valorSumatoriaPortafolioHaircut] [decimal](20, 4) NULL,
	[varianza] [decimal](20, 10) NULL,
	[desviacionEstandar] [decimal](20, 10) NULL,
	[LAR95] [decimal](20, 5) NULL,
	[LAR99] [decimal](20, 5) NULL,
	[valorRepos] [decimal](20, 4) NULL,
 CONSTRAINT [PK_Riesgos.valoresHistoricosCartera] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Seguridad].[Accion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seguridad].[Accion](
	[id_accion] [int] IDENTITY(1,1) NOT NULL,
	[id_aplicacion] [int] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [pk_Accion] PRIMARY KEY CLUSTERED 
(
	[id_accion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seguridad].[Aplicacion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seguridad].[Aplicacion](
	[id_aplicacion] [int] IDENTITY(1,1) NOT NULL,
	[sigla] [varchar](4) NULL,
	[nombre] [varchar](200) NOT NULL,
	[url_aplicacion] [varchar](500) NOT NULL,
	[imagen] [varchar](500) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [pk_Aplicacion] PRIMARY KEY CLUSTERED 
(
	[id_aplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seguridad].[Grupo]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seguridad].[Grupo](
	[id_grupo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_grupo] [varchar](100) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [pk_Grupo] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seguridad].[GrupoAplicacion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[GrupoAplicacion](
	[id_grupo] [int] NOT NULL,
	[id_aplicacion] [int] NOT NULL,
 CONSTRAINT [pk_GrupoAplicacion] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC,
	[id_aplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Seguridad].[GrupoNivel]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[GrupoNivel](
	[id_grupo] [int] NOT NULL,
	[id_nivel] [int] NOT NULL,
 CONSTRAINT [pk_GrupoNivel] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC,
	[id_nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Seguridad].[GrupoRol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[GrupoRol](
	[id_grupo] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
 CONSTRAINT [pk_GrupoRol] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC,
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Seguridad].[Nivel]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seguridad].[Nivel](
	[id_nivel] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[id_aplicacion] [int] NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [pk_Nivel] PRIMARY KEY CLUSTERED 
(
	[id_nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seguridad].[NivelAccion]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[NivelAccion](
	[id_nivel] [int] NOT NULL,
	[id_accion] [int] NOT NULL,
 CONSTRAINT [pk_NivelAccion] PRIMARY KEY CLUSTERED 
(
	[id_nivel] ASC,
	[id_accion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Seguridad].[Rol]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Seguridad].[Rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [pk_Rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Seguridad].[RolNivel]    Script Date: 11/25/2020 9:00:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[RolNivel](
	[id_rol] [int] NOT NULL,
	[id_nivel] [int] NOT NULL,
 CONSTRAINT [pk_RolNivel] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC,
	[id_nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbSeguimiento_Solicitud] ADD  CONSTRAINT [DF_tbSeguimiento_Solicitud_prioridad]  DEFAULT ((10)) FOR [prioridad]
GO
ALTER TABLE [dbo].[tbSeguimiento_tiposolicitud] ADD  CONSTRAINT [DF_RegistrarSolicitud]  DEFAULT ((0)) FOR [RegistrarSolicitud]
GO
ALTER TABLE [Criptografia].[KeyEntidad]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_KeyEntidad] FOREIGN KEY([id_entidad])
REFERENCES [Criptografia].[Entidad] ([id_entidad])
GO
ALTER TABLE [Criptografia].[KeyEntidad] CHECK CONSTRAINT [FK_Entidad_KeyEntidad]
GO
ALTER TABLE [dbo].[tbSeguimiento_GrupoUsuarios]  WITH NOCHECK ADD  CONSTRAINT [fk_GrupoUsuarios] FOREIGN KEY([idGrupoSol])
REFERENCES [dbo].[tbSeguimiento_GruposSol] ([idGrupoSol])
GO
ALTER TABLE [dbo].[tbSeguimiento_GrupoUsuarios] CHECK CONSTRAINT [fk_GrupoUsuarios]
GO
ALTER TABLE [dbo].[tbSeguimiento_relTipoSol_Grupo]  WITH NOCHECK ADD  CONSTRAINT [fk_relTipoSol_Grupo] FOREIGN KEY([idGrupoSol])
REFERENCES [dbo].[tbSeguimiento_GruposSol] ([idGrupoSol])
GO
ALTER TABLE [dbo].[tbSeguimiento_relTipoSol_Grupo] CHECK CONSTRAINT [fk_relTipoSol_Grupo]
GO
ALTER TABLE [dbo].[tbSeguimiento_Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_tbSeguimiento_Solicitud_nivelServicio] FOREIGN KEY([IDNIVELSERVICIO])
REFERENCES [dbo].[tbSeguimiento_NivelServicio] ([idNivel])
GO
ALTER TABLE [dbo].[tbSeguimiento_Solicitud] CHECK CONSTRAINT [FK_tbSeguimiento_Solicitud_nivelServicio]
GO
ALTER TABLE [Operaciones].[CartaOrdenante]  WITH CHECK ADD  CONSTRAINT [FK_CartaOrdenante_Carta] FOREIGN KEY([Carta_id])
REFERENCES [Operaciones].[Cartas] ([id])
GO
ALTER TABLE [Operaciones].[CartaOrdenante] CHECK CONSTRAINT [FK_CartaOrdenante_Carta]
GO
ALTER TABLE [Operaciones].[CartaOrdenante]  WITH CHECK ADD  CONSTRAINT [FK_CartaOrdenante_Ordenante] FOREIGN KEY([Ordenante_id])
REFERENCES [Operaciones].[Ordenantes] ([id])
GO
ALTER TABLE [Operaciones].[CartaOrdenante] CHECK CONSTRAINT [FK_CartaOrdenante_Ordenante]
GO
ALTER TABLE [Operaciones].[Cartas]  WITH CHECK ADD  CONSTRAINT [FK_CartaEstadoCarta] FOREIGN KEY([EstadoCarta_id])
REFERENCES [Operaciones].[EstadosCarta] ([id])
GO
ALTER TABLE [Operaciones].[Cartas] CHECK CONSTRAINT [FK_CartaEstadoCarta]
GO
ALTER TABLE [Operaciones].[HistoricoCartaHistoricoOrdenante]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoCartaHistoricoOrdenante_HistoricoCarta] FOREIGN KEY([HistoricoCarta_id])
REFERENCES [Operaciones].[HistoricoCartas] ([id])
GO
ALTER TABLE [Operaciones].[HistoricoCartaHistoricoOrdenante] CHECK CONSTRAINT [FK_HistoricoCartaHistoricoOrdenante_HistoricoCarta]
GO
ALTER TABLE [Operaciones].[HistoricoCartaHistoricoOrdenante]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoCartaHistoricoOrdenante_HistoricoOrdenante] FOREIGN KEY([HistoricoOrdenante_id])
REFERENCES [Operaciones].[HistoricoOrdenantes] ([id])
GO
ALTER TABLE [Operaciones].[HistoricoCartaHistoricoOrdenante] CHECK CONSTRAINT [FK_HistoricoCartaHistoricoOrdenante_HistoricoOrdenante]
GO
ALTER TABLE [Operaciones].[HistoricoCartas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoCartaEstadoCarta] FOREIGN KEY([EstadoCarta_id])
REFERENCES [Operaciones].[EstadosCarta] ([id])
GO
ALTER TABLE [Operaciones].[HistoricoCartas] CHECK CONSTRAINT [FK_HistoricoCartaEstadoCarta]
GO
ALTER TABLE [Operaciones].[LogCartas]  WITH CHECK ADD  CONSTRAINT [FK_CartaLogCarta] FOREIGN KEY([Carta_id])
REFERENCES [Operaciones].[Cartas] ([id])
GO
ALTER TABLE [Operaciones].[LogCartas] CHECK CONSTRAINT [FK_CartaLogCarta]
GO
ALTER TABLE [Riesgos].[formulasCartera]  WITH CHECK ADD  CONSTRAINT [FK_CarterasColectivas_formulasCartera] FOREIGN KEY([idCartera])
REFERENCES [Riesgos].[CarterasColectivas] ([Id])
GO
ALTER TABLE [Riesgos].[formulasCartera] CHECK CONSTRAINT [FK_CarterasColectivas_formulasCartera]
GO
ALTER TABLE [Riesgos].[formulasCartera]  WITH CHECK ADD  CONSTRAINT [FK_formulas_formulasCartera] FOREIGN KEY([idformula])
REFERENCES [Riesgos].[formulas] ([ID])
GO
ALTER TABLE [Riesgos].[formulasCartera] CHECK CONSTRAINT [FK_formulas_formulasCartera]
GO
ALTER TABLE [Riesgos].[valoresHistoricosCartera]  WITH CHECK ADD  CONSTRAINT [FK_CarterasColectivas_valoresHistoricosCartera] FOREIGN KEY([idCartera])
REFERENCES [Riesgos].[CarterasColectivas] ([Id])
GO
ALTER TABLE [Riesgos].[valoresHistoricosCartera] CHECK CONSTRAINT [FK_CarterasColectivas_valoresHistoricosCartera]
GO
ALTER TABLE [Seguridad].[GrupoAplicacion]  WITH CHECK ADD  CONSTRAINT [fk_GrupoAplicacion_Aplicacion] FOREIGN KEY([id_aplicacion])
REFERENCES [Seguridad].[Aplicacion] ([id_aplicacion])
GO
ALTER TABLE [Seguridad].[GrupoAplicacion] CHECK CONSTRAINT [fk_GrupoAplicacion_Aplicacion]
GO
ALTER TABLE [Seguridad].[GrupoAplicacion]  WITH CHECK ADD  CONSTRAINT [fk_GrupoAplicacion_Grupo] FOREIGN KEY([id_grupo])
REFERENCES [Seguridad].[Grupo] ([id_grupo])
GO
ALTER TABLE [Seguridad].[GrupoAplicacion] CHECK CONSTRAINT [fk_GrupoAplicacion_Grupo]
GO
ALTER TABLE [Seguridad].[GrupoNivel]  WITH CHECK ADD  CONSTRAINT [fk_GrupoNivel_Grupo] FOREIGN KEY([id_grupo])
REFERENCES [Seguridad].[Grupo] ([id_grupo])
GO
ALTER TABLE [Seguridad].[GrupoNivel] CHECK CONSTRAINT [fk_GrupoNivel_Grupo]
GO
ALTER TABLE [Seguridad].[GrupoNivel]  WITH CHECK ADD  CONSTRAINT [fk_GrupoNivel_Nivel] FOREIGN KEY([id_nivel])
REFERENCES [Seguridad].[Nivel] ([id_nivel])
GO
ALTER TABLE [Seguridad].[GrupoNivel] CHECK CONSTRAINT [fk_GrupoNivel_Nivel]
GO
ALTER TABLE [Seguridad].[GrupoRol]  WITH CHECK ADD  CONSTRAINT [fk_GrupoRol_Grupo] FOREIGN KEY([id_grupo])
REFERENCES [Seguridad].[Grupo] ([id_grupo])
GO
ALTER TABLE [Seguridad].[GrupoRol] CHECK CONSTRAINT [fk_GrupoRol_Grupo]
GO
ALTER TABLE [Seguridad].[GrupoRol]  WITH CHECK ADD  CONSTRAINT [fk_GrupoRol_Rol] FOREIGN KEY([id_rol])
REFERENCES [Seguridad].[Rol] ([id_rol])
GO
ALTER TABLE [Seguridad].[GrupoRol] CHECK CONSTRAINT [fk_GrupoRol_Rol]
GO
ALTER TABLE [Seguridad].[NivelAccion]  WITH CHECK ADD  CONSTRAINT [fk_NivelAccion_Accion] FOREIGN KEY([id_accion])
REFERENCES [Seguridad].[Accion] ([id_accion])
GO
ALTER TABLE [Seguridad].[NivelAccion] CHECK CONSTRAINT [fk_NivelAccion_Accion]
GO
ALTER TABLE [Seguridad].[NivelAccion]  WITH CHECK ADD  CONSTRAINT [fk_NivelAccion_Nivel] FOREIGN KEY([id_nivel])
REFERENCES [Seguridad].[Nivel] ([id_nivel])
GO
ALTER TABLE [Seguridad].[NivelAccion] CHECK CONSTRAINT [fk_NivelAccion_Nivel]
GO
ALTER TABLE [Seguridad].[RolNivel]  WITH CHECK ADD  CONSTRAINT [fk_RolNivel_Nivel] FOREIGN KEY([id_nivel])
REFERENCES [Seguridad].[Nivel] ([id_nivel])
GO
ALTER TABLE [Seguridad].[RolNivel] CHECK CONSTRAINT [fk_RolNivel_Nivel]
GO
ALTER TABLE [Seguridad].[RolNivel]  WITH CHECK ADD  CONSTRAINT [fk_RolNivel_Rol] FOREIGN KEY([id_rol])
REFERENCES [Seguridad].[Rol] ([id_rol])
GO
ALTER TABLE [Seguridad].[RolNivel] CHECK CONSTRAINT [fk_RolNivel_Rol]
GO
