

	use SystemeGestionMultiLocation

	go

	--Création de la table tblclients et ses champs.
	create table tblclients (
    IdClient char(5)  NOT NULL,
	Nom varchar(30) NOT NULL,
	PrenomClient varchar(30) NOT NULL,
	Adresse varchar(30) NOT NULL,
	Ville varchar (20) NOT NULL,
	Province varchar (15) NOT NULL,
	CodePostal char(7) NOT NULL,
	NumeroTelephone char(14) NOT NULL
	) on  [PRIMARY]

	go

	--Création de la table tblModeles et ses champs.
	create table tblModeles(
	IdModele char(3) not null,
	Description varchar(50)not null, Constraint PK_tblModeles Primary key  clustered (IdModele ASC)) on   [PRIMARY]

	go

	--Création de la table tblCouleurs et ses champs.
	create table tblCouleurs(
	IdCouleur char(4) not null,
	Descriptions varchar(20)not null, Constraint PK_tblCouleurs Primary key  clustered (IdCouleur ASC)) on   [PRIMARY]

	go

	--Création de la table tblTypes et ses champs.
	create table tblTypes(
	IdType char(2)not null,
	Descriptions varchar(20) not null, Constraint PK_tblTypes Primary key  clustered (IdType ASC)) on   [PRIMARY]

	go

	--Création de la table tblTermeLocation et ses champs.
	create table tblTermeLocation(
	IdTermeLocation char(5) not null,
	SurprimeParKilometre money not null,
	KilometrageMaxPermis varchar(20) not null, Constraint PK_tblTermeLocation Primary key  clustered (IdTermeLocation ASC)) on   [Primary]

	go


	--Création de la table tblAudits et ses champs.
	create table tblAudits(
	NoAudit char(1)not null,
	AncDateDebutLocation  smalldatetime not null,
	NouvDateDebutLocation  smalldatetime not null,
	AncDatePremierPaiement smalldatetime not null,
	NouvDatePremierPaiement smalldatetime not null,
	AncDatePaiementChangé bit not null,
	MontantPaiementMensuel money not null,
	NouvMontantPaiementMensuel money not null,
	IdTermeLocation char(5)not null,
	AncIdClient char(5) not null,
	NouvIdClient char(5) not null,
	NouvIdLocation char(6) not null,
	AncIdLocation char(6) not null,
	DateDuChangement smalldatetime not null, Constraint PK_tblAudits Primary key  clustered (NoAudit ASC)) on   [Primary]

	go

	--Création de la table tblVehicules et ses champs.
	create table tblVehicules(
	NIV char(28) not null,
	IdModele char(3)not null,
	IdType char(2) not null,
	IdCouleur char(4) not null,
	ValeurAuLivre money not null,
	Transmission bit not null,
	Options bit not null,
	IdLocation char(6) not null,
	KilometreParOrdometre varchar(50) not null
	) on [Primary]

	--Construction de la relation entre les tables tblVehicules et tblModeles
	alter table tblVehicules  with check add  Constraint [FK_tblVehicules_tblModeles] foreign key (IdModele)
	references tblModeles(IdModele)
	go
	alter table tblVehicules check constraint FK_tblVehicules_tblModeles

	--Construction de la relation entre les tables tblVehicules et tblTypes
	alter table tblVehicules  with check add  Constraint [FK_tblVehicules_tblTypes] foreign key(IdType)
	references tblTypes(IdType)
	go
	alter table tblVehicules check constraint FK_tblVehicules_tblTypes

	--Construction de la relation entre les tables tblVehicules et tblCouleurs
	alter table tblVehicules  with check add  Constraint [FK_tblVehicules_tblCouleurs] foreign key(IdCouleur)
	references tblCouleurs(IdCouleur)
	go
	alter table tblVehicules check constraint FK_tblVehicules_tblCouleurs

	--Construction de la relation entre les tables tblVehicules et tblLocations
	alter table tblVehicules  with check add  Constraint [FK_tblVehicules_tblLocations] foreign key(IdLocation)
	references tblLocations(IdLocation)
	go
	alter table tblVehicules check Constraint FK_tblVehicules_tblLocations
	
	go
	--Création de la table tblLocations et ses champs.
	create table tblLocations( 
	IdLocation char(6) not null,
	DateDebutLocation  smalldatetime not null,
	DatePremierPaiement smalldatetime not null,
	MontantPaiementMensuel money not null,
	IdTermeLocation char(5)not null,
	IdClient char(5) not null,
	NoAudit char(1) not null,
	NIV char(28) not null) on [PRIMARY]

	--Construction de la relation entre les tables tblLocations et tblClients
	alter table tblLocations with check add  Constraint [FK_tblLocations_tblClients] foreign key(IdClient)
	references tblClients(IdClient)
	go
	alter table tblLocations check Constraint FK_tblLocations_tblClients

	--Construction de la relation entre les tables tblLocations et tblTermeLocation
	alter table tblLocations with check add  Constraint FK_tblLocations_tblTermeLocation foreign key(IdTermeLocation)
	references tblTermeLocation(IdTermeLocation)
	go
	alter table tblLocations CHECK Constraint FK_tblLocations_tblTermeLocation

	--Construction de la relation entre les tables tblLocations et tblAudits
	alter table tblLocations with check add constraint FK_tblLocations_tblAudits foreign key(NoAudit)
	references tblAudits(NoAudit)
	go
	alter table tblLocations check constraint FK_tblLocations_tblAudits

	go

	--Création de la table tblPaiements et ses champs.
	create table tblPaiements(
	NoPaiement char(5) NOT NULL,
	Descriptions varchar(100) NOT NULL,
	IdLocation char(6)not null,
	MontantPaiementMensuel money NOT NULL,	Constraint PK_tblPaiements Primary key  clustered (NoPaiement ASC)) on [primary]

	--Construction de la relation entre les tables tblPaiements et tblLocations
	alter table tblPaiements with check add  Constraint [FK_tblPaiements_tblLocations] foreign key(IdLocation)
	references tblLocations(IdLocation)
	go
	alter table tblLocations check Constraint FK_tblPaiements_tblLocations

	go

	
	

	
	

	
	

	