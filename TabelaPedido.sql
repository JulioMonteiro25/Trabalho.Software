use CookieSys
go

create table Pedido(
IdPedido int identity primary key,
IdCliente int references Cliente(IdCliente) not null,
IdProduto int references Produto(IdProduto) not null,
QtdProduto int not null,
PrecoUnidade money not null,
)

Insert Into Pedido (IdCliente,IdProduto,QtdProduto,PrecoUnidade)
	   values	(1,3,20,2.80),
				(3,5,10,3.50),
				(2,8,4,2.00),
				(2,6,20,3.50),
				(4,1,1,35.90),
				(6,2,50,3.90),
				(5,4,10,5.99)

select* from Pedido

alter procedure STPIncluirPedido(
@IdCliente int,
@IdProduto int,
@QtdProduto int
 
)
	AS
		Begin
			declare @PrecoUnidade money
			set @PrecoUnidade = (Select Preco from Produto where IdProduto = @IdProduto)
			
			declare @ValorTotal money
			set @ValorTotal = (@PrecoUnidade*@QtdProduto)

			Insert into Pedido(IdCliente,IdProduto,QtdProduto,PrecoUnidade)
				   values (@IdCliente, @IdProduto, @QtdProduto,@PrecoUnidade)

		End

exec STPIncluirPedido @IdCliente = 1, @IdProduto = 2, @QtdProduto = 2
select * from Pedido

create procedure STPAlterarPedido(
@IdPedido int,
@IdCliente int,
@IdProduto int,
@QtdProd int
)

AS
	Begin
		
			declare @PrecoUnidade money
			set @PrecoUnidade = (Select Preco from Produto where IdProduto = @IdProduto)
			
			declare @ValorTotal money
			set @ValorTotal = (@PrecoUnidade*@QtdProd)
		
			declare @Parametro int 
			set @Parametro = (Select IdPedido from Pedido where IdPedido =@IdPedido)
			If @Parametro = @IdPedido
			
			begin
			
				Update Pedido
				set IdCliente = (@IdCliente), IdProduto = (@IdProduto), QtdProduto = (@QtdProd)
				Where IdPedido = @IdPedido
			
			End
		End

exec STPAlterarPedido @IdPedido = 3, @IdCliente = 2, @IdProduto = 5, @QtdProd = 10

create procedure STPExcluirPedido(
@IdPedido int 
)

as
	Begin
		delete  from Pedido
		where IdPedido = @IdPedido
	end

exec STPExcluirPedido @IdPedido = 7
select*from Pedido