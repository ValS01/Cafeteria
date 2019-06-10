create database cafeteria;
USE cafeteria;
create table Horario(
	ID_Horario varchar(15) PRIMARY KEY,
	Hora_Inicial varchar(5),
	Hora_Final varchar(5)
);

create table Mesas(
	ID_Mesa varchar(15) PRIMARY KEY,
	ID_Mesero varchar(15)
);


create table Reservaciones(
	ID_Reservacion varchar(15) PRIMARY KEY,
	Hora varchar(5),
	NomCliente varchar(50),
	Fecha varchar(10),
	ID_Cajero varchar(15)
);



create table Ingredientes(
	ID_Ingrediente varchar(15) PRIMARY KEY,
	NomIngrediente varchar(50),
	Caducidad varchar(10),
	Cantidad int
);

create table Orden(
	NumOrden int PRIMARY KEY,
	ID_Platillo varchar(15),
	ID_Mesero varchar(15)
);


create table Platillo(
	ID_Platillo varchar(15) PRIMARY KEY,
	NombrePlatillo varchar(50)
);



create table Ingre_Platillo(
	ID_Ingrediente varchar(15),
	ID_Platillo varchar(15)
);



create table Mesero(
	ID_Mesero varchar(15) PRIMARY KEY,
	Nombre varchar(70),
	Telefono varchar(10),
	Contrasenia varchar(10),
	ID_Horario varchar(15)
);



create table Cajero(
	ID_Cajero varchar(15) PRIMARY KEY,
	Nombre varchar(70),
	Telefono varchar(10),
	Contrasenia varchar(10),
	ID_Horario varchar(15)
);

create table Cocinero(
	ID_Cocinero varchar(15) PRIMARY KEY,
	Nombre varchar(70),
	Telefono varchar(10),
	Contrasenia varchar(10),
	ID_Horario varchar(15)	
);

#Datos
INSERT INTO Horario VALUES("Horario01","08:00","13:59");
INSERT INTO Horario VALUES("Horario02","14:00","21:59");

INSERT INTO Mesas VALUES("Mesa01","Mesero001");
INSERT INTO Mesas VALUES("Mesa04","Mesero002");

INSERT INTO Reservaciones VALUES("Reser01","12:00","Axel Perez","23/06/19","Cajero001");
INSERT INTO Reservaciones VALUES("Reser02","17:00","Juan Guzman","12/05/19","Cajero002");

INSERT INTO Ingredientes VALUES("Ingre001","Harina","04/09/20",5);
INSERT INTO Ingredientes VALUES("Ingre002","Azucar","04/10/19",7);
INSERT INTO Ingredientes VALUES("Ingre003","Leche","03/09/20",4);
INSERT INTO Ingredientes VALUES("Ingre004","chocolate en barra","08/06/20",3);
INSERT INTO Ingredientes VALUES("Ingre005","Pan blanco","04/03/20",2);
INSERT INTO Ingredientes VALUES("Ingre006","Pan integral","30/06/20",8);
INSERT INTO Ingredientes VALUES("Ingre007","Cafe en polvo","04/08/20",8);
INSERT INTO Ingredientes VALUES("Ingre008","Crema para Cafe","04/11/20",6);
INSERT INTO Ingredientes VALUES("Ingre009","Jamón","20/09/20",4);
INSERT INTO Ingredientes VALUES("Ingre010","Queso","04/06/20",5);
INSERT INTO Ingredientes VALUES("Ingre011","Nutella","15/04/20",5);
INSERT INTO Ingredientes VALUES("Ingre012","Harina de arroz","04/03/20",6);
INSERT INTO Ingredientes VALUES("Ingre013","Mantequilla","11/02/20",8);
INSERT INTO Ingredientes VALUES("Ingre014","Azucar glass","06/01/20",3);
INSERT INTO Ingredientes VALUES("Ingre015","Chocolate en polvo","05/06/20",8);

INSERT INTO Orden VALUES(1,"Platillo001","Mesero001");
INSERT INTO Orden VALUES(2,"Platillo004","Mesero002");
INSERT INTO Orden VALUES(3,"Platillo003","Mesero002");
INSERT INTO Orden VALUES(4,"Platillo005","Mesero001");

INSERT INTO Platillo VALUES("Platillo001","CupCakes");
INSERT INTO Platillo VALUES("Platillo002","Malteada de mango");
INSERT INTO Platillo VALUES("Platillo003","Sandwich queso");
INSERT INTO Platillo VALUES("Platillo004","Sandwich jamon");
INSERT INTO Platillo VALUES("Platillo005","CupCakes chocolate");

INSERT INTO Ingre_Platillo VALUES("Ingre001","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre002","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre004","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre003","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre013","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre014","Platillo001");
INSERT INTO Ingre_Platillo VALUES("Ingre003","Platillo002");
INSERT INTO Ingre_Platillo VALUES("Ingre005","Platillo003");
INSERT INTO Ingre_Platillo VALUES("Ingre006","Platillo004");
INSERT INTO Ingre_Platillo VALUES("Ingre009","Platillo004");
INSERT INTO Ingre_Platillo VALUES("Ingre001","Platillo005");
INSERT INTO Ingre_Platillo VALUES("Ingre002","Platillo005");
INSERT INTO Ingre_Platillo VALUES("Ingre004","Platillo005");
INSERT INTO Ingre_Platillo VALUES("Ingre003","Platillo005");
INSERT INTO Ingre_Platillo VALUES("Ingre013","Platillo005");
INSERT INTO Ingre_Platillo VALUES("Ingre014","Platillo005");

INSERT INTO Mesero VALUES("Mesero001","Sandra Carmona Hernandez","2234568710","12345","Horario01");
INSERT INTO Mesero VALUES("Mesero002","Carlos Sanchez Rodriguez","2231345553","12345","Horario02");

INSERT INTO Cajero VALUES("Cajero001","Alejandra Hernandez Molina","9428249520","12345","Horario01");
INSERT INTO Cajero VALUES("Cajero002","Ximena Alonso Carmona","4669309236","12345","Horario02");

INSERT INTO Cocinero VALUES("Cocinero001","Angel Emmanuel Hernandez Gonzalez","3409126789","12345","Horario01");
INSERT INTO Cocinero VALUES("Cocinero002","Cristian Yair Velazquez","1205387302","12345","Horario01");
INSERT INTO Cocinero VALUES("Cocinero003","Aneth Ramires Velazquez","3467091245","12345","Horario02");
INSERT INTO Cocinero VALUES("Cocinero004","Rosa Elpidia Cortez Ortigoza","5679089232","12345","Horario02");

#LLAVES FORANEAS
ALTER TABLE Mesas ADD FOREIGN KEY (ID_Mesero) REFERENCES Mesero(ID_Mesero);
ALTER TABLE Reservaciones ADD FOREIGN KEY (ID_Cajero) REFERENCES Cajero(ID_Cajero);
ALTER TABLE Ingre_Platillo ADD FOREIGN KEY (ID_Ingrediente) REFERENCES Ingredientes(ID_Ingrediente);
ALTER TABLE Ingre_Platillo ADD FOREIGN KEY (ID_Platillo) REFERENCES Platillo(ID_Platillo);
ALTER TABLE Orden ADD FOREIGN KEY (ID_Platillo) REFERENCES Platillo(ID_Platillo);
ALTER TABLE Orden ADD FOREIGN KEY (ID_Mesero) REFERENCES Mesero(ID_Mesero);
ALTER TABLE Mesero ADD FOREIGN KEY (ID_Horario) REFERENCES Horario(ID_Horario);
ALTER TABLE Cajero ADD FOREIGN KEY (ID_Horario) REFERENCES Horario(ID_Horario);
ALTER TABLE Cocinero ADD FOREIGN KEY (ID_Horario) REFERENCES Horario(ID_Horario);