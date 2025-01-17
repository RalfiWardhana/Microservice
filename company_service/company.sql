PGDMP                         z            company    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    16436    company    DATABASE     j   CREATE DATABASE company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE company;
                postgres    false            �            1259    16437    company    TABLE     �  CREATE TABLE public.company (
    id integer NOT NULL,
    nama character varying(200) NOT NULL,
    city character varying(200) NOT NULL,
    organization_size character varying(200) NOT NULL,
    industri_type character varying(200),
    logo character varying(200) NOT NULL,
    user_access integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) without time zone
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    16445    company_id_seq    SEQUENCE     w   CREATE SEQUENCE public.company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.company_id_seq;
       public          postgres    false    209                       0    0    company_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;
          public          postgres    false    210            �            1259    16448    jobs    TABLE     �  CREATE TABLE public.jobs (
    id integer NOT NULL,
    job_title character varying(200) NOT NULL,
    company_id integer NOT NULL,
    location character varying NOT NULL,
    workspace_type character varying(200) NOT NULL,
    min_salary character varying(200) NOT NULL,
    max_salary character varying(200) NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) without time zone
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    16456 
   job_id_seq    SEQUENCE     s   CREATE SEQUENCE public.job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.job_id_seq;
       public          postgres    false    211                       0    0 
   job_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE public.job_id_seq OWNED BY public.jobs.id;
          public          postgres    false    212            �            1259    16458 	   user_jobs    TABLE       CREATE TABLE public.user_jobs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    resume_id integer NOT NULL,
    jobs_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.user_jobs;
       public         heap    postgres    false            �            1259    16498    userjob_id_seq    SEQUENCE     w   CREATE SEQUENCE public.userjob_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.userjob_id_seq;
       public          postgres    false    213                       0    0    userjob_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.userjob_id_seq OWNED BY public.user_jobs.id;
          public          postgres    false    214            f           2604    16446 
   company id    DEFAULT     h   ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);
 9   ALTER TABLE public.company ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            i           2604    16457    jobs id    DEFAULT     a   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            j           2604    16499    user_jobs id    DEFAULT     j   ALTER TABLE ONLY public.user_jobs ALTER COLUMN id SET DEFAULT nextval('public.userjob_id_seq'::regclass);
 ;   ALTER TABLE public.user_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �          0    16437    company 
   TABLE DATA           ~   COPY public.company (id, nama, city, organization_size, industri_type, logo, user_access, created_at, updated_at) FROM stdin;
    public          postgres    false    209   �                 0    16448    jobs 
   TABLE DATA           �   COPY public.jobs (id, job_title, company_id, location, workspace_type, min_salary, max_salary, created_at, updated_at) FROM stdin;
    public          postgres    false    211   �                 0    16458 	   user_jobs 
   TABLE DATA           \   COPY public.user_jobs (id, user_id, resume_id, jobs_id, created_at, updated_at) FROM stdin;
    public          postgres    false    213   A                   0    0    company_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.company_id_seq', 3, true);
          public          postgres    false    210                       0    0 
   job_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.job_id_seq', 7, true);
          public          postgres    false    212                       0    0    userjob_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.userjob_id_seq', 3, true);
          public          postgres    false    214            m           2606    16443    company company_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    209            o           2606    16454    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    211            q           2606    16462    user_jobs user_jobs_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_jobs
    ADD CONSTRAINT user_jobs_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_jobs DROP CONSTRAINT user_jobs_pkey;
       public            postgres    false    213            r           2606    16470    jobs company_id    FK CONSTRAINT     }   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES public.company(id) NOT VALID;
 9   ALTER TABLE ONLY public.jobs DROP CONSTRAINT company_id;
       public          postgres    false    3181    211    209            s           2606    16475    user_jobs jobs_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.user_jobs
    ADD CONSTRAINT jobs_id FOREIGN KEY (jobs_id) REFERENCES public.jobs(id) NOT VALID;
 ;   ALTER TABLE ONLY public.user_jobs DROP CONSTRAINT jobs_id;
       public          postgres    false    213    211    3183            �   �   x�]�MK�0�ϓ_��f&M�q������^��ؖ6�߷UXXaN＼�C�v������܇��]�$��d ��=��֗���f/�s�rӍ���L�X`dΰ�5S��+S�;���t?~�u�B���z�zI��P��Eִm�]�n"�>HԻ%��K�W�"D��^�?!��F�f6.ω����ۡ����(�~ ��I�         �   x�m�;�0��)|�X����.�EAA��Ҭ��DIY�ħb�W��࠷�L���^�y)+�tе���Q�N@�/`�YF�c�h�R��{'Aw6�u����^�^k� ��2�$��������%
m��	�k=��c�7�         O   x�U̱� C�O��I�A�g��s�t���-� ud/dq�CD�s"
(�S�q�uR\R�$�%�O�ר1�K����?�     