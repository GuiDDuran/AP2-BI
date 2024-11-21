
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                etl_versao INTEGER,
                CONSTRAINT sk_data_pk PRIMARY KEY (sk_data)
);


CREATE SEQUENCE public.dim_filial_sk_filial_seq;

CREATE TABLE public.dim_filial (
                sk_filial INTEGER NOT NULL DEFAULT nextval('public.dim_filial_sk_filial_seq'),
                nk_filial INTEGER NOT NULL,
                cidade VARCHAR NOT NULL,
                estado VARCHAR NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_filial PRIMARY KEY (sk_filial)
);


ALTER SEQUENCE public.dim_filial_sk_filial_seq OWNED BY public.dim_filial.sk_filial;

CREATE SEQUENCE public.dim_fornecedor_sk_fornecedor_seq;

CREATE TABLE public.dim_fornecedor (
                sk_fornecedor INTEGER NOT NULL DEFAULT nextval('public.dim_fornecedor_sk_fornecedor_seq'),
                nk_fornecedor INTEGER NOT NULL,
                cidade VARCHAR NOT NULL,
                estado VARCHAR NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_fornecedor PRIMARY KEY (sk_fornecedor)
);


ALTER SEQUENCE public.dim_fornecedor_sk_fornecedor_seq OWNED BY public.dim_fornecedor.sk_fornecedor;

CREATE SEQUENCE public.dim_veiculo_sk_veiculo_seq;

CREATE TABLE public.dim_veiculo (
                sk_veiculo INTEGER NOT NULL DEFAULT nextval('public.dim_veiculo_sk_veiculo_seq'),
                nk_veiculo INTEGER NOT NULL,
                montadora VARCHAR NOT NULL,
                modelo VARCHAR NOT NULL,
                tipo VARCHAR NOT NULL,
                status VARCHAR NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_veiculo PRIMARY KEY (sk_veiculo)
);


ALTER SEQUENCE public.dim_veiculo_sk_veiculo_seq OWNED BY public.dim_veiculo.sk_veiculo;

CREATE TABLE public.ft_compra (
                sk_veiculo INTEGER NOT NULL,
                sk_fornecedor INTEGER NOT NULL,
                sk_filial INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dt_compra DATE NOT NULL,
                preco_compra REAL NOT NULL
);


ALTER TABLE public.ft_compra ADD CONSTRAINT dim_data_ft_compra_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_filial_ft_compra_fk
FOREIGN KEY (sk_filial)
REFERENCES public.dim_filial (sk_filial)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_fornecedor_ft_compra_fk
FOREIGN KEY (sk_fornecedor)
REFERENCES public.dim_fornecedor (sk_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_compra ADD CONSTRAINT dim_veiculo_ft_compra_fk
FOREIGN KEY (sk_veiculo)
REFERENCES public.dim_veiculo (sk_veiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
