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
             values('Bolo', '2022-09-21', 7,35.90),
                   ('Brigadeiro', '2022-05-18',45,3.90),
                   ('Beijinho', '2022-05-18',45,2.80),
                   ('Cupcacke', '2022-06-08',25,5.99),
                   ('Brownie', '2022-05-28',30,7.99),
                   ('Cookie', '2022-06-19',25,3.50),
                   ('Bolo de pote', '2022-07-10',15,15.50),
                   ('Trufas', '2022-05-18',40,2.00),
                   ('Sonho', '2022-05-15',20,8.00),
                   ('Torta Doce', '2022-05-20',10,25.00)

                   select* from Produto


CREATE PROCEDURE STPIncluirProduto(
@Nome varchar(100),
@DataVencimento date,
@Preco float,
@Quantidade tinyint
)
AS
BEGIN

                      insert into Produto (Nome, DataVencimento, Quantidade, Preco)
                      values (@Nome, @DataVencimento, @Quantidade, @Preco)
END

EXEC STPIncluirProduto @Nome = 'PizzaDoce', @DataVencimento = '2023-05-07', @Quantidade = 20, @Preco = 30.00


 
CREATE PROCEDURE STPExcluirProduto(
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

CREATE PROCEDURE STPAlterarProduto(

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

exec STPAlterarProduto  @IdProduto=3, @DataVencimento = '2023-06-10', @Quantidade = 2,@Preco = 23.90




CREATE VIEW vwConsultarProduto
AS select *from Produto
select IdProduto from vwConsultarProduto
