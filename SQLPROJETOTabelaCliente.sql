create database CookieSys
go

use CookieSys
go

create Table Cliente(

IdCliente int identity primary key,
Nome varchar(100) not null,
DataNascimento date not null,
CPF varchar(14) unique not null,
Contato varchar(100) not null,
Endereco varchar(100) not null,

)
go


insert into Cliente(Nome,DataNascimento,CPF,Contato,Endereco)
             values('Dennis Marcondes',  '2001-02-23', '111.111.111-11', '11999999999','Rua Vigarista'),
			       ('Gabriel Oliveira', '2000-05-22', '222.222.222-22', '11888888888','Rua Caverna'),
				   ('Gabriel Padovani', '2001-01-10', '333.333.333-33', '11777777777','Rua Charmosa'),
				   ('Giovani Storani',  '1999-01-04', '444.444.444-44', '11666666666','Rua Quadrilha'),
				   ('Júlio Monteiro',   '2000-03-27', '555.555.555-55', '11555555555','Rua Mutley'),
				   ('Otávio Fidêncio',  '1997-10-18', '666.666.666-66', '11444444444','Rua Correria')

                  

                   select* from Cliente

Create procedure STPIncluirCliente(
@Nome varchar(100),
@DataNasc date,
@Cpf varchar(14),
@Contato varchar(14),
@Endereco varchar(100)
)
	AS
		Begin
			insert into Cliente(Nome,DataNascimento,CPF,Contato,Endereco)
			values (@Nome,@DataNasc,@Cpf,@Contato,@Endereco)
		End

exec STPIncluirCliente @Nome = 'Dick Vigarista',@DataNasc = '1978-04-10', @Cpf = '000.000.000.01', 
					   @Contato = '(11)90000-0001', @Endereco = 'Rua dos bobos'

create procedure STPAlterarCliente(
@IdCliente tinyint,
@Nome varchar(100),
@Contato varchar(14),
@Endereco varchar(100)
)
	As
		Begin

			declare @Parametro tinyint
				set @Parametro = (select IdCliente from Cliente where IdCliente = @IdCliente)
				if @Parametro = @IdCliente

			begin
				update Cliente
				set Nome = (@Nome), Contato = (@Contato), Endereco = (@Endereco)
				where IdCliente = @IdCliente
			end


		end

exec STPAlterarCliente @IdCliente = 7,@Nome = 'Penelope Charmosa', 
	  @Contato = '(11)90000-0001', @Endereco = 'Linha de Chegada'


create procedure STPExcluirCliente(
@IdCliente tinyint
)
	AS
		Begin
			declare @ParametroExcl tinyint 
			
			set @ParametroExcl = (select IdCliente from Cliente where IdCliente = @IdCliente)
			if @ParametroExcl = @IdCliente

				begin
					delete from Cliente
					where IdCliente = @IdCliente
				end
							
			end

exec STPExcluirCliente @IdCliente = 7

select* from Cliente