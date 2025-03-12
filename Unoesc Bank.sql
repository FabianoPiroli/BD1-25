create database Unoesc_Bank;

use Unoesc_Bank;

create table Cliente(
	ID int not null auto_increment primary key,
    Nome varchar(255)
);

create table conta(
	ID int not null auto_increment primary key,
    NRO_Conta varchar(10) not null,
    ID_Cliente int not null,
    constraint fk_id_cliente_conta
		foreign key (ID_Cliente)
        references Cliente(ID)
);

create table transacao(
	ID int not null auto_increment primary key,
    ID_Conta int not null,
    tipo_transacao int not null,
    data_hora datetime not null,
    valor float not null
);

-- Definindo uma fk posteriormente a criação da tabela
alter table transacao
add foreign key (ID_Conta)
references Conta(ID);

-- Criando Índices
create index idx_transacao_tp_transacao
on transacao (tipo_transacao);

create index idx_transacao_data_hora
on transacao (data_hora);