use CookieSys
go

create table Usuario(
IdUsuario int identity primary key,
Nome char(100) not null,
Cpf char(14) unique not null,
Senha char (15) unique not null
)

Insert into Usuario (Nome,Cpf,Senha)
	   values ('Ademiro', '457.009.201-77','Biscoito')

select* from Usuario
