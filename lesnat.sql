-- Creando base de datos para la App lesnat --
create database lesnat;

-- selecciono la DB para tranajar --
use lesnat;

-- Creo la table de la entidad sala -- 
create table sala(
-- entero positivo no nulo auto-incremental --
idSala int unsigned not null auto_increment,
-- datos de tipo string o caracteres --
sala char(20),
-- entero positivo no nulo auto-incremental --
numeroSala int unsigned not null,
primary key(idSala)
);

-- creo la table de la entidad pacientes --
create table pacientes(
idPaciente int unsigned not null auto_increment,
-- entero positivo no nulo auto-incremental --
DNI int unsigned not null,
-- datos de tipo string o caracteres --
nombre char(20),
-- entero positivo no nulo auto-incremental ---
apellido char(20),
-- dato no nulo --
fechaNacimiento date not null,
-- datos de tipo string o caracteres --
sexo varchar(20),
-- datos de tipo string o caracteres --
tipoPaciente varchar(50),
-- datos de tipo string o caracteres --
tipoEmergencia varchar(50),
-- entero positivo no nulo auto-incremental --
idSala int unsigned not null,
primary key(idPaciente),
foreign key(idSala) references sala(idSala)
);

-- creo la tabla de la entidad medicos --
create table medicos(
idMedico int unsigned not null auto_increment,
-- entero positivo no nulo auto-incremental --
numeroMatricula int unsigned not null,
-- entero positivo no nulo auto-incremental --
DNI int unsigned not null,
-- datos de tipo string o caracteres --
nombre char(20),
-- datos de tipo string o caracteres --
apellido char(20),
-- dato no nulo --
fechaNacimiento date not null,
-- datos de tipo string o caracteres --
sexo varchar(20), 
-- texto no nulo --
especialidad  text not null,
-- entero positivo no nulo auto-incremental --
idSala int unsigned not null,
primary key(idMedico),
foreign key(idSala) references sala(idSala)
);

-- creo la tabla intermedia entre las entidades Medicos_Pacientes --
create table Medicos_Pacientes(
-- entero positivo no nulo auto-incremental --
id int unsigned not null auto_increment,
idMedico int unsigned not null,
-- entero positivo no nulo --
idPaciente int unsigned not null,
-- entero positivo no nulo --
primary key(id),
foreign key(idMedico) references medicos(idMedico),
foreign key(idPaciente) references pacientes(idPaciente)
);