create schema Base_exemplo;

use Base_exemplo;

CREATE TABLE area (
  codigo int primary key ,
  descricao varchar (30),
  predio varchar (40)
);
CREATE TABLE curso (
  codigo int primary key ,
  nome varchar (40) not null,
  cod_area int,
  nome_coordenador varchar(50),
  vagas integer,
  foreign key (cod_area) references area (codigo)
);

CREATE TABLE aluno (
  matricula int primary key ,
  nome varchar (50) not null,
  cidade_endereco varchar (30),
  telefone int,
  data_nascimento date,
  cod_curso int null,
   mensalidade decimal(6,2),
  foreign key (cod_curso) references curso (codigo)
);

insert into area values
  (1,"Exatas", "Bloco C"), (2,"Saúde", "Bloco B"),
  (3,"Humanas", "Bloco A");

insert into curso values
  (1,"Informatica para Internet", 1, "Francisco",20),
  (2,"Nutrição", 2, null,null),
  (3,"Enfermagem", 2, "Maria",45),
  (4,"Ciências da Computação", 1, null,50),
  (5,"Redes de Computadores", 1, "Zilmara",40);

INSERT INTO aluno  values
  (1,"Mariana Torres", "Recife",   934261029, '1998-10-19', 1, 235.65),
  (2,"Carolina Pereira", "Olinda", 982736410, '1999-01-10', 1 , 452.36),
  (3,"Adriano Freire", "Palmares", 952351726, '1994-07-05', 5 , 2987.36),
  (4,"Elaine Villas", "Olinda", 902816253, '2000-04-29', 3 , 365.65),
  (5,"Paulo Veras", "Olinda", 976253123, '1988-03-30', 3 , 358.65),
  (6,"Talita Veiga", "Jaboatão",  952434172, '1990-11-23', 4 , 235.65),
  (7,"Katia Garcia", "Palmares",962534122, '1991-10-19', 5 , 145.65),
  (8,"Júlio Mercedes", "Palmares", 981727263, '1999-01-01', null , 365.36),
  (9,"Fátima Silva", "Jaboatão", 981722639, '1986-09-04', null , 154.69);


-- Resolução das questões Dia 28/11/2025

select * from curso;

-- 1°)

select SUM(mensalidade) from aluno;

-- 2°)

select AVG(mensalidade) as "media.mensalidade" from aluno where cod_curso in (
select codigo from curso where nome in("Informática para Internet", "Enfermagem")); -- retorna as medias 

-- 3°)

select COUNT(nome_coordenador) as "Qtde.cursos" from curso;

select count(1) from curso;

select *, "ATIVO" from curso;

-- 4°)

select MAX(vagas) as "MAX",  MIN(vagas) as "MIN"  from curso;

-- 5°)
-- Group BY serve para categorizar colunas
select cidade_endereco, count(*) from aluno group by cidade_endereco;

-- 6°)
select nome, count(*) from curso where nome_coordenador is null group by nome;

-- 7°)

select year(data_nascimento), count(*) from aluno group by year(data_nascimento);
