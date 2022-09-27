DROP DATABASE sic;
CREATE DATABASE sic;
USE sic;
CREATE TABLE bodegas
(
	codigo_bodega VARCHAR(5) PRIMARY KEY,
    nombre_bodega VARCHAR(60),
    estatus_bodega VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE lineas
(
	codigo_linea VARCHAR(5) PRIMARY KEY,
    nombre_linea VARCHAR(60),
    estatus_linea VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE marcas
(
	codigo_marca VARCHAR(5) PRIMARY KEY,
    nombre_marca VARCHAR(60),
    estatus_marca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE productos
(
	codigo_producto VARCHAR(18) PRIMARY KEY,
    nombre_producto VARCHAR(60),
    codigo_linea VARCHAR(5),
    codigo_marca VARCHAR(5),
    existencia_producto FLOAT(10,2),
    estatus_producto VARCHAR(1),
    FOREIGN KEY (codigo_linea) REFERENCES lineas(codigo_linea),
    FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE existencias
(
	codigo_bodega VARCHAR(5),
    codigo_producto VARCHAR(18),
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_bodega, codigo_producto),
	FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE vendedores
(
	codigo_vendedor VARCHAR(5) PRIMARY KEY,
    nombre_vendedor VARCHAR(60),
    direccion_vendedor VARCHAR(60),
    telefono_vendedor VARCHAR(50),
    nit_vendedor VARCHAR(20),
    estatus_vendedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE clientes
(
	codigo_cliente VARCHAR(5) PRIMARY KEY,
    nombre_cliente VARCHAR(60),
    direccion_cliente VARCHAR(60),
    nit_cliente VARCHAR(20),
    telefono_cliente VARCHAR(50),
    codigo_vendedor VARCHAR(5),
    estatus_cliente VARCHAR(1),
    FOREIGN KEY (codigo_vendedor) REFERENCES vendedores(codigo_vendedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE proveedores
(
	codigo_proveedor VARCHAR(5) PRIMARY KEY,
    nombre_proveedor VARCHAR(60),
    direccion_proveedor VARCHAR(60),
    telefono_proveedor VARCHAR(50),
    nit_proveedor VARCHAR(50),
    estatus_proveedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE compras_encabezado
(
	documento_compraenca VARCHAR(10) PRIMARY KEY,
    codigo_proveedor VARCHAR(5),
    fecha_compraenca DATE,
	total_compraenca FLOAT(10,2),
    estatus_compraenca VARCHAR(1),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE compras_detalle
(
	documento_compraenca VARCHAR(10),
    codigo_producto VARCHAR(18),
    cantidad_compradet FLOAT(10,2),
    costo_compradet FLOAT(10,2),
	codigo_bodega VARCHAR(5),
    PRIMARY KEY (documento_compraenca, codigo_producto),
    FOREIGN KEY (documento_compraenca) REFERENCES compras_encabezado(documento_compraenca),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE ventas_encabezado
(
	documento_ventaenca VARCHAR(10) PRIMARY KEY,
    codigo_cliente VARCHAR(5),
    fecha_ventaenca DATE,
    total_ventaenca FLOAT(10,2),
    estatus_ventaenca VARCHAR(1),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE ventas_detalle
(
	documento_ventaenca VARCHAR(10),
    codigo_producto VARCHAR(18),
    cantidad_ventadet FLOAT(10,2),
    costo_ventadet FLOAT(10,2),
    precio_ventadet FLOAT(10,2),
    codigo_bodega VARCHAR(5),
    PRIMARY KEY (documento_ventaenca, codigo_producto),
    FOREIGN KEY (documento_ventaenca) REFERENCES ventas_encabezado(documento_ventaenca),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


INSERT INTO `sic`.`bodegas` (`codigo_bodega`, `nombre_bodega`, `estatus_bodega`) VALUES ('01', 'Central', '1');
INSERT INTO `sic`.`bodegas` (`codigo_bodega`, `nombre_bodega`, `estatus_bodega`) VALUES ('02', 'Zona 1', '1');

INSERT INTO `sic`.`lineas` (`codigo_linea`, `nombre_linea`, `estatus_linea`) VALUES ('001', 'Deportiva', '1');
INSERT INTO `sic`.`lineas` (`codigo_linea`, `nombre_linea`, `estatus_linea`) VALUES ('002', 'Casual', '2');

INSERT INTO `sic`.`productos` (`codigo_producto`, `nombre_producto`, `codigo_linea`, `codigo_marca`, `existencia_producto`, `estatus_producto`) VALUES ('1001', 'Tenis para correr', '001', '102', '10', '1');
INSERT INTO `sic`.`productos` (`codigo_producto`, `nombre_producto`, `codigo_linea`, `codigo_marca`, `existencia_producto`, `estatus_producto`) VALUES ('1002', 'Sudadera Algodon', '002', '101', '10', '1');

INSERT INTO `sic`.`vendedores` (`codigo_vendedor`, `nombre_vendedor`, `direccion_vendedor`, `telefono_vendedor`, `nit_vendedor`, `estatus_vendedor`) VALUES ('01', 'Vilma Avila', 'zona 1 ciudad de guatemala', '94753456', '3476453', '1');

INSERT INTO `sic`.`clientes` (`codigo_cliente`, `nombre_cliente`, `direccion_cliente`, `nit_cliente`, `telefono_cliente`, `codigo_vendedor`, `estatus_cliente`) VALUES ('2000', 'Pedro Rodriguez', 'Ciudad', '2356453', '23754698', '01', '1');

INSERT INTO `sic`.`ventas_detalle` (`documento_ventaenca`, `codigo_producto`, `cantidad_ventadet`, `costo_ventadet`, `precio_ventadet`, `codigo_bodega`) VALUES ('3000', '1001', '2', '75', '190', '01');
INSERT INTO `sic`.`ventas_detalle` (`documento_ventaenca`, `codigo_producto`, `cantidad_ventadet`, `costo_ventadet`, `precio_ventadet`, `codigo_bodega`) VALUES ('3001', '1002', '1', '100', '495', '02');

INSERT INTO `sic`.`existencias` (`codigo_bodega`, `codigo_producto`, `saldo_existencia`) VALUES ('01', '1001', '10');
INSERT INTO `sic`.`existencias` (`codigo_bodega`, `codigo_producto`, `saldo_existencia`) VALUES ('02', '1002', '10');



    