--
-- TOC entry 2920 (class 0 OID 16435)
-- Dependencies: 203
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa VALUES (1, true, '55555555555555', 'aaaaaaa', 'empresaA@hotmail.com', 'Marcos', '21988888888');
INSERT INTO public.empresa VALUES (3, true, '77777777777777', 'contatob', 'empresaB@hotmail.com', 'razaoB', '21977777777');
INSERT INTO public.empresa VALUES (6, true, '99999999999999', 'CCC', 'empresaC@hotmail.com', 'razaoC', '2195555555');


--
-- TOC entry 2923 (class 0 OID 16456)
-- Dependencies: 206
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pessoa VALUES (1, '14937262777', 'nanu.godoy@hotmail.com', 'Fernando Godoy', '21979230104');
INSERT INTO public.pessoa VALUES (2, '22222222222', 'asd@hotmail.com', 'AAA BBB', '21999999999');



--
-- TOC entry 2915 (class 0 OID 16404)
-- Dependencies: 198
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.campus VALUES (1, 'maracanã');




--
-- TOC entry 2918 (class 0 OID 16422)
-- Dependencies: 201
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso VALUES (1, '123', 'ciencias da computação', 1);


--
-- TOC entry 2914 (class 0 OID 16399)
-- Dependencies: 197
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno VALUES (1, '1622159BCC', 'graduação', 1, 1);
INSERT INTO public.aluno VALUES (2, '5555555AAA', 'graduação', 1, 2);

--
-- TOC entry 2916 (class 0 OID 16409)
-- Dependencies: 199
-- Data for Name: conveniado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 16417)
-- Dependencies: 200
-- Data for Name: convenio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.convenio VALUES (1, '2018', '2018-10-28 20:42:06.982135', '123', '2134', 1, 2);
INSERT INTO public.convenio VALUES (7, '2018', '2018-10-01 00:00:00', '2', '2/2018', 6, NULL);

--
-- TOC entry 2919 (class 0 OID 16427)
-- Dependencies: 202
-- Data for Name: cursoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2924 (class 0 OID 16461)
-- Dependencies: 207
-- Data for Name: professororientador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professororientador VALUES (1, 'Jorge');


--
-- TOC entry 2925 (class 0 OID 16466)
-- Dependencies: 208
-- Data for Name: termoaditivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2926 (class 0 OID 16474)
-- Dependencies: 209
-- Data for Name: termoaditivoaux; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2927 (class 0 OID 16482)
-- Dependencies: 210
-- Data for Name: termoest; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2928 (class 0 OID 16490)
-- Dependencies: 211
-- Data for Name: termoestagio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.termoestagio VALUES (1, 'Ilha do Governador', 4, 'gerente', '21.911-550', 'Rio de Janeiro', 'casa 4', '2018-10-01 00:00:00', '2017-11-01 00:00:00', NULL, true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1580, 1, 1, 1);
INSERT INTO public.termoestagio VALUES (2, 'Ilha do Governador', 4, 'Alberto', '21.911-550', 'Rio de Janeiro', 'casa 4', '2019-10-25 00:00:00', '2018-10-04 00:00:00', '2018-10-10 00:00:00', true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1586, 2, 1, 1);
INSERT INTO public.termoestagio VALUES (8, 'Ilha do Governador', 4, 'gerente', '21.911-550', 'Rio de Janeiro', 'casa 4', '2019-04-04 00:00:00', '2018-10-29 00:00:00', NULL, true, 'Rua tremembé', 'ativo', 'RJ', 'aaa', 'Carlos', '402', 1234.56006, 2, 1, 1);
