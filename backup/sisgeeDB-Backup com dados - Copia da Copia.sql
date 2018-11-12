--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-04 03:50:03

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
-- TOC entry 196 (class 1259 OID 24777)
-- Name: agenteintegracao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenteintegracao (
    idagenteintegracao integer NOT NULL,
    cnpjagenteintegracao character varying(14) NOT NULL,
    nomeagenteintegracao character varying(100) NOT NULL
);


ALTER TABLE public.agenteintegracao OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24782)
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
-- TOC entry 198 (class 1259 OID 24787)
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    idcampus integer NOT NULL,
    nomecampus character varying(100) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24792)
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
-- TOC entry 200 (class 1259 OID 24800)
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
-- TOC entry 201 (class 1259 OID 24805)
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
-- TOC entry 202 (class 1259 OID 24810)
-- Name: cursoaux; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursoaux (
    id bigint NOT NULL,
    codigo character varying(255),
    nome character varying(255)
);


ALTER TABLE public.cursoaux OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24818)
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
-- TOC entry 204 (class 1259 OID 24823)
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
-- TOC entry 212 (class 1259 OID 24889)
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
-- TOC entry 205 (class 1259 OID 24831)
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
-- TOC entry 206 (class 1259 OID 24839)
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
-- TOC entry 207 (class 1259 OID 24844)
-- Name: professororientador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professororientador (
    idprofessororientador integer NOT NULL,
    nomeprofessororientador character varying(80) NOT NULL
);


ALTER TABLE public.professororientador OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24849)
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
-- TOC entry 209 (class 1259 OID 24857)
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
-- TOC entry 210 (class 1259 OID 24865)
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
-- TOC entry 211 (class 1259 OID 24873)
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
-- TOC entry 2913 (class 0 OID 24777)
-- Dependencies: 196
-- Data for Name: agenteintegracao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.agenteintegracao (idagenteintegracao, cnpjagenteintegracao, nomeagenteintegracao) VALUES (1, '83191530000191', 'Luiz Estágios');
INSERT INTO public.agenteintegracao (idagenteintegracao, cnpjagenteintegracao, nomeagenteintegracao) VALUES (2, '70986481000131', 'Federação do Estágio');


--
-- TOC entry 2914 (class 0 OID 24782)
-- Dependencies: 197
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1111, '1621887BCC', 'Graduação', 5, 111);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1112, '1421847TMC', 'Técnico', 3, 222);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1113, '1781847TST', 'Técnico', 9, 333);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1114, '1194717TCM', 'Técnico', 11, 444);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1115, '1894561TEL', 'Técnico', 1, 555);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1116, '1345175GEM', 'Graduação', 12, 666);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1117, '1891117TEN', 'Técnico', 7, 777);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1118, '1828421GEC', 'Graduação', 6, 888);
INSERT INTO public.aluno (idaluno, matricula, tipoaluno, curso_idcurso, pessoa_idpessoa) VALUES (1119, '1784963TTC', 'Técnico', 2, 999);


--
-- TOC entry 2915 (class 0 OID 24787)
-- Dependencies: 198
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.campus (idcampus, nomecampus) VALUES (1, 'Maracanã');
INSERT INTO public.campus (idcampus, nomecampus) VALUES (2, 'Nova Iguaçu');
INSERT INTO public.campus (idcampus, nomecampus) VALUES (3, 'Maria da Graça');
INSERT INTO public.campus (idcampus, nomecampus) VALUES (4, 'Itaguaí');
INSERT INTO public.campus (idcampus, nomecampus) VALUES (5, 'Petrópolis');


--
-- TOC entry 2916 (class 0 OID 24792)
-- Dependencies: 199
-- Data for Name: conveniado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 24800)
-- Dependencies: 200
-- Data for Name: convenio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.convenio (idconvenio, ano, dataassinatura, numero, numeroconvenio, empresa_idempresa, pessoa_idpessoa) VALUES (2, '2018', '2018-11-03 00:00:00', '1', '1/2018', 1, NULL);
INSERT INTO public.convenio (idconvenio, ano, dataassinatura, numero, numeroconvenio, empresa_idempresa, pessoa_idpessoa) VALUES (4, '2018', '2018-10-31 00:00:00', '2', '2/2018', 3, NULL);
INSERT INTO public.convenio (idconvenio, ano, dataassinatura, numero, numeroconvenio, empresa_idempresa, pessoa_idpessoa) VALUES (6, '2018', '2018-10-26 00:00:00', '3', '3/2018', NULL, 5);


--
-- TOC entry 2918 (class 0 OID 24805)
-- Dependencies: 201
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (1, '150', 'Técnico em Eletrônica', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (2, '478', 'Técnico em Telecomunicações', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (3, '784', 'Técnico em Mecânica', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (4, '975', 'Graduação em Administração', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (5, '781', 'Graduação em Ciência da Computação', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (6, '512', 'Graduação em Engenharia Civil', 1);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (7, '333', 'Técnico em Enfermagem', 2);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (8, '456', 'Graduação em Engenharia de Produção', 2);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (9, '481', 'Técnico em Segurança do Trabalho', 3);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (10, '157', 'Graduação em Sistemas de Informação', 3);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (11, '256', 'Técnico em Telecomunicações', 4);
INSERT INTO public.curso (idcurso, codigocurso, nomecurso, campus_idcampus) VALUES (12, '191', 'Graduação em Engenharia Mecânica', 5);


--
-- TOC entry 2919 (class 0 OID 24810)
-- Dependencies: 202
-- Data for Name: cursoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2920 (class 0 OID 24818)
-- Dependencies: 203
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa (idempresa, agenteintegracao, cnpjempresa, contatoempresa, emailempresa, razaosocial, telefoneempresa) VALUES (1, true, '15975364852999', 'Alexandre Cardeal', 'mudesinstitucional@email.com', 'Fundação MUDES', '2135178124');
INSERT INTO public.empresa (idempresa, agenteintegracao, cnpjempresa, contatoempresa, emailempresa, razaosocial, telefoneempresa) VALUES (3, false, '17845964815647', 'Felipe Souza', 'gerproti@email.com', 'GERPROTI - Projetos de TI', '2254789631');


--
-- TOC entry 2921 (class 0 OID 24823)
-- Dependencies: 204
-- Data for Name: estudante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2922 (class 0 OID 24831)
-- Dependencies: 205
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2923 (class 0 OID 24839)
-- Dependencies: 206
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (5, '78456912345', 'monaguedes@email.com', 'Monalisa Silveira Guedes', '21978456912');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (111, '37453598796', 'matheussilva@email.com', 'Matheus Silva', '21941132190');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (333, '71915831776', 'fegodoy@email.com', 'Fernando Godoy', '21723529371');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (444, '12992637718', 'rafsandrews@email.com', 'Rafaela Andrews', '21614737047');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (999, '93540946780', 'diogoalvespe@email.com', 'Diogo Alves', '21289111496');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (555, '17671695742', 'lukscarvalho@email.com', 'Lucas Carvalho', '21344706643');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (666, '49632091795', 'juhgratz@email.com', 'Júlia Gratz', '21300783588');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (777, '63718523701', 'danipedrza@email.com', 'Daniel Pedroza', '21801822062');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (888, '44700928786', 'pcid@email.com', 'Pedro Cid', '21702770039');
INSERT INTO public.pessoa (idpessoa, cpf, email, nome, telefone) VALUES (222, '68357211704', 'yasminacard@email.com', 'Yasmin Cardoso', '21199212857');


--
-- TOC entry 2924 (class 0 OID 24844)
-- Dependencies: 207
-- Data for Name: professororientador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (1, 'Diogo Mendonça');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (2, 'Gustavo Guedes');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (3, 'Kele Belloze');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (4, 'Carmen Queiroz');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (5, 'Renato Mauro');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (6, 'Pedro Gonzales');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (7, 'Glauco Amorim');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (8, 'Myrna Amorim');
INSERT INTO public.professororientador (idprofessororientador, nomeprofessororientador) VALUES (9, 'Marcos Pinho');


--
-- TOC entry 2925 (class 0 OID 24849)
-- Dependencies: 208
-- Data for Name: termoaditivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoaditivo (idtermoaditivo, bairroenderecotermoaditivo, cargahorariatermoaditivo, cargosupervisor, cependerecotermoaditivo, cidadeenderecotermoaditivo, complementoenderecotermoaditivo, datacadastramentotermoaditivo, datafimtermoaditivo, enderecotermoaditivo, eobrigatorio, estadoenderecotermoaditivo, nomesupervisor, numeroenderecotermoaditivo, tipoaditivo, valorbolsatermoaditivo, professororientador_idprofessororientador, termoestagio_idtermoestagio) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-03 22:49:56.125', '2019-06-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 'Vigência', NULL, NULL, 7);
INSERT INTO public.termoaditivo (idtermoaditivo, bairroenderecotermoaditivo, cargahorariatermoaditivo, cargosupervisor, cependerecotermoaditivo, cidadeenderecotermoaditivo, complementoenderecotermoaditivo, datacadastramentotermoaditivo, datafimtermoaditivo, enderecotermoaditivo, eobrigatorio, estadoenderecotermoaditivo, nomesupervisor, numeroenderecotermoaditivo, tipoaditivo, valorbolsatermoaditivo, professororientador_idprofessororientador, termoestagio_idtermoestagio) VALUES (9, NULL, 4, NULL, NULL, NULL, NULL, '2018-11-03 22:53:56.435', NULL, NULL, NULL, NULL, NULL, NULL, 'Carga Horária', NULL, NULL, 7);
INSERT INTO public.termoaditivo (idtermoaditivo, bairroenderecotermoaditivo, cargahorariatermoaditivo, cargosupervisor, cependerecotermoaditivo, cidadeenderecotermoaditivo, complementoenderecotermoaditivo, datacadastramentotermoaditivo, datafimtermoaditivo, enderecotermoaditivo, eobrigatorio, estadoenderecotermoaditivo, nomesupervisor, numeroenderecotermoaditivo, tipoaditivo, valorbolsatermoaditivo, professororientador_idprofessororientador, termoestagio_idtermoestagio) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-03 22:53:56.435', NULL, NULL, NULL, NULL, NULL, NULL, 'Professor Orientador', NULL, NULL, 7);
INSERT INTO public.termoaditivo (idtermoaditivo, bairroenderecotermoaditivo, cargahorariatermoaditivo, cargosupervisor, cependerecotermoaditivo, cidadeenderecotermoaditivo, complementoenderecotermoaditivo, datacadastramentotermoaditivo, datafimtermoaditivo, enderecotermoaditivo, eobrigatorio, estadoenderecotermoaditivo, nomesupervisor, numeroenderecotermoaditivo, tipoaditivo, valorbolsatermoaditivo, professororientador_idprofessororientador, termoestagio_idtermoestagio) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-03 22:53:56.435', NULL, NULL, NULL, NULL, NULL, NULL, 'Valor da Bolsa', 840, NULL, 7);
INSERT INTO public.termoaditivo (idtermoaditivo, bairroenderecotermoaditivo, cargahorariatermoaditivo, cargosupervisor, cependerecotermoaditivo, cidadeenderecotermoaditivo, complementoenderecotermoaditivo, datacadastramentotermoaditivo, datafimtermoaditivo, enderecotermoaditivo, eobrigatorio, estadoenderecotermoaditivo, nomesupervisor, numeroenderecotermoaditivo, tipoaditivo, valorbolsatermoaditivo, professororientador_idprofessororientador, termoestagio_idtermoestagio) VALUES (12, 'São Cristóvão', NULL, NULL, '99.512-364', 'Rio de Janeiro', 'Sala 5', '2018-11-03 22:53:56.435', NULL, 'CEFET RJ, Pavilhão de Informática', NULL, 'RJ', NULL, '6', 'Local Estágio', NULL, NULL, 7);


--
-- TOC entry 2926 (class 0 OID 24857)
-- Dependencies: 209
-- Data for Name: termoaditivoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2927 (class 0 OID 24865)
-- Dependencies: 210
-- Data for Name: termoest; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2928 (class 0 OID 24873)
-- Dependencies: 211
-- Data for Name: termoestagio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoestagio (idtermoestagio, bairroenderecotermoestagio, cargahorariatermoestagio, cargosupervisor, cependerecotermoestagio, cidadeenderecotermoestagio, complementoenderecotermoestagio, datafimtermoestagio, datainiciotermoestagio, datarescisaotermoestagio, eestagioobrigatorio, enderecotermoestagio, estado, estadoenderecotermoestagio, nomeagenciada, nomesupervisor, numeroenderecotermoestagio, valorbolsa, aluno_idaluno, convenio_idconvenio, professororientador_idprofessororientador) VALUES (7, 'São Cristóvão', 6, 'Gerente de Projeto', '99.512-364', 'Rio de Janeiro', 'Sala 5', '2019-10-01 00:00:00', '2018-10-01 00:00:00', NULL, false, 'CEFET RJ, Pavilhão de Informática', 'ativo', 'RJ', '', 'Carlos Vieira', '6', 720, 1111, 4, 1);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 212
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 13, true);


--
-- TOC entry 2739 (class 2606 OID 24781)
-- Name: agenteintegracao agenteintegracao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT agenteintegracao_pkey PRIMARY KEY (idagenteintegracao);


--
-- TOC entry 2743 (class 2606 OID 24786)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (idaluno);


--
-- TOC entry 2747 (class 2606 OID 24791)
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (idcampus);


--
-- TOC entry 2751 (class 2606 OID 24799)
-- Name: conveniado conveniado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conveniado
    ADD CONSTRAINT conveniado_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24804)
-- Name: convenio convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (idconvenio);


--
-- TOC entry 2755 (class 2606 OID 24809)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (idcurso);


--
-- TOC entry 2757 (class 2606 OID 24817)
-- Name: cursoaux cursoaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursoaux
    ADD CONSTRAINT cursoaux_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 24822)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- TOC entry 2763 (class 2606 OID 24830)
-- Name: estudante estudante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT estudante_pkey PRIMARY KEY (idaluno);


--
-- TOC entry 2765 (class 2606 OID 24838)
-- Name: matricula matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 24843)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (idpessoa);


--
-- TOC entry 2769 (class 2606 OID 24848)
-- Name: professororientador professororientador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professororientador
    ADD CONSTRAINT professororientador_pkey PRIMARY KEY (idprofessororientador);


--
-- TOC entry 2771 (class 2606 OID 24856)
-- Name: termoaditivo termoaditivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT termoaditivo_pkey PRIMARY KEY (idtermoaditivo);


--
-- TOC entry 2773 (class 2606 OID 24864)
-- Name: termoaditivoaux termoaditivoaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT termoaditivoaux_pkey PRIMARY KEY (idtermoaditivo);


--
-- TOC entry 2775 (class 2606 OID 24872)
-- Name: termoest termoest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT termoest_pkey PRIMARY KEY (idtermoestagio);


--
-- TOC entry 2777 (class 2606 OID 24880)
-- Name: termoestagio termoestagio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT termoestagio_pkey PRIMARY KEY (idtermoestagio);


--
-- TOC entry 2745 (class 2606 OID 24884)
-- Name: aluno uk_2yc6wv6b5w2aph89au30mw6gj; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT uk_2yc6wv6b5w2aph89au30mw6gj UNIQUE (matricula);


--
-- TOC entry 2741 (class 2606 OID 24882)
-- Name: agenteintegracao uk_6igom1spncnhloepe2aack7gt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT uk_6igom1spncnhloepe2aack7gt UNIQUE (cnpjagenteintegracao);


--
-- TOC entry 2761 (class 2606 OID 24888)
-- Name: empresa uk_c64e255k43j4vyakw4sk4eqgi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_c64e255k43j4vyakw4sk4eqgi UNIQUE (cnpjempresa);


--
-- TOC entry 2749 (class 2606 OID 24886)
-- Name: campus uk_fdiodxq54qv5lkp07skvt8x7n; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT uk_fdiodxq54qv5lkp07skvt8x7n UNIQUE (nomecampus);


--
-- TOC entry 2785 (class 2606 OID 24926)
-- Name: termoaditivo fk2ei3f44ll190epmmkphihb08d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fk2ei3f44ll190epmmkphihb08d FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoestagio(idtermoestagio);


--
-- TOC entry 2790 (class 2606 OID 24951)
-- Name: termoestagio fka6ymejgdnnxcsx0077xplw6v9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fka6ymejgdnnxcsx0077xplw6v9 FOREIGN KEY (convenio_idconvenio) REFERENCES public.convenio(idconvenio);


--
-- TOC entry 2779 (class 2606 OID 24896)
-- Name: aluno fkamcoe2657asi0hc60nhmsoskh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fkamcoe2657asi0hc60nhmsoskh FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);


--
-- TOC entry 2787 (class 2606 OID 24936)
-- Name: termoest fkbijaud1t0c104g2qaxb044aw1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkbijaud1t0c104g2qaxb044aw1 FOREIGN KEY (aluno_idaluno) REFERENCES public.estudante(idaluno);


--
-- TOC entry 2786 (class 2606 OID 24931)
-- Name: termoaditivoaux fkep3nq6yrwy50xt0jfeymf3a5x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT fkep3nq6yrwy50xt0jfeymf3a5x FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoest(idtermoestagio);


--
-- TOC entry 2788 (class 2606 OID 24941)
-- Name: termoest fkjelry0l68fg5ksw74idaod3iv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkjelry0l68fg5ksw74idaod3iv FOREIGN KEY (c_id) REFERENCES public.conveniado(id);


--
-- TOC entry 2791 (class 2606 OID 24956)
-- Name: termoestagio fkjnf5ifmew6yube38nb5sy9tos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkjnf5ifmew6yube38nb5sy9tos FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);


--
-- TOC entry 2780 (class 2606 OID 24901)
-- Name: convenio fkllshachtu0eb3riu9kqeipr7m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkllshachtu0eb3riu9kqeipr7m FOREIGN KEY (empresa_idempresa) REFERENCES public.empresa(idempresa);


--
-- TOC entry 2789 (class 2606 OID 24946)
-- Name: termoestagio fkmoa2nhlvaxvxcfq41wj39ha08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkmoa2nhlvaxvxcfq41wj39ha08 FOREIGN KEY (aluno_idaluno) REFERENCES public.aluno(idaluno);


--
-- TOC entry 2783 (class 2606 OID 24916)
-- Name: estudante fkniuw7njxma8lm7xv2y3gqjjl3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT fkniuw7njxma8lm7xv2y3gqjjl3 FOREIGN KEY (cursoaux_id) REFERENCES public.cursoaux(id);


--
-- TOC entry 2782 (class 2606 OID 24911)
-- Name: curso fkphssmesk3qnf24haly37grjlb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkphssmesk3qnf24haly37grjlb FOREIGN KEY (campus_idcampus) REFERENCES public.campus(idcampus);


--
-- TOC entry 2781 (class 2606 OID 24906)
-- Name: convenio fkr4vu5p0r10bdc6pw8tjh8hvc6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkr4vu5p0r10bdc6pw8tjh8hvc6 FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);


--
-- TOC entry 2784 (class 2606 OID 24921)
-- Name: termoaditivo fks9ar4lhdelgfprino2pe67fd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fks9ar4lhdelgfprino2pe67fd5 FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);


--
-- TOC entry 2778 (class 2606 OID 24891)
-- Name: aluno fksl780qshiu1ok02cfow0pw2i9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fksl780qshiu1ok02cfow0pw2i9 FOREIGN KEY (curso_idcurso) REFERENCES public.curso(idcurso);


-- Completed on 2018-11-04 03:50:07

--
-- PostgreSQL database dump complete
--

