PGDMP     ,                	    v            sisgeeDB    10.4    10.4 L    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            w           1262    32777    sisgeeDB    DATABASE     �   CREATE DATABASE "sisgeeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "sisgeeDB";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            x           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            y           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    32778    agenteintegracao    TABLE     �   CREATE TABLE public.agenteintegracao (
    idagenteintegracao integer NOT NULL,
    cnpjagenteintegracao character varying(14) NOT NULL,
    nomeagenteintegracao character varying(100) NOT NULL
);
 $   DROP TABLE public.agenteintegracao;
       public         postgres    false    3            �            1259    32783    aluno    TABLE     �   CREATE TABLE public.aluno (
    idaluno integer NOT NULL,
    matricula character varying(100) NOT NULL,
    tipoaluno character varying(50),
    curso_idcurso integer,
    pessoa_idpessoa bigint
);
    DROP TABLE public.aluno;
       public         postgres    false    3            �            1259    32788    campus    TABLE     n   CREATE TABLE public.campus (
    idcampus integer NOT NULL,
    nomecampus character varying(100) NOT NULL
);
    DROP TABLE public.campus;
       public         postgres    false    3            �            1259    32793 
   conveniado    TABLE     �  CREATE TABLE public.conveniado (
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
    DROP TABLE public.conveniado;
       public         postgres    false    3            �            1259    32801    convenio    TABLE     :  CREATE TABLE public.convenio (
    idconvenio integer NOT NULL,
    ano character varying(4) NOT NULL,
    dataassinatura timestamp without time zone NOT NULL,
    numero character varying(6) NOT NULL,
    numeroconvenio character varying(10) NOT NULL,
    empresa_idempresa integer,
    pessoa_idpessoa bigint
);
    DROP TABLE public.convenio;
       public         postgres    false    3            �            1259    32806    curso    TABLE     �   CREATE TABLE public.curso (
    idcurso integer NOT NULL,
    codigocurso character varying(50) NOT NULL,
    nomecurso character varying(255) NOT NULL,
    campus_idcampus integer
);
    DROP TABLE public.curso;
       public         postgres    false    3            �            1259    32811    cursoaux    TABLE     }   CREATE TABLE public.cursoaux (
    id bigint NOT NULL,
    codigo character varying(255),
    nome character varying(255)
);
    DROP TABLE public.cursoaux;
       public         postgres    false    3            �            1259    32819    empresa    TABLE     3  CREATE TABLE public.empresa (
    idempresa integer NOT NULL,
    agenteintegracao boolean,
    cnpjempresa character varying(14) NOT NULL,
    contatoempresa character varying(50),
    emailempresa character varying(50),
    razaosocial character varying(100),
    telefoneempresa character varying(11)
);
    DROP TABLE public.empresa;
       public         postgres    false    3            �            1259    32824 	   estudante    TABLE     1  CREATE TABLE public.estudante (
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
    DROP TABLE public.estudante;
       public         postgres    false    3            �            1259    32890    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false    3            �            1259    32832 	   matricula    TABLE     �  CREATE TABLE public.matricula (
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
    DROP TABLE public.matricula;
       public         postgres    false    3            �            1259    32840    pessoa    TABLE     �   CREATE TABLE public.pessoa (
    idpessoa bigint NOT NULL,
    cpf character varying(11) NOT NULL,
    email character varying(50),
    nome character varying(100) NOT NULL,
    telefone character varying(11)
);
    DROP TABLE public.pessoa;
       public         postgres    false    3            �            1259    32845    professororientador    TABLE     �   CREATE TABLE public.professororientador (
    idprofessororientador integer NOT NULL,
    nomeprofessororientador character varying(80) NOT NULL
);
 '   DROP TABLE public.professororientador;
       public         postgres    false    3            �            1259    32850    termoaditivo    TABLE     �  CREATE TABLE public.termoaditivo (
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
     DROP TABLE public.termoaditivo;
       public         postgres    false    3            �            1259    32858    termoaditivoaux    TABLE     Z  CREATE TABLE public.termoaditivoaux (
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
 #   DROP TABLE public.termoaditivoaux;
       public         postgres    false    3            �            1259    32866    termoest    TABLE     r  CREATE TABLE public.termoest (
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
    DROP TABLE public.termoest;
       public         postgres    false    3            �            1259    32874    termoestagio    TABLE     P  CREATE TABLE public.termoestagio (
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
     DROP TABLE public.termoestagio;
       public         postgres    false    3            a          0    32778    agenteintegracao 
   TABLE DATA                     public       postgres    false    196   �e       b          0    32783    aluno 
   TABLE DATA                     public       postgres    false    197   �e       c          0    32788    campus 
   TABLE DATA                     public       postgres    false    198   ef       d          0    32793 
   conveniado 
   TABLE DATA                     public       postgres    false    199   �f       e          0    32801    convenio 
   TABLE DATA                     public       postgres    false    200   �f       f          0    32806    curso 
   TABLE DATA                     public       postgres    false    201   rg       g          0    32811    cursoaux 
   TABLE DATA                     public       postgres    false    202   �g       h          0    32819    empresa 
   TABLE DATA                     public       postgres    false    203   �g       i          0    32824 	   estudante 
   TABLE DATA                     public       postgres    false    204   �h       j          0    32832 	   matricula 
   TABLE DATA                     public       postgres    false    205   �h       k          0    32840    pessoa 
   TABLE DATA                     public       postgres    false    206   �h       l          0    32845    professororientador 
   TABLE DATA                     public       postgres    false    207   �i       m          0    32850    termoaditivo 
   TABLE DATA                     public       postgres    false    208   �i       n          0    32858    termoaditivoaux 
   TABLE DATA                     public       postgres    false    209   j       o          0    32866    termoest 
   TABLE DATA                     public       postgres    false    210   2j       p          0    32874    termoestagio 
   TABLE DATA                     public       postgres    false    211   Lj       z           0    0    hibernate_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hibernate_sequence', 4, true);
            public       postgres    false    212            �
           2606    32782 &   agenteintegracao agenteintegracao_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT agenteintegracao_pkey PRIMARY KEY (idagenteintegracao);
 P   ALTER TABLE ONLY public.agenteintegracao DROP CONSTRAINT agenteintegracao_pkey;
       public         postgres    false    196            �
           2606    32787    aluno aluno_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (idaluno);
 :   ALTER TABLE ONLY public.aluno DROP CONSTRAINT aluno_pkey;
       public         postgres    false    197            �
           2606    32792    campus campus_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (idcampus);
 <   ALTER TABLE ONLY public.campus DROP CONSTRAINT campus_pkey;
       public         postgres    false    198            �
           2606    32800    conveniado conveniado_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.conveniado
    ADD CONSTRAINT conveniado_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.conveniado DROP CONSTRAINT conveniado_pkey;
       public         postgres    false    199            �
           2606    32805    convenio convenio_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (idconvenio);
 @   ALTER TABLE ONLY public.convenio DROP CONSTRAINT convenio_pkey;
       public         postgres    false    200            �
           2606    32810    curso curso_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (idcurso);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public         postgres    false    201            �
           2606    32818    cursoaux cursoaux_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cursoaux
    ADD CONSTRAINT cursoaux_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.cursoaux DROP CONSTRAINT cursoaux_pkey;
       public         postgres    false    202            �
           2606    32823    empresa empresa_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public         postgres    false    203            �
           2606    32831    estudante estudante_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT estudante_pkey PRIMARY KEY (idaluno);
 B   ALTER TABLE ONLY public.estudante DROP CONSTRAINT estudante_pkey;
       public         postgres    false    204            �
           2606    32839    matricula matricula_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.matricula DROP CONSTRAINT matricula_pkey;
       public         postgres    false    205            �
           2606    32844    pessoa pessoa_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (idpessoa);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public         postgres    false    206            �
           2606    32849 ,   professororientador professororientador_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.professororientador
    ADD CONSTRAINT professororientador_pkey PRIMARY KEY (idprofessororientador);
 V   ALTER TABLE ONLY public.professororientador DROP CONSTRAINT professororientador_pkey;
       public         postgres    false    207            �
           2606    32857    termoaditivo termoaditivo_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT termoaditivo_pkey PRIMARY KEY (idtermoaditivo);
 H   ALTER TABLE ONLY public.termoaditivo DROP CONSTRAINT termoaditivo_pkey;
       public         postgres    false    208            �
           2606    32865 $   termoaditivoaux termoaditivoaux_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT termoaditivoaux_pkey PRIMARY KEY (idtermoaditivo);
 N   ALTER TABLE ONLY public.termoaditivoaux DROP CONSTRAINT termoaditivoaux_pkey;
       public         postgres    false    209            �
           2606    32873    termoest termoest_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT termoest_pkey PRIMARY KEY (idtermoestagio);
 @   ALTER TABLE ONLY public.termoest DROP CONSTRAINT termoest_pkey;
       public         postgres    false    210            �
           2606    32881    termoestagio termoestagio_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT termoestagio_pkey PRIMARY KEY (idtermoestagio);
 H   ALTER TABLE ONLY public.termoestagio DROP CONSTRAINT termoestagio_pkey;
       public         postgres    false    211            �
           2606    32885 "   aluno uk_2yc6wv6b5w2aph89au30mw6gj 
   CONSTRAINT     b   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT uk_2yc6wv6b5w2aph89au30mw6gj UNIQUE (matricula);
 L   ALTER TABLE ONLY public.aluno DROP CONSTRAINT uk_2yc6wv6b5w2aph89au30mw6gj;
       public         postgres    false    197            �
           2606    32883 -   agenteintegracao uk_6igom1spncnhloepe2aack7gt 
   CONSTRAINT     x   ALTER TABLE ONLY public.agenteintegracao
    ADD CONSTRAINT uk_6igom1spncnhloepe2aack7gt UNIQUE (cnpjagenteintegracao);
 W   ALTER TABLE ONLY public.agenteintegracao DROP CONSTRAINT uk_6igom1spncnhloepe2aack7gt;
       public         postgres    false    196            �
           2606    32889 $   empresa uk_c64e255k43j4vyakw4sk4eqgi 
   CONSTRAINT     f   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_c64e255k43j4vyakw4sk4eqgi UNIQUE (cnpjempresa);
 N   ALTER TABLE ONLY public.empresa DROP CONSTRAINT uk_c64e255k43j4vyakw4sk4eqgi;
       public         postgres    false    203            �
           2606    32887 #   campus uk_fdiodxq54qv5lkp07skvt8x7n 
   CONSTRAINT     d   ALTER TABLE ONLY public.campus
    ADD CONSTRAINT uk_fdiodxq54qv5lkp07skvt8x7n UNIQUE (nomecampus);
 M   ALTER TABLE ONLY public.campus DROP CONSTRAINT uk_fdiodxq54qv5lkp07skvt8x7n;
       public         postgres    false    198            �
           2606    32927 (   termoaditivo fk2ei3f44ll190epmmkphihb08d    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fk2ei3f44ll190epmmkphihb08d FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoestagio(idtermoestagio);
 R   ALTER TABLE ONLY public.termoaditivo DROP CONSTRAINT fk2ei3f44ll190epmmkphihb08d;
       public       postgres    false    2777    211    208            �
           2606    32952 (   termoestagio fka6ymejgdnnxcsx0077xplw6v9    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fka6ymejgdnnxcsx0077xplw6v9 FOREIGN KEY (convenio_idconvenio) REFERENCES public.convenio(idconvenio);
 R   ALTER TABLE ONLY public.termoestagio DROP CONSTRAINT fka6ymejgdnnxcsx0077xplw6v9;
       public       postgres    false    2753    200    211            �
           2606    32897 !   aluno fkamcoe2657asi0hc60nhmsoskh    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fkamcoe2657asi0hc60nhmsoskh FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);
 K   ALTER TABLE ONLY public.aluno DROP CONSTRAINT fkamcoe2657asi0hc60nhmsoskh;
       public       postgres    false    197    206    2767            �
           2606    32937 $   termoest fkbijaud1t0c104g2qaxb044aw1    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkbijaud1t0c104g2qaxb044aw1 FOREIGN KEY (aluno_idaluno) REFERENCES public.estudante(idaluno);
 N   ALTER TABLE ONLY public.termoest DROP CONSTRAINT fkbijaud1t0c104g2qaxb044aw1;
       public       postgres    false    2763    204    210            �
           2606    32932 +   termoaditivoaux fkep3nq6yrwy50xt0jfeymf3a5x    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoaditivoaux
    ADD CONSTRAINT fkep3nq6yrwy50xt0jfeymf3a5x FOREIGN KEY (termoestagio_idtermoestagio) REFERENCES public.termoest(idtermoestagio);
 U   ALTER TABLE ONLY public.termoaditivoaux DROP CONSTRAINT fkep3nq6yrwy50xt0jfeymf3a5x;
       public       postgres    false    2775    210    209            �
           2606    32942 $   termoest fkjelry0l68fg5ksw74idaod3iv    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoest
    ADD CONSTRAINT fkjelry0l68fg5ksw74idaod3iv FOREIGN KEY (c_id) REFERENCES public.conveniado(id);
 N   ALTER TABLE ONLY public.termoest DROP CONSTRAINT fkjelry0l68fg5ksw74idaod3iv;
       public       postgres    false    2751    199    210            �
           2606    32957 (   termoestagio fkjnf5ifmew6yube38nb5sy9tos    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkjnf5ifmew6yube38nb5sy9tos FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);
 R   ALTER TABLE ONLY public.termoestagio DROP CONSTRAINT fkjnf5ifmew6yube38nb5sy9tos;
       public       postgres    false    2769    207    211            �
           2606    32902 $   convenio fkllshachtu0eb3riu9kqeipr7m    FK CONSTRAINT     �   ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkllshachtu0eb3riu9kqeipr7m FOREIGN KEY (empresa_idempresa) REFERENCES public.empresa(idempresa);
 N   ALTER TABLE ONLY public.convenio DROP CONSTRAINT fkllshachtu0eb3riu9kqeipr7m;
       public       postgres    false    2759    200    203            �
           2606    32947 (   termoestagio fkmoa2nhlvaxvxcfq41wj39ha08    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoestagio
    ADD CONSTRAINT fkmoa2nhlvaxvxcfq41wj39ha08 FOREIGN KEY (aluno_idaluno) REFERENCES public.aluno(idaluno);
 R   ALTER TABLE ONLY public.termoestagio DROP CONSTRAINT fkmoa2nhlvaxvxcfq41wj39ha08;
       public       postgres    false    2743    197    211            �
           2606    32917 %   estudante fkniuw7njxma8lm7xv2y3gqjjl3    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudante
    ADD CONSTRAINT fkniuw7njxma8lm7xv2y3gqjjl3 FOREIGN KEY (cursoaux_id) REFERENCES public.cursoaux(id);
 O   ALTER TABLE ONLY public.estudante DROP CONSTRAINT fkniuw7njxma8lm7xv2y3gqjjl3;
       public       postgres    false    2757    202    204            �
           2606    32912 !   curso fkphssmesk3qnf24haly37grjlb    FK CONSTRAINT     �   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fkphssmesk3qnf24haly37grjlb FOREIGN KEY (campus_idcampus) REFERENCES public.campus(idcampus);
 K   ALTER TABLE ONLY public.curso DROP CONSTRAINT fkphssmesk3qnf24haly37grjlb;
       public       postgres    false    201    2747    198            �
           2606    32907 $   convenio fkr4vu5p0r10bdc6pw8tjh8hvc6    FK CONSTRAINT     �   ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fkr4vu5p0r10bdc6pw8tjh8hvc6 FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa);
 N   ALTER TABLE ONLY public.convenio DROP CONSTRAINT fkr4vu5p0r10bdc6pw8tjh8hvc6;
       public       postgres    false    2767    206    200            �
           2606    32922 (   termoaditivo fks9ar4lhdelgfprino2pe67fd5    FK CONSTRAINT     �   ALTER TABLE ONLY public.termoaditivo
    ADD CONSTRAINT fks9ar4lhdelgfprino2pe67fd5 FOREIGN KEY (professororientador_idprofessororientador) REFERENCES public.professororientador(idprofessororientador);
 R   ALTER TABLE ONLY public.termoaditivo DROP CONSTRAINT fks9ar4lhdelgfprino2pe67fd5;
       public       postgres    false    208    2769    207            �
           2606    32892 !   aluno fksl780qshiu1ok02cfow0pw2i9    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT fksl780qshiu1ok02cfow0pw2i9 FOREIGN KEY (curso_idcurso) REFERENCES public.curso(idcurso);
 K   ALTER TABLE ONLY public.aluno DROP CONSTRAINT fksl780qshiu1ok02cfow0pw2i9;
       public       postgres    false    201    2755    197            a   
   x���          b   `   x���v
Q���W((M��L�K�)��Ws�	uV�0�QP743224�trvV�ҋSJ/?�8��jZsy2�����c4�� [�*%      c   =   x���v
Q���W((M��L�KN�-(-Vs�	uV�0�QP�M,JLN�;�X]Ӛ�� ��D      d   
   x���          e   �   x���v
Q���W((M��L�K��+K���Ws�	uV�0�QP720�P�Һ��Ɔ
V`�PU~�>>:
ƚ�\�DoD�xC0�j�!��b1��B��������L������l��1X���	��3"�
s,V� 3�'��sq �Z4      f   S   x���v
Q���W((M��L�K.-*�Ws�	uV�0�QP742VRə�yə��
)�
����%���^��3Դ��� �R�      g   
   x���          h   �   x���v
Q���W((M��L�K�-(J-NTs�	uV�0�Q()*M�QP7E�@�D 1��2�Kr3s���sA⾉E��� �����kZsy��n�9
 ����W�X���d���E�U��NP�ᚉ��n�%
 ����d�3Vk����Bh+ �g�      i   
   x���          j   
   x���          k   �   x����
�@��>��,�uڨ`!�AZ�I�uD��훉$�@��ý�=A��a| M)��h�����ɏ����(�в�ۺ[~�Yɝ��Ei$����i�=:eaĨ����h�$��%��E�)AS�c�<z2�e��L�5�{#�x:7q��Y+�T��J�R��9���W���_����?�4���t�      l   F   x���v
Q���W((M��L�+(�OK-.�/�/�L�+IL�/Rs�	uV�0�QP��/JOU״��� ���      m   
   x���          n   
   x���          o   
   x���          p     x��R�J�0}�Wܷ*��&��է!C:J�n�=]/��6���'��3�|p�ġ�%�����9ܬX-�5d���Ǫm��!�)��5
��f�����Oj�jO����~ �^�HSo�"��(e,�ct��
5�R��h嘭$��%�$d"ě�����*��&�0z$�:J;RG]����H��'�r9A)]���U��r�X��=uy�e?�ο�>o+�F�m=u�y���!�%��#��,f�H�cR���i����+�3ģ <�I��f     