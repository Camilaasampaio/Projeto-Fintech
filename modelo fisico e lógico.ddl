-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-05-11 19:06:13 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_imagem (
    cd_imagem  NUMBER(10) NOT NULL,
    ds_imagem  VARCHAR2(100) NOT NULL,
    ds_caminho VARCHAR2(100) NOT NULL
);

ALTER TABLE t_imagem ADD CONSTRAINT t_imagem_pk PRIMARY KEY ( cd_imagem );

CREATE TABLE t_poupanca (
    cd_poupanca          NUMBER(10) NOT NULL,
    vl_poupanca          NUMBER(10, 2) NOT NULL,
    dt_abertura          DATE NOT NULL,
    t_usuario_cd_usuario NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX t_poupanca__idx ON
    t_poupanca (
        t_usuario_cd_usuario
    ASC );

ALTER TABLE t_poupanca ADD CONSTRAINT t_poupanca_pk PRIMARY KEY ( cd_poupanca );

CREATE TABLE t_transferencias (
    cd_transferencia     NUMBER(10) NOT NULL,
    nm_transferencia     VARCHAR2(200) NOT NULL,
    dt_transferencia     DATE NOT NULL,
    vl_transferencia     NUMBER(10, 2) NOT NULL,
    ds_tipo              VARCHAR2(30) NOT NULL,
    t_usuario_cd_usuario NUMBER(10) NOT NULL,
    t_imagem_cd_imagem   NUMBER(10) NOT NULL
);

ALTER TABLE t_transferencias
    ADD CONSTRAINT t_transferencias_pk PRIMARY KEY ( cd_transferencia,
                                                     t_usuario_cd_usuario,
                                                     t_imagem_cd_imagem );

CREATE TABLE t_usuario (
    cd_usuario  NUMBER(10) NOT NULL,
    nm_usuario  VARCHAR2(200) NOT NULL,
    tx_email    VARCHAR2(100) NOT NULL,
    tx_senha    VARCHAR2(50) NOT NULL,
    nr_agencia  NUMBER(10) NOT NULL,
    nr_conta    NUMBER(10) NOT NULL,
    dt_cadastro DATE NOT NULL
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( cd_usuario );

ALTER TABLE t_poupanca
    ADD CONSTRAINT t_poupanca_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_transferencias
    ADD CONSTRAINT t_transferencias_t_imagem_fk FOREIGN KEY ( t_imagem_cd_imagem )
        REFERENCES t_imagem ( cd_imagem );

ALTER TABLE t_transferencias
    ADD CONSTRAINT t_transferencias_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             1
-- ALTER TABLE                              7
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
