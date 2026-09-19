START TRANSACTION;

INSERT INTO compras (id_compra, total) VALUES (2, 20000.00);

UPDATE producto 
SET stock = stock - 10 
WHERE id_producto = 1;

ROLLBACK;