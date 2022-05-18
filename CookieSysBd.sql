create database CookieSys
go

use CookieSys
go

create Table Produto(

IdProduto int identity primary key,
Nome varchar(100) unique not null,
DataVencimento date not null,
Preco float not null,
Quantidade tinyint not null

)
go


insert into Produto(Nome,DataVencimento,Quantidade,Preco)
			 values('Bolo da Quadrilha', '2022-09-21', 7,35.90),
				   ('Brigadeiro Vigarista', '2022-05-18',45,3.90),
				   ('Beijinho da Charmosa', '2022-05-18',45,2.80),
				   ('Cupcacke Mutley', '2022-06-08',25,5.99),
				   ('Brownie dos Rocha', '2022-05-28',30,7.99),
				   ('Cookie do Mal', '2022-06-19',25,3.50),
				   ('Bolo de pote Barão Vermelho', '2022-07-10',15,15.50),
				   ('Trufas BomBarda ', '2022-05-18',40,2.00),
				   ('Sonho Aéreo', '2022-05-15',20,8.00),
				   ('Torta Doce do Urso Chorão', '2022-05-20',10,25.00)
select* from Produto

/*Procedure Para alteração de produtos*/


create procedure STPAlterarProduto(

@IdProduto int,
@DataVencimento date,
@Quantidade tinyint,
@Preco float
)

AS 
	begin
		declare @CodProduto int
		set @CodProduto = (Select IdProduto from Produto where IdProduto = @IdProduto)

			if @CodProduto = @IdProduto
				
		
		begin
			update Produto 
			set DataVencimento = (@DataVencimento), Quantidade = (@Quantidade),Preco = (@Preco)
			where @IdProduto =IdProduto
			end
			
			
		end

exec STPAlterarProduto  @IdProduto=1, @DataVencimento = '2022-08-10', @Quantidade = 2,@Preco = 23.90

/* Procedure para exclusão de dados*/

create procedure STPExcluirProduto(
@IdProduto int 
)

AS
	begin 
	declare @CodProduto int
	set @CodProduto = (Select IdProduto from Produto where IdProduto=@IdProduto)
		if @CodProduto = @IdProduto

			begin 
				Delete from Produto
				where IdProduto = @IdProduto
			end
		end

exec STPExcluirProduto @IdProduto = 9

select*from Produto


