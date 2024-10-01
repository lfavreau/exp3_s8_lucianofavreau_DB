-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-30 21:56:35 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE costosoperacionales (
    id_costo    INTEGER NOT NULL,
    descripcion VARCHAR2(255),
    monto       NUMBER(10, 2),
    fecha       DATE,
    id_escuela  INTEGER NOT NULL
)
LOGGING;

ALTER TABLE costosoperacionales ADD CONSTRAINT costosoperacionales_pk PRIMARY KEY ( id_costo );

CREATE TABLE escuelasdeportivas (
    id_escuela           INTEGER NOT NULL,
    nombre               VARCHAR2(100) NOT NULL,
    tipo_deporte         VARCHAR2(50) NOT NULL,
    informacion_contacto VARCHAR2(255),
    direccion            VARCHAR2(255)
)
LOGGING;

ALTER TABLE escuelasdeportivas ADD CONSTRAINT escuelasdeportivas_pk PRIMARY KEY ( id_escuela );

ALTER TABLE escuelasdeportivas ADD CONSTRAINT un_escuelas_nombre UNIQUE ( nombre );

CREATE TABLE instalacionesdeportivas (
    id_instalacion INTEGER NOT NULL,
    nombre         VARCHAR2(100),
    tipo           VARCHAR2(50),
    capacidad      INTEGER,
    id_escuela     INTEGER NOT NULL
)
LOGGING;

ALTER TABLE instalacionesdeportivas ADD CONSTRAINT instalacionesdeportivas_pk PRIMARY KEY ( id_instalacion );

CREATE TABLE personal (
    id_personal  INTEGER NOT NULL,
    nombre       VARCHAR2(100) NOT NULL,
    profesion    VARCHAR2(50),
    nacionalidad VARCHAR2(50),
    otros_datos  VARCHAR2(255),
    id_escuela   INTEGER NOT NULL
)
LOGGING;

ALTER TABLE personal ADD CONSTRAINT personal_pk PRIMARY KEY ( id_personal );

ALTER TABLE costosoperacionales
    ADD CONSTRAINT fk_costos_escuela FOREIGN KEY ( id_escuela )
        REFERENCES escuelasdeportivas ( id_escuela )
    NOT DEFERRABLE;

ALTER TABLE instalacionesdeportivas
    ADD CONSTRAINT fk_instalaciones_escuela FOREIGN KEY ( id_escuela )
        REFERENCES escuelasdeportivas ( id_escuela )
    NOT DEFERRABLE;

ALTER TABLE personal
    ADD CONSTRAINT fk_personal_escuela FOREIGN KEY ( id_escuela )
        REFERENCES escuelasdeportivas ( id_escuela )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
