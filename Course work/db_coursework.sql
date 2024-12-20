PGDMP                   
    |         
   coursework    16.4    16.4 N    J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    16394 
   coursework    DATABASE     ~   CREATE DATABASE coursework WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE coursework;
                postgres    false            �            1259    16451    accessories    TABLE     A  CREATE TABLE public.accessories (
    accessories_id integer NOT NULL,
    accessories_name character varying(255),
    accessories_colour character varying(255),
    accessories_type character varying(255),
    accessories_quantity integer,
    provider_inn character varying(255),
    accessories_cost numeric(10,2)
);
    DROP TABLE public.accessories;
       public         heap    postgres    false            �            1259    16450    accessories_accessories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accessories_accessories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accessories_accessories_id_seq;
       public          postgres    false    224            N           0    0    accessories_accessories_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accessories_accessories_id_seq OWNED BY public.accessories.accessories_id;
          public          postgres    false    223            �            1259    16465 	   furniture    TABLE     =  CREATE TABLE public.furniture (
    furniture_id integer NOT NULL,
    furniture_colour character varying(255),
    furniture_article integer,
    id_material integer,
    furniture_type character varying(255),
    furniture_size numeric(5,2),
    furniture_name character varying(255),
    id_accessories integer
);
    DROP TABLE public.furniture;
       public         heap    postgres    false            �            1259    16464    furniture_furniture_id_seq    SEQUENCE     �   CREATE SEQUENCE public.furniture_furniture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.furniture_furniture_id_seq;
       public          postgres    false    226            O           0    0    furniture_furniture_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.furniture_furniture_id_seq OWNED BY public.furniture.furniture_id;
          public          postgres    false    225            �            1259    16411    legal_person    TABLE     5  CREATE TABLE public.legal_person (
    legal_person_id integer NOT NULL,
    legal_person_inn character varying(255),
    legal_person_name character varying(255),
    legal_person_phone character varying(255),
    legal_person_email character varying(255),
    legal_person_address character varying(255)
);
     DROP TABLE public.legal_person;
       public         heap    postgres    false            �            1259    16410     legal_person_legal_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.legal_person_legal_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.legal_person_legal_person_id_seq;
       public          postgres    false    218            P           0    0     legal_person_legal_person_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.legal_person_legal_person_id_seq OWNED BY public.legal_person.legal_person_id;
          public          postgres    false    217            �            1259    16437    material    TABLE     ,  CREATE TABLE public.material (
    material_id integer NOT NULL,
    material_colour character varying(255),
    material_name character varying(255),
    material_type character varying(255),
    material_quantity integer,
    provider_inn character varying(255),
    material_cost numeric(10,2)
);
    DROP TABLE public.material;
       public         heap    postgres    false            �            1259    16436    material_material_id_seq    SEQUENCE     �   CREATE SEQUENCE public.material_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.material_material_id_seq;
       public          postgres    false    222            Q           0    0    material_material_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.material_material_id_seq OWNED BY public.material.material_id;
          public          postgres    false    221            �            1259    16396    natural_person    TABLE     9  CREATE TABLE public.natural_person (
    natural_person_id integer NOT NULL,
    natural_person_passport integer,
    natural_person_name character varying(255),
    natural_person_phone character varying(255),
    natural_person_email character varying(255),
    natural_person_address character varying(255)
);
 "   DROP TABLE public.natural_person;
       public         heap    postgres    false            �            1259    16395 $   natural_person_natural_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.natural_person_natural_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.natural_person_natural_person_id_seq;
       public          postgres    false    216            R           0    0 $   natural_person_natural_person_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.natural_person_natural_person_id_seq OWNED BY public.natural_person.natural_person_id;
          public          postgres    false    215            �            1259    16486    orders    TABLE     �  CREATE TABLE public.orders (
    orders_id integer NOT NULL,
    orders_registration_date date,
    orders_total_cost numeric(10,2),
    order_number integer,
    category_customer character varying(50),
    orders_status character varying(255),
    customer_id integer,
    CONSTRAINT check_customer_id CHECK (((((category_customer)::text = 'Юр. лицо'::text) AND (customer_id IS NOT NULL)) OR (((category_customer)::text = 'Физ. лицо'::text) AND (customer_id IS NOT NULL)))),
    CONSTRAINT orders_category_customer_check CHECK (((category_customer)::text = ANY ((ARRAY['Юр. лицо'::character varying, 'Физ. лицо'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16485    orders_orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_orders_id_seq;
       public          postgres    false    228            S           0    0    orders_orders_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_orders_id_seq OWNED BY public.orders.orders_id;
          public          postgres    false    227            �            1259    16426    provider    TABLE     �   CREATE TABLE public.provider (
    provider_id integer NOT NULL,
    provider_inn character varying(255),
    provider_name character varying(255),
    provider_address character varying(255)
);
    DROP TABLE public.provider;
       public         heap    postgres    false            �            1259    16425    provider_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provider_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.provider_provider_id_seq;
       public          postgres    false    220            T           0    0    provider_provider_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.provider_provider_id_seq OWNED BY public.provider.provider_id;
          public          postgres    false    219            �            1259    16507    waybill    TABLE     �   CREATE TABLE public.waybill (
    waybill_id integer NOT NULL,
    waybill_number integer,
    article_furniture integer,
    furniture_quantity integer,
    orders_number integer
);
    DROP TABLE public.waybill;
       public         heap    postgres    false            �            1259    16506    waybill_waybill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.waybill_waybill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.waybill_waybill_id_seq;
       public          postgres    false    230            U           0    0    waybill_waybill_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.waybill_waybill_id_seq OWNED BY public.waybill.waybill_id;
          public          postgres    false    229            w           2604    16454    accessories accessories_id    DEFAULT     �   ALTER TABLE ONLY public.accessories ALTER COLUMN accessories_id SET DEFAULT nextval('public.accessories_accessories_id_seq'::regclass);
 I   ALTER TABLE public.accessories ALTER COLUMN accessories_id DROP DEFAULT;
       public          postgres    false    223    224    224            x           2604    16468    furniture furniture_id    DEFAULT     �   ALTER TABLE ONLY public.furniture ALTER COLUMN furniture_id SET DEFAULT nextval('public.furniture_furniture_id_seq'::regclass);
 E   ALTER TABLE public.furniture ALTER COLUMN furniture_id DROP DEFAULT;
       public          postgres    false    225    226    226            t           2604    16414    legal_person legal_person_id    DEFAULT     �   ALTER TABLE ONLY public.legal_person ALTER COLUMN legal_person_id SET DEFAULT nextval('public.legal_person_legal_person_id_seq'::regclass);
 K   ALTER TABLE public.legal_person ALTER COLUMN legal_person_id DROP DEFAULT;
       public          postgres    false    218    217    218            v           2604    16440    material material_id    DEFAULT     |   ALTER TABLE ONLY public.material ALTER COLUMN material_id SET DEFAULT nextval('public.material_material_id_seq'::regclass);
 C   ALTER TABLE public.material ALTER COLUMN material_id DROP DEFAULT;
       public          postgres    false    221    222    222            s           2604    16399     natural_person natural_person_id    DEFAULT     �   ALTER TABLE ONLY public.natural_person ALTER COLUMN natural_person_id SET DEFAULT nextval('public.natural_person_natural_person_id_seq'::regclass);
 O   ALTER TABLE public.natural_person ALTER COLUMN natural_person_id DROP DEFAULT;
       public          postgres    false    216    215    216            y           2604    16489    orders orders_id    DEFAULT     t   ALTER TABLE ONLY public.orders ALTER COLUMN orders_id SET DEFAULT nextval('public.orders_orders_id_seq'::regclass);
 ?   ALTER TABLE public.orders ALTER COLUMN orders_id DROP DEFAULT;
       public          postgres    false    228    227    228            u           2604    16429    provider provider_id    DEFAULT     |   ALTER TABLE ONLY public.provider ALTER COLUMN provider_id SET DEFAULT nextval('public.provider_provider_id_seq'::regclass);
 C   ALTER TABLE public.provider ALTER COLUMN provider_id DROP DEFAULT;
       public          postgres    false    219    220    220            z           2604    16510    waybill waybill_id    DEFAULT     x   ALTER TABLE ONLY public.waybill ALTER COLUMN waybill_id SET DEFAULT nextval('public.waybill_waybill_id_seq'::regclass);
 A   ALTER TABLE public.waybill ALTER COLUMN waybill_id DROP DEFAULT;
       public          postgres    false    230    229    230            A          0    16451    accessories 
   TABLE DATA           �   COPY public.accessories (accessories_id, accessories_name, accessories_colour, accessories_type, accessories_quantity, provider_inn, accessories_cost) FROM stdin;
    public          postgres    false    224   �g       C          0    16465 	   furniture 
   TABLE DATA           �   COPY public.furniture (furniture_id, furniture_colour, furniture_article, id_material, furniture_type, furniture_size, furniture_name, id_accessories) FROM stdin;
    public          postgres    false    226   �g       ;          0    16411    legal_person 
   TABLE DATA           �   COPY public.legal_person (legal_person_id, legal_person_inn, legal_person_name, legal_person_phone, legal_person_email, legal_person_address) FROM stdin;
    public          postgres    false    218   �g       ?          0    16437    material 
   TABLE DATA           �   COPY public.material (material_id, material_colour, material_name, material_type, material_quantity, provider_inn, material_cost) FROM stdin;
    public          postgres    false    222   �g       9          0    16396    natural_person 
   TABLE DATA           �   COPY public.natural_person (natural_person_id, natural_person_passport, natural_person_name, natural_person_phone, natural_person_email, natural_person_address) FROM stdin;
    public          postgres    false    216   
h       E          0    16486    orders 
   TABLE DATA           �   COPY public.orders (orders_id, orders_registration_date, orders_total_cost, order_number, category_customer, orders_status, customer_id) FROM stdin;
    public          postgres    false    228   'h       =          0    16426    provider 
   TABLE DATA           ^   COPY public.provider (provider_id, provider_inn, provider_name, provider_address) FROM stdin;
    public          postgres    false    220   Dh       G          0    16507    waybill 
   TABLE DATA           s   COPY public.waybill (waybill_id, waybill_number, article_furniture, furniture_quantity, orders_number) FROM stdin;
    public          postgres    false    230   ah       V           0    0    accessories_accessories_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accessories_accessories_id_seq', 1, false);
          public          postgres    false    223            W           0    0    furniture_furniture_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.furniture_furniture_id_seq', 1, false);
          public          postgres    false    225            X           0    0     legal_person_legal_person_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.legal_person_legal_person_id_seq', 1, false);
          public          postgres    false    217            Y           0    0    material_material_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.material_material_id_seq', 1, false);
          public          postgres    false    221            Z           0    0 $   natural_person_natural_person_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.natural_person_natural_person_id_seq', 1, false);
          public          postgres    false    215            [           0    0    orders_orders_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_orders_id_seq', 1, false);
          public          postgres    false    227            \           0    0    provider_provider_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.provider_provider_id_seq', 1, false);
          public          postgres    false    219            ]           0    0    waybill_waybill_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.waybill_waybill_id_seq', 1, false);
          public          postgres    false    229            �           2606    16458    accessories accessories_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.accessories
    ADD CONSTRAINT accessories_pkey PRIMARY KEY (accessories_id);
 F   ALTER TABLE ONLY public.accessories DROP CONSTRAINT accessories_pkey;
       public            postgres    false    224            �           2606    16474 )   furniture furniture_furniture_article_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_furniture_article_key UNIQUE (furniture_article);
 S   ALTER TABLE ONLY public.furniture DROP CONSTRAINT furniture_furniture_article_key;
       public            postgres    false    226            �           2606    16472    furniture furniture_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_pkey PRIMARY KEY (furniture_id);
 B   ALTER TABLE ONLY public.furniture DROP CONSTRAINT furniture_pkey;
       public            postgres    false    226            �           2606    16424 0   legal_person legal_person_legal_person_email_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.legal_person
    ADD CONSTRAINT legal_person_legal_person_email_key UNIQUE (legal_person_email);
 Z   ALTER TABLE ONLY public.legal_person DROP CONSTRAINT legal_person_legal_person_email_key;
       public            postgres    false    218            �           2606    16420 .   legal_person legal_person_legal_person_inn_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.legal_person
    ADD CONSTRAINT legal_person_legal_person_inn_key UNIQUE (legal_person_inn);
 X   ALTER TABLE ONLY public.legal_person DROP CONSTRAINT legal_person_legal_person_inn_key;
       public            postgres    false    218            �           2606    16422 0   legal_person legal_person_legal_person_phone_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.legal_person
    ADD CONSTRAINT legal_person_legal_person_phone_key UNIQUE (legal_person_phone);
 Z   ALTER TABLE ONLY public.legal_person DROP CONSTRAINT legal_person_legal_person_phone_key;
       public            postgres    false    218            �           2606    16418    legal_person legal_person_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.legal_person
    ADD CONSTRAINT legal_person_pkey PRIMARY KEY (legal_person_id);
 H   ALTER TABLE ONLY public.legal_person DROP CONSTRAINT legal_person_pkey;
       public            postgres    false    218            �           2606    16444    material material_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (material_id);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    222            ~           2606    16409 6   natural_person natural_person_natural_person_email_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.natural_person
    ADD CONSTRAINT natural_person_natural_person_email_key UNIQUE (natural_person_email);
 `   ALTER TABLE ONLY public.natural_person DROP CONSTRAINT natural_person_natural_person_email_key;
       public            postgres    false    216            �           2606    16405 9   natural_person natural_person_natural_person_passport_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.natural_person
    ADD CONSTRAINT natural_person_natural_person_passport_key UNIQUE (natural_person_passport);
 c   ALTER TABLE ONLY public.natural_person DROP CONSTRAINT natural_person_natural_person_passport_key;
       public            postgres    false    216            �           2606    16407 6   natural_person natural_person_natural_person_phone_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.natural_person
    ADD CONSTRAINT natural_person_natural_person_phone_key UNIQUE (natural_person_phone);
 `   ALTER TABLE ONLY public.natural_person DROP CONSTRAINT natural_person_natural_person_phone_key;
       public            postgres    false    216            �           2606    16403 "   natural_person natural_person_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.natural_person
    ADD CONSTRAINT natural_person_pkey PRIMARY KEY (natural_person_id);
 L   ALTER TABLE ONLY public.natural_person DROP CONSTRAINT natural_person_pkey;
       public            postgres    false    216            �           2606    16495    orders orders_order_number_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_order_number_key;
       public            postgres    false    228            �           2606    16493    orders orders_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orders_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    228            �           2606    16433    provider provider_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (provider_id);
 @   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pkey;
       public            postgres    false    220            �           2606    16435 "   provider provider_provider_inn_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_provider_inn_key UNIQUE (provider_inn);
 L   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_provider_inn_key;
       public            postgres    false    220            �           2606    16512    waybill waybill_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.waybill
    ADD CONSTRAINT waybill_pkey PRIMARY KEY (waybill_id);
 >   ALTER TABLE ONLY public.waybill DROP CONSTRAINT waybill_pkey;
       public            postgres    false    230            �           2606    16514 "   waybill waybill_waybill_number_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.waybill
    ADD CONSTRAINT waybill_waybill_number_key UNIQUE (waybill_number);
 L   ALTER TABLE ONLY public.waybill DROP CONSTRAINT waybill_waybill_number_key;
       public            postgres    false    230            �           2606    16459 )   accessories accessories_provider_inn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accessories
    ADD CONSTRAINT accessories_provider_inn_fkey FOREIGN KEY (provider_inn) REFERENCES public.provider(provider_inn);
 S   ALTER TABLE ONLY public.accessories DROP CONSTRAINT accessories_provider_inn_fkey;
       public          postgres    false    220    224    4752            �           2606    16496    orders fk_legal_person    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_legal_person FOREIGN KEY (customer_id) REFERENCES public.legal_person(legal_person_id) DEFERRABLE INITIALLY DEFERRED;
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_legal_person;
       public          postgres    false    228    218    4748            �           2606    16501    orders fk_natural_person    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_natural_person FOREIGN KEY (customer_id) REFERENCES public.natural_person(natural_person_id) DEFERRABLE INITIALLY DEFERRED;
 B   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_natural_person;
       public          postgres    false    216    228    4740            �           2606    16480 '   furniture furniture_id_accessories_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_id_accessories_fkey FOREIGN KEY (id_accessories) REFERENCES public.accessories(accessories_id);
 Q   ALTER TABLE ONLY public.furniture DROP CONSTRAINT furniture_id_accessories_fkey;
       public          postgres    false    226    224    4756            �           2606    16475 $   furniture furniture_id_material_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_id_material_fkey FOREIGN KEY (id_material) REFERENCES public.material(material_id);
 N   ALTER TABLE ONLY public.furniture DROP CONSTRAINT furniture_id_material_fkey;
       public          postgres    false    226    4754    222            �           2606    16445 #   material material_provider_inn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_provider_inn_fkey FOREIGN KEY (provider_inn) REFERENCES public.provider(provider_inn);
 M   ALTER TABLE ONLY public.material DROP CONSTRAINT material_provider_inn_fkey;
       public          postgres    false    220    4752    222            �           2606    16515 &   waybill waybill_article_furniture_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waybill
    ADD CONSTRAINT waybill_article_furniture_fkey FOREIGN KEY (article_furniture) REFERENCES public.furniture(furniture_article);
 P   ALTER TABLE ONLY public.waybill DROP CONSTRAINT waybill_article_furniture_fkey;
       public          postgres    false    4758    230    226            �           2606    16520 "   waybill waybill_orders_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waybill
    ADD CONSTRAINT waybill_orders_number_fkey FOREIGN KEY (orders_number) REFERENCES public.orders(order_number);
 L   ALTER TABLE ONLY public.waybill DROP CONSTRAINT waybill_orders_number_fkey;
       public          postgres    false    230    4762    228            A      x������ � �      C      x������ � �      ;      x������ � �      ?      x������ � �      9      x������ � �      E      x������ � �      =      x������ � �      G      x������ � �     