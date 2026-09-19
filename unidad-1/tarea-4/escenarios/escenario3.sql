START TRANSACTION;

INSERT INTO compras (id_compra, total) VALUES (3, 2000.00);

UPDATE producto 
SET stock = stock - 1 
WHERE id_producto = 1;

INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario) 
VALUES (3, 1, 1, 2000.00);

INSERT INTO pagos (id_compra, monto, metodo) 
VALUES (3, 0.00, 'Tarjeta de Débito');

ROLLBACK;