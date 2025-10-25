

create database olhoNoBoleto_db;
use olhoNoBoleto_db;

create table tb_beneficiario(
id_beneficiario char(36) primary key default (uuid()),
nome varchar (255) not null,
cnpjCpf varchar (18) not null unique,	-- unico
banco varchar (255) not null unique,	-- unico
agencia varchar (50) not null,
totalQueixa integer default 0
);
create table tb_user(
id_user char(36) primary key default (uuid()),
nome varchar(255) not null,
email varchar(255) not null unique,
senha varchar (255) not null,
role_db varchar (255) not null
);
create table tb_boleto(
id_boleto char(36) primary key default (uuid()),
linhaDigitavel varchar (255) not null unique,  -- unico
banco varchar (255) not null unique,	-- unico
beneficiarioID char(36),	-- Chave estrangeira
valor numeric(10, 2) not null,
dataValidacao datetime not null,
statusValidacao varchar (255) not null,

-- Chave estrangeira
foreign key (beneficiarioID)
    references tb_beneficiario (id_beneficiario)
    
)character set utf8mb4;

create table tb_report (
id_report char(36) primary key default (uuid()),
usuarioID char(36),		-- chave estrangeira
boletoID char(36),		-- chave estrangeira
descricaoProblema varchar (255),
dataReporte datetime not null,

-- chaves estrangeiras
    foreign key (usuarioID)
    references tb_user(id_user),

    foreign key (boletoID)
    references tb_boleto(id_boleto)
    
)character set utf8mb4;

