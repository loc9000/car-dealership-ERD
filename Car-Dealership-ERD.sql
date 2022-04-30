CREATE TABLE "customers" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "cars" (
	"car_id" serial NOT NULL,
	"brand" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" int NOT NULL,
	"serial_number" int NOT NULL UNIQUE,
	"customer_id" int NOT NULL,
	CONSTRAINT "cars_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sales_person" (
	"sales_person_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"invoice_id" int NOT NULL,
	CONSTRAINT "sales_person_pk" PRIMARY KEY ("sales_person_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "invoices" (
	"invoice_id" serial NOT NULL,
	"amount" float8 NOT NULL,
	"date" TIMESTAMP NOT NULL,
	"customer_id" int NOT NULL,
	"car_id" int NOT NULL,
	CONSTRAINT "invoices_pk" PRIMARY KEY ("invoice_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mechanics" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanics_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "service_tickets" (
	"service_ticket_id" serial NOT NULL,
	"service_type" varchar(255) NOT NULL,
	"customer_id" int NOT NULL,
	"car_id" int NOT NULL,
	CONSTRAINT "service_tickets_pk" PRIMARY KEY ("service_ticket_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "parts" (
	"part_id" serial NOT NULL,
	"part_name" varchar(255) NOT NULL,
	"quantity" int NOT NULL,
	"amount" float8 NOT NULL,
	"service_ticket_id" int NOT NULL,
	CONSTRAINT "parts_pk" PRIMARY KEY ("part_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "service_history" (
	"service_history_id" serial NOT NULL,
	"date" TIMESTAMP NOT NULL,
	"serial_number" int NOT NULL,
	CONSTRAINT "service_history_pk" PRIMARY KEY ("service_history_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mechanics_to_cars" (
	"mechanics_id" int NOT NULL,
	"car_id" int NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "cars" ADD CONSTRAINT "cars_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");

ALTER TABLE "sales_person" ADD CONSTRAINT "sales_person_fk0" FOREIGN KEY ("invoice_id") REFERENCES "invoices"("invoice_id");

ALTER TABLE "invoices" ADD CONSTRAINT "invoices_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_fk1" FOREIGN KEY ("car_id") REFERENCES "cars"("car_id");


ALTER TABLE "service_tickets" ADD CONSTRAINT "service_tickets_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE "service_tickets" ADD CONSTRAINT "service_tickets_fk1" FOREIGN KEY ("car_id") REFERENCES "cars"("car_id");

ALTER TABLE "parts" ADD CONSTRAINT "parts_fk0" FOREIGN KEY ("service_ticket_id") REFERENCES "service_tickets"("service_ticket_id");

ALTER TABLE "service_history" ADD CONSTRAINT "service_history_fk0" FOREIGN KEY ("serial_number") REFERENCES "cars"("serial_number");

ALTER TABLE "mechanics_to_cars" ADD CONSTRAINT "mechanics_to_cars_fk0" FOREIGN KEY ("mechanics_id") REFERENCES "mechanics"("mechanic_id");
ALTER TABLE "mechanics_to_cars" ADD CONSTRAINT "mechanics_to_cars_fk1" FOREIGN KEY ("car_id") REFERENCES "cars"("car_id");









