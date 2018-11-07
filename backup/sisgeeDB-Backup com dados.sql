
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
-- TOC entry 2920 (class 0 OID 24818)
-- Dependencies: 203
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa (idempresa, agenteintegracao, cnpjempresa, contatoempresa, emailempresa, razaosocial, telefoneempresa) VALUES (1, true, '15975364852999', 'Alexandre Cardeal', 'mudesinstitucional@email.com', 'Fundação MUDES', '2135178124');
INSERT INTO public.empresa (idempresa, agenteintegracao, cnpjempresa, contatoempresa, emailempresa, razaosocial, telefoneempresa) VALUES (3, false, '17845964815647', 'Felipe Souza', 'gerproti@email.com', 'GERPROTI - Projetos de TI', '2254789631');


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
-- TOC entry 2919 (class 0 OID 24810)
-- Dependencies: 202
-- Data for Name: cursoaux; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- TOC entry 2928 (class 0 OID 24873)
-- Dependencies: 211
-- Data for Name: termoestagio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoestagio (idtermoestagio, bairroenderecotermoestagio, cargahorariatermoestagio, cargosupervisor, cependerecotermoestagio, cidadeenderecotermoestagio, complementoenderecotermoestagio, datafimtermoestagio, datainiciotermoestagio, datarescisaotermoestagio, eestagioobrigatorio, enderecotermoestagio, estado, estadoenderecotermoestagio, nomeagenciada, nomesupervisor, numeroenderecotermoestagio, valorbolsa, aluno_idaluno, convenio_idconvenio, professororientador_idprofessororientador) VALUES (7, 'São Cristóvão', 6, 'Gerente de Projeto', '99.512-364', 'Rio de Janeiro', 'Sala 5', '2019-10-01 00:00:00', '2018-10-01 00:00:00', NULL, false, 'CEFET RJ, Pavilhão de Informática', 'ativo', 'RJ', '', 'Carlos Vieira', '6', 720, 1111, 4, 1);




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




