PGDMP                         z            users    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    users    DATABASE     h   CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE users;
                postgres    false            9           1247    16404    enum    TYPE     =   CREATE TYPE public.enum AS ENUM (
    'user',
    'admin'
);
    DROP TYPE public.enum;
       public          postgres    false            �            1259    16416    resume    TABLE     1  CREATE TABLE public.resume (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    attachment character varying(200) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) without time zone
);
    DROP TABLE public.resume;
       public         heap    postgres    false            �            1259    16433    resumes_id_seq    SEQUENCE     w   CREATE SEQUENCE public.resumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.resumes_id_seq;
       public          postgres    false    210                       0    0    resumes_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.resumes_id_seq OWNED BY public.resume.id;
          public          postgres    false    212            �            1259    16409    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying(200) NOT NULL,
    last_name character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    "isActive" boolean NOT NULL,
    role public.enum NOT NULL,
    about text NOT NULL,
    photo character varying(200) NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) without time zone
);
    DROP TABLE public."user";
       public         heap    postgres    false    825            �            1259    16430    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    209                       0    0    users_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.users_id_seq OWNED BY public."user".id;
          public          postgres    false    211            f           2604    16434 	   resume id    DEFAULT     g   ALTER TABLE ONLY public.resume ALTER COLUMN id SET DEFAULT nextval('public.resumes_id_seq'::regclass);
 8   ALTER TABLE public.resume ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    210            e           2604    16431    user id    DEFAULT     e   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    209            �          0    16416    resume 
   TABLE DATA           W   COPY public.resume (id, name, attachment, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    210   �       �          0    16409    user 
   TABLE DATA           �   COPY public."user" (id, first_name, last_name, email, password, "isActive", role, about, photo, created_at, updated_at) FROM stdin;
    public          postgres    false    209   y                  0    0    resumes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.resumes_id_seq', 9, true);
          public          postgres    false    212                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 12, true);
          public          postgres    false    211            k           2606    16420    resume resume_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.resume
    ADD CONSTRAINT resume_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.resume DROP CONSTRAINT resume_pkey;
       public            postgres    false    210            i           2606    16415    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    209            l           2606    16421    resume user_id    FK CONSTRAINT     n   ALTER TABLE ONLY public.resume
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);
 8   ALTER TABLE ONLY public.resume DROP CONSTRAINT user_id;
       public          postgres    false    210    3177    209            �   �   x���;�0Dk�� k=k��>m��GB	
�_@��	��4�F�x��o.��YrV�b��4v]���5C6��_�3BSM�D8v �!k@�h�$P"�B�Q;����r��EK�o��Z�%�~�a!�6�4�$����DH@T�ε{��� �[�      �   �   x�}�KO�@����+X����2$&��ԅm�j�f�C�h��������9��$�rm����\��5aѷ$�ɴM����U���=K`ϗÛI�:g[��fQ�d�$�Ɏ��0��l?Ǽ􇙠�L*I!b�������O����J�u�2��#����4�#3n+�2~�w�g�rY�y~��޻��t5��A����˫j��E�T���m���DLU(Pp�?�Ŝ�B-��z����i�     