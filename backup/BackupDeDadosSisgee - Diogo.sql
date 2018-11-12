--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.4

-- Started on 2018-11-03 17:34:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16534)
-- Name: agenteintegracao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenteintegracao (
    idagenteintegracao integer NOT NULL,
    cnpjagenteintegracao character varying(14) NOT NULL,
    nomeagenteintegracao character varying(100) NOT NULL
);


ALTER TABLE public.agenteintegracao OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16539)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    idaluno integer NOT NULL,
    matricula character varying(100) NOT NULL,
    tipoaluno character varying(50),
    curso_idcurso integer,
    pessoa_idpessoa bigint
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16544)
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    idcampus integer NOT NULL,
    nomecampus character varying(100) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16549)
-- Name: conveniado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conveniado (
    id bigint NOT NULL,
    agenteintegracao boolean,
    ano character varying(255),
    cnpj character varying(255),
    email character varying(255),
    nome character varying(255),
    numconvenio character varying(255),
    numero character varying(255),
    obs character varying(255),
    ramal character varying(255),
    telefone character varying(255),
    telefone2 character varying(255),
    vigencia date
);


ALTER TABLE public.conveniado OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16557)
-- Name: convenio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.convenio (
    idconvenio integer NOT NULL,
    ano character varying(4) NOT NULL,
    dataassinatura timestamp without time zone NOT NULL,
    numero character varying(6) NOT NULL,
    numeroconvenio character varying(10) NOT NULL,
    empresa_idempresa integer,
    pessoa_idpessoa bigint
);


ALTER TABLE public.convenio OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16562)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    idcurso integer NOT NULL,
    codigocurso character varying(50) NOT NULL,
    nomecurso character varying(255) NOT NULL,
    campus_idcampus integer
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16567)
-- Name: cursoaux; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursoaux (
    id bigint NOT NULL,
    codigo character varying(255),
    nome character varying(255)
);


ALTER TABLE public.cursoaux OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16575)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    idempresa integer NOT NULL,
    agenteintegracao boolean,
    cnpjempresa character varying(14) NOT NULL,
    contatoempresa character varying(50),
    emailempresa character varying(50),
    razaosocial character varying(100),
    telefoneempresa character varying(11)
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16580)
-- Name: estudante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudante (
    idaluno bigint NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    cidade character varying(255),
    complemento character varying(255),
    cursoestudante character varying(255),
    endereco character varying(255),
    estado character varying(255),
    identidade character varying(255),
    matricula character varying(255),
    nome character varying(255),
    serie character varying(255),
    telefone character varying(255),
    unidade character varying(255),
    cursoaux_id bigint
);


ALTER TABLE public.estudante OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16646)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16588)
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    id bigint NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    cpf character varying(255),
    curso character varying(255),
    logradouro character varying(255),
    matricula character varying(255),
    nome character varying(255),
    numero character varying(255),
    situacao character varying(255),
    uf character varying(255),
    unidade character varying(255)
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16596)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    idpessoa bigint NOT NULL,
    cpf character varying(11) NOT NULL,
    email character varying(50),
    nome character varying(100) NOT NULL,
    telefone character varying(11)
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16601)
-- Name: professororientador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professororientador (
    idprofessororientador integer NOT NULL,
    nomeprofessororientador character varying(80) NOT NULL
);


ALTER TABLE public.professororientador OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16606)
-- Name: termoaditivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termoaditivo (
    idtermoaditivo integer NOT NULL,
    bairroenderecotermoaditivo character varying(150),
    cargahorariatermoaditivo integer,
    cargosupervisor character varying(255),
    cependerecotermoaditivo character varying(15),
    cidadeenderecotermoaditivo character varying(150),
    complementoenderecotermoaditivo character varying(150),
    datacadastramentotermoaditivo timestamp without time zone NOT NULL,
    datafimtermoaditivo timestamp without time zone,
    enderecotermoaditivo character varying(255),
    eobrigatorio character varying(255),
    estadoenderecotermoaditivo character varying(2),
    nomesupervisor character varying(255),
    numeroenderecotermoaditivo character varying(10),
    tipoaditivo character varying(255),
    valorbolsatermoaditivo real,
    professororientador_idprofessororientador integer,
    termoestagio_idtermoestagio integer
);


ALTER TABLE public.termoaditivo OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16614)
-- Name: termoaditivoaux; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termoaditivoaux (
    idtermoaditivo integer NOT NULL,
    bairroenderecotermoaditivo character varying(150),
    cargahorariatermoaditivo integer,
    cargosupervisor character varying(255),
    cependerecotermoaditivo character varying(15),
    cidadeenderecotermoaditivo character varying(150),
    complementoenderecotermoaditivo character varying(150),
    datacadastramentotermoaditivo timestamp without time zone NOT NULL,
    datafimtermoaditivo timestamp without time zone,
    enderecotermoaditivo character varying(255),
    eobrigatorio character varying(255),
    estadoenderecotermoaditivo character varying(2),
    nomesupervisor character varying(255),
    numeroenderecotermoaditivo character varying(10),
    tipoaditivo character varying(255),
    valorbolsatermoaditivo real,
    termoestagio_idtermoestagio bigint
);


ALTER TABLE public.termoaditivoaux OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16622)
-- Name: termoest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termoest (
    idtermoestagio bigint NOT NULL,
    convenio character varying(255),
    bairro character varying(255),
    cargahoraria integer NOT NULL,
    cartarecisao character varying(255),
    cep character varying(255),
    cidade character varying(255),
    complemento character varying(255),
    datafim date,
    datainicio date,
    endereco character varying(255),
    estado character varying(255),
    nomeempresa character varying(255),
    telefone character varying(255),
    termoaditivo character varying(255),
    valorbolsa real NOT NULL,
    aluno_idaluno bigint,
    c_id bigint
);


ALTER TABLE public.termoest OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16630)
-- Name: termoestagio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termoestagio (
    idtermoestagio integer NOT NULL,
    bairroenderecotermoestagio character varying(150) NOT NULL,
    cargahorariatermoestagio integer NOT NULL,
    cargosupervisor character varying(80),
    cependerecotermoestagio character varying(15) NOT NULL,
    cidadeenderecotermoestagio character varying(150) NOT NULL,
    complementoenderecotermoestagio character varying(150) NOT NULL,
    datafimtermoestagio timestamp without time zone,
    datainiciotermoestagio timestamp without time zone NOT NULL,
    datarescisaotermoestagio timestamp without time zone,
    eestagioobrigatorio boolean NOT NULL,
    enderecotermoestagio character varying(255) NOT NULL,
    estado character varying(255),
    estadoenderecotermoestagio character varying(2) NOT NULL,
    nomeagenciada character varying(255),
    nomesupervisor character varying(80),
    numeroenderecotermoestagio character varying(10) NOT NULL,
    valorbolsa real NOT NULL,
    aluno_idaluno integer NOT NULL,
    convenio_idconvenio integer NOT NULL,
    professororientador_idprofessororientador integer
);


ALTER TABLE public.termoestagio OWNER TO postgres;

--
-- TOC entry 2913 (class 0 OID 16534)
-- Dependencies: 196
-- Data for Name: agenteintegracao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2914 (class 0 OID 16539)
-- Dependencies: 197
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno VALUES (1, '1622159BCC', 'graduação', 1, 1);
INSERT INTO public.aluno VALUES (2, '5555555AAA', 'graduação', 1, 2);
INSERT INTO public.aluno VALUES (3, '1234567TCC', 'graduação', 2, 3);


--
-- TOC entry 2915 (class 0 OID 16544)
-- Dependencies: 198
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.campus VALUES (1, 'maracanã');


--
-- TOC entry 2916 (class 0 OID 16549)
-- Dependencies: 199
-- Data for Name: conveniado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 16557)
-- Dependencies: 200
-- Data for Name: convenio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.convenio VALUES (1, '2018', '2018-10-28 20:42:06.982135', '123', '2134', 1, 2);
INSERT INTO public.convenio VALUES (7, '2018', '2018-10-01 00:00:00', '2', '2/2018', 6, NULL);
INSERT INTO public.convenio VALUES (4, '2018', '2018-11-14 00:00:00', '3', '3/2018', 3, NULL);


--
-- TOC entry 2918 (class 0 OID 16562)
-- Dependencies: 201
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso VALUES (1, '123', 'ciencias da computação', 1);
INSERT INTO public.curso VALUES (2, '345', 'Engenharia de Telecomunicações', 1);


--
-- TOC entry 2919 (class 0 OID 16567)
-- Dependencies: 202
-- Data for Name: cursoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2920 (class 0 OID 16575)
-- Dependencies: 203
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa VALUES (1, true, '55555555555555', 'aaaaaaa', 'empresaA@hotmail.com', 'Marcos', '21988888888');
INSERT INTO public.empresa VALUES (3, true, '77777777777777', 'contatob', 'empresaB@hotmail.com', 'razaoB', '21977777777');
INSERT INTO public.empresa VALUES (6, true, '99999999999999', 'CCC', 'empresaC@hotmail.com', 'razaoC', '2195555555');


--
-- TOC entry 2921 (class 0 OID 16580)
-- Dependencies: 204
-- Data for Name: estudante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2922 (class 0 OID 16588)
-- Dependencies: 205
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2923 (class 0 OID 16596)
-- Dependencies: 206
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoa VALUES (1, '14937262777', 'nanu.godoy@hotmail.com', 'Fernando Godoy', '21979230104');
INSERT INTO public.pessoa VALUES (2, '22222222222', 'asd@hotmail.com', 'AAA BBB', '21999999999');
INSERT INTO public.pessoa VALUES (3, '12345678902', 'diogaoteste@testedodiogao.com', 'Diogao Teste', '11981291010');


--
-- TOC entry 2924 (class 0 OID 16601)
-- Dependencies: 207
-- Data for Name: professororientador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professororientador VALUES (1, 'Jorge');


--
-- TOC entry 2925 (class 0 OID 16606)
-- Dependencies: 208
-- Data for Name: termoaditivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoaditivo VALUES (7, NULL, NULL, 'cargo do supervisor alterado', NULL, NULL, NULL, '2018-11-03 17:27:30.137', NULL, NULL, 'sim', NULL, 'Supervisor alterado', NULL, 'Supervisor', NULL, NULL, 6);


--
-- TOC entry 2926 (class 0 OID 16614)
-- Dependencies: 209
-- Data for Name: termoaditivoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2927 (class 0 OID 16622)
-- Dependencies: 210
-- Data for Name: termoest; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2928 (class 0 OID 16630)
-- Dependencies: 211
-- Data for Name: termoestagio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoestagio VALUES (1, 'Ilha do Governador', 4, 'gerente', '21.911-550', 'Rio de Janeiro', 'casa 4', '2018-10-01 00:00:00', '2017-11-01 00:00:00', NULL, true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1580, 1, 1, 1);
INSERT INTO public.termoestagio VALUES (2, 'Ilha do Governador', 4, 'Alberto', '21.911-550', 'Rio de Janeiro', 'casa 4', '2019-10-25 00:00:00', '2018-10-04 00:00:00', '2018-10-10 00:00:00', true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1586, 2, 1, 1);
INSERT INTO public.termoestagio VALUES (8, 'Ilha do Governador', 4, 'gerente', '21.911-550', 'Rio de Janeiro', 'casa 4', '2019-04-04 00:00:00', '2018-10-29 00:00:00', NULL, true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1234.56006, 2, 1, 1);
INSERT INTO public.termoestagio VALUES (9, 'Diogao', 4, 'Arnaldo', '10.101-011', 'Rio de Janeiro', 'casa 10', '2018-11-03 16:01:47.459411', '2018-11-02 17:30:56.624505', NULL, true, 'Rua a', 'ativo', 'RJ', 'bbbb', 'Arnaldo', '401', 1500, 3, 1, 1);
INSERT INTO public.termoestagio VALUES (5, 'Diogão do Bairro', 4, 'Diogão cargo', '12.344-554', 'Diogão da Cidade', 'Apto Diogão', '2017-11-20 00:00:00', '2015-10-29 00:00:00', NULL, true, 'Rua do Diogão', 'ativo', 'AC', 'Agenciada 1', 'supervisore', '321', 1500, 3, 1, 1);
INSERT INTO public.termoestagio VALUES (6, 'Ilha do Governador', 4, 'Cargo do Godoy', '12.344-554', 'São Paulo', 'apto do Godoy', '2021-03-25 00:00:00', '2018-11-27 00:00:00', NULL, true, 'Godoyzinho da Ilha', 'ativo', 'AC', 'Agenciada 2', 'Supervisor do Godoy', '334', 1300, 1, 1, 1);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 212
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 7, true);


--
-- TOC entry 2739 (class 2606 OID 16538)
-- Name: agenteintegracao agenteintegracao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT agenteintegracao_pkey PRIMARY KEY (idagenteintegracao);


--
-- TOC entry 2743 (class 2606 OID 16543)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (idaluno);


--
-- TOC entry 2747 (class 2606 OID 16548)
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (idcampus);


--
-- TOC entry 2751 (class 2606 OID 16556)
-- Name: conveniado conveniado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conveniado
    ADD CONSTRAINT conveniado_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 16561)
-- Name: convenio convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (idconvenio);


--
-- TOC entry 2755 (class 2606 OID 16566)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (idcurso);


--
-- TOC entry 2757 (class 2606 OID 16574)
-- Name: cursoaux cursoaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursoaux
    ADD CONSTRAINT cursoaux_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 16579)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- TOC entry 2763 (class 2606 OID 16587)
-- Name: estudante estudante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT estudante_pkey PRIMARY KEY (idaluno);


--
-- TOC entry 2765 (class 2606 OID 16595)
-- Name: matricula matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 16600)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (idpessoa);


--
-- TOC entry 2769 (class 2606 OID 16605)
-- Name: professororientador professororientador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professororientador
    ADD CONSTRAINT professororientador_pkey PRIMARY KEY (idprofessororientador);


--
-- TOC entry 2771 (class 2606 OID 16613)
-- Name: termoaditivo termoaditivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT termoaditivo_pkey PRIMARY KEY (idtermoaditivo);


--
-- TOC entry 2773 (class 2606 OID 16621)
-- Name: termoaditivoaux termoaditivoaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT termoaditivoaux_pkey PRIMARY KEY (idtermoaditivo);


--
-- TOC entry 2775 (class 2606 OID 16629)
-- Name: termoest termoest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT termoest_pkey PRIMARY KEY (idtermoestagio);


--
-- TOC entry 2777 (class 2606 OID 16637)
-- Name: termoestagio termoestagio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT termoestagio_pkey PRIMARY KEY (idtermoestagio);


--
-- TOC entry 2745 (class 2606 OID 16641)
-- Name: aluno uk_2yc6wv6b5w2aph89au30mw6gj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT uk_2yc6wv6b5w2aph89au30mw6gj UNIQUE (matricula);


--
-- TOC entry 2741 (class 2606 OID 16639)
-- Name: agenteintegracao uk_6igom1spncnhloepe2aack7gt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT uk_6igom1spncnhloepe2aack7gt UNIQUE (cnpjagenteintegracao);


--
-- TOC entry 2761 (class 2606 OID 16645)
-- Name: empresa uk_c64e255k43j4vyakw4sk4eqgi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_c64e255k43j4vyakw4sk4eqgi UNIQUE (cnpjempresa);


--
-- TOC entry 2749 (class 2606 OID 16643)
-- Name: campus uk_fdiodxq54qv5lkp07skvt8x7n; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT uk_fdiodxq54qv5lkp07skvt8x7n UNIQUE (nomecampus);


--
-- TOC entry 2785 (class 2606 OID 16683)
-- Name: termoaditivo fk2ei3f44ll190epmmkphihb08d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fk2ei3f44ll190epmmkphihb08d FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoestagio(idtermoestagio);


--
-- TOC entry 2790 (class 2606 OID 16708)
-- Name: termoestagio fka6ymejgdnnxcsx0077xplw6v9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fka6ymejgdnnxcsx0077xplw6v9 FOREIGN KEY (convenio_idconvenio) REFERENCES public.convenio(idconvenio);


--
-- TOC entry 2779 (class 2606 OID 16653)
-- Name: aluno fkamcoe2657asi0hc60nhmsoskh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fkamcoe2657asi0hc60nhmsoskh FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);


--
-- TOC entry 2787 (class 2606 OID 16693)
-- Name: termoest fkbijaud1t0c104g2qaxb044aw1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkbijaud1t0c104g2qaxb044aw1 FOREIGN KEY (aluno_idaluno) REFERENCES public.estudante(idaluno);


--
-- TOC entry 2786 (class 2606 OID 16688)
-- Name: termoaditivoaux fkep3nq6yrwy50xt0jfeymf3a5x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT fkep3nq6yrwy50xt0jfeymf3a5x FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoest(idtermoestagio);


--
-- TOC entry 2788 (class 2606 OID 16698)
-- Name: termoest fkjelry0l68fg5ksw74idaod3iv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkjelry0l68fg5ksw74idaod3iv FOREIGN KEY (c_id) REFERENCES public.conveniado(id);


--
-- TOC entry 2791 (class 2606 OID 16713)
-- Name: termoestagio fkjnf5ifmew6yube38nb5sy9tos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkjnf5ifmew6yube38nb5sy9tos FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);


--
-- TOC entry 2780 (class 2606 OID 16658)
-- Name: convenio fkllshachtu0eb3riu9kqeipr7m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkllshachtu0eb3riu9kqeipr7m FOREIGN KEY (empresa_idempresa) REFERENCES public.empresa(idempresa);


--
-- TOC entry 2789 (class 2606 OID 16703)
-- Name: termoestagio fkmoa2nhlvaxvxcfq41wj39ha08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkmoa2nhlvaxvxcfq41wj39ha08 FOREIGN KEY (aluno_idaluno) REFERENCES public.aluno(idaluno);


--
-- TOC entry 2783 (class 2606 OID 16673)
-- Name: estudante fkniuw7njxma8lm7xv2y3gqjjl3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT fkniuw7njxma8lm7xv2y3gqjjl3 FOREIGN KEY (cursoaux_id) REFERENCES public.cursoaux(id);


--
-- TOC entry 2782 (class 2606 OID 16668)
-- Name: curso fkphssmesk3qnf24haly37grjlb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkphssmesk3qnf24haly37grjlb FOREIGN KEY (campus_idcampus) REFERENCES public.campus(idcampus);


--
-- TOC entry 2781 (class 2606 OID 16663)
-- Name: convenio fkr4vu5p0r10bdc6pw8tjh8hvc6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkr4vu5p0r10bdc6pw8tjh8hvc6 FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);


--
-- TOC entry 2784 (class 2606 OID 16678)
-- Name: termoaditivo fks9ar4lhdelgfprino2pe67fd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fks9ar4lhdelgfprino2pe67fd5 FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);


--
-- TOC entry 2778 (class 2606 OID 16648)
-- Name: aluno fksl780qshiu1ok02cfow0pw2i9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fksl780qshiu1ok02cfow0pw2i9 FOREIGN KEY (curso_idcurso) REFERENCES public.curso(idcurso);


-- Completed on 2018-11-03 17:34:19

--
-- PostgreSQL database dump complete
--

