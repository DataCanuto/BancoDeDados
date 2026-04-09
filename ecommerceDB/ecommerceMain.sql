use ecommerce;
/*O sistema precisa rastrear o CPF dos usuários. Escreva um comando ALTER TABLE para adicionar a coluna cpf (VARCHAR 11) à tabela USERS. Em seguida, adicione uma restrição UNIQUE para garantir que não haja CPFs duplicados.*/
alter table users add column cpf varchar(11) unique;
/*Imagine que a tabela SHOPPING_CART será substituída por um micros serviço externo. Escreva o comando para remover a tabela do banco de dados. O que acontece com a tabela CART_ITEMS se você tentar remover a SHOPPING_CART sem tratar as chaves estrangeiras?*/
drop table shopping_cart;
/*Se você tentar remover a tabela SHOPPING_CART sem tratar as chaves estrangeiras, o banco de dados retornará um erro devido à restrição de chave estrangeira presente na tabela CART_ITEMS, que faz referência à tabela SHOPPING_CART. Para remover a tabela SHOPPING_CART, você precisaria primeiro remover ou alterar a tabela CART_ITEMS para eliminar a dependência da chave estrangeira.*/
alter table cart_items drop foreign key fk_cartitems_shoppingcart;
drop table shopping_cart;
/*Escreva os comandos para inserir um novo usuário chamado "João Silva" e um produto chamado "Notebook Gamer" (na categoria 'Eletrônicos', ID 1). Garanta que os IDs inseridos respeitem a integridade referencial.*/
insert into users values (0,"João Silva","joao@email,com","123456",current_timestamp,"11999999999","05389536592");
/*Sem querer, eu digitei o email errado, vou dar um update*/
update users set email = "joao@silva.com" where id = 1;
insert into categories values (0,"Eletrônicos","Produtos eletrônicos",0);
insert into products values (0,1,"Notebook Gamer","Notebook para jogos",5000.00,100,123456,"url");

/*Um usuário decidiu comprar o produto acima. Escreva o comando para inserir este item na tabela ORDER_ITEMS. No campo price_at_purchase, como você faria para garantir que o preço gravado seja o preço atual da tabela PRODUCTS no momento da inserção?*/

insert into addresses values (0,1,"Rua A","Cidade B","Estado C","12345-678",0,current_timestamp);
insert into orders values (0,1,1,current_timestamp,(select price from products where id = 1),true);
insert into order_items values (0,2,1,1,(select price from products where id = 1));
/*Após uma venda de 2 unidades do produto com SKU = 5001, escreva um comando UPDATE que subtraia essa quantidade do campo stock na tabela PRODUCTS.*/
update products set stock = stock-2 where sku = 123456;

/*O pagamento de um pedido (ID 1) foi aprovado. Escreva dois comandos: um para atualizar o payment_status na tabela PAYMENTS e outro para atualizar o status do pedido na tabela ORDERS para 'Processando'.*/
insert into payments values (0,2,"Crédito",(select price from products where id = 1),"Aguardando",123456789);
update payments set payment_status = "Aprovado" where id = 1;
alter table orders alter column status varchar(50);
update orders set status ="Processando" where id = 2;
/*Escreva um comando para deletar todos os registros da tabela CART_ITEMS que pertencem a um cart_id específico, simulando a ação de um usuário que "esvaziou o carrinho".*/
insert into shopping_cart values(0,1,current_timestamp,current_timestamp);
insert into cart_items values (0,1,1,1);
delete from cart_items where cart_id = 1;
/*1. Cadastro de Novo Usuário
Insira um novo cliente na tabela USERS. O nome é "João Silva", e-mail "joao@email.com", com uma senha hash fictícia e um número de telefone à sua escolha.*/
insert into users values (0,"João Silva","joao@email.com","123456",current_timestamp,"71999999999","03090009552");
/*2. Definindo Endereço de Entrega
Insira um endereço para o usuário com id = 1. O endereço deve ser do tipo "Residencial", localizado na "Rua das Flores, 123, São Paulo, SP", CEP "01010-000", e definido como o endereço padrão (is_default).*/
insert into addresses values (0,1,"Rua das Flores, 123","São Paulo","SP","01010-000",0,current_timestamp);
update addresses set user_id = 2 where id = 2;
alter table addresses modify is_default bool;
update addresses set is_default = 0 where id = 1;
update addresses set is_default = 1 where id = 2;
/*3. Adicionando Produtos ao Estoque
Cadastre um novo produto na categoria de id = 5 (supondo ser 'Eletrônicos'). Nome: "Fone Bluetooth G3", Preço: 299.90, Estoque: 50 unidades, e um SKU único.Bloco 2: Operações de Atualização (UPDATE)*/
insert into products values (0,1,"Fone Bluetooth G3","Fone de ouvido sem fio",299.90,100,193849,"url");
/*4. Ajuste de Preços Inflacionários
Devido a um reajuste de fornecedor, aumente o preço de todos os produtos da tabela PRODUCTS em 10%.*/
update products set price = price + price * 0.10;

/*5. Gestão de Estoque Pós-Venda
O produto com id = 1 acaba de ter 5 unidades vendidas. Escreva o comando para subtrair essas 5 unidades da coluna stock atual.*/
update products set stock = stock - 5 where  id = 1;
/*6. Atualização de Status de Pagamento
O pagamento vinculado ao pedido (order_id) número 500 foi confirmado. Atualize o payment_status para "Confirmado" e o amount para o valor total de 150.00 na tabela PAYMENTS.*/
insert into orders values (0,2,2,current_timestamp,(select price from products where id = 2), "Processando");
insert into payments values (0,3,"Boleto",(select price from products where id = 2),(select status from orders where id = 2),123456789);

update payments set payment_status = "Confirmado" where id = 2;
update orders set status = (select payment_status from payments where id = 2) where id = 3;

/*7. Troca de Endereço Padrão
O usuário com id = 3 mudou de casa. Atualize a coluna is_default para FALSE em todos os seus endereços antigos antes de cadastrar o novo.Bloco 3: Operações de Exclusão (DELETE)*/
update addresses set is_default = 0 where user_id = 3;

/*8. Limpeza de Carrinhos Abandonados
Muitos usuários adicionam itens ao carrinho e não finalizam a compra. Remova todos os registros da tabela SHOPPING_CART que foram criados antes de '2024-01-01'.
Nota: Lembre-se que, devido às chaves estrangeiras, talvez seja necessário remover os itens em CART_ITEMS primeiro.*/
delete from cart_items where cart_id in (select id from shopping_cart where created_at < '2024-01-01');
delete from shopping_cart where created_at < '2024-01-01';

/*9. Remoção de Produto Descontinuado
A empresa decidiu parar de vender o produto com o SKU "OLD-123". Remova este produto da tabela PRODUCTS.Bloco 4: Questão Desafio (Combinada)*/
alter table products modify stock varchar(50);
update products set sku = "OLD-123" where id = 2;
delete from products where sku = "OLD-123";

/*10. O Ciclo do Pedido Cancelado
Um cliente desistiu de uma compra imediatamente após clicar em comprar.
A) Remova o registro correspondente na tabela ORDERS onde o id é 999.
B) Explique: Por que o banco de dados pode impedir essa deleção se houver registros em ORDER_ITEMS ou PAYMENTS vinculados a esse ID?*/
delete from order_items where order_id = 3;
delete from payments where order_id = 3;
delete from orders where id = 3;