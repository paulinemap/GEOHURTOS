PGDMP     $    ;            
    {            hurtos_admin    15.2    15.2 3    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    53204    hurtos_admin    DATABASE        CREATE DATABASE hurtos_admin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE hurtos_admin;
                postgres    false            R           1247    53206    esc_dep    DOMAIN     �  CREATE DOMAIN public.esc_dep AS text
	CONSTRAINT esc_dep_check CHECK (((VALUE ~ 'Cancha de baloncesto'::text) OR (VALUE ~ 'Cancha de futbol'::text) OR (VALUE ~ 'Cancha de tenis'::text) OR (VALUE ~ 'Cancha de voleibol'::text) OR (VALUE ~ 'Camerinos'::text) OR (VALUE ~ 'Coliseo'::text) OR (VALUE ~ 'CDU'::text) OR (VALUE ~ 'Gimnasio'::text) OR (VALUE ~ 'Piscina'::text) OR (VALUE ~ 'Pista de Atletismo'::text)));
    DROP DOMAIN public.esc_dep;
       public          postgres    false            V           1247    53209    hora    DOMAIN     �   CREATE DOMAIN public.hora AS text
	CONSTRAINT hora_check CHECK (((VALUE ~ 'Mañana'::text) OR (VALUE ~ 'Tarde'::text) OR (VALUE ~ 'Noche'::text)));
    DROP DOMAIN public.hora;
       public          postgres    false            Z           1247    53212    modalidad_hurto    DOMAIN     �   CREATE DOMAIN public.modalidad_hurto AS text
	CONSTRAINT modalidad_hurto_check CHECK (((VALUE ~ 'Atraco'::text) OR (VALUE ~ 'Cosquilleo'::text) OR (VALUE ~ 'Hurto simple'::text) OR (VALUE ~ 'Raponazo'::text)));
 $   DROP DOMAIN public.modalidad_hurto;
       public          postgres    false            �            1255    53214    actualizar_id()    FUNCTION     �   CREATE FUNCTION public.actualizar_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
	raise notice 'funcion disparadora, acción = %, sobre fila id = %', TG_OP,
	new.id;
	return new;
end;
$$;
 &   DROP FUNCTION public.actualizar_id();
       public          postgres    false            �            1259    53215    edificio    TABLE     �   CREATE TABLE public.edificio (
    id integer NOT NULL,
    nombre character varying,
    facultad character varying,
    nomenclatura character varying,
    area double precision,
    id_zona integer
);
    DROP TABLE public.edificio;
       public         heap    postgres    false            �            1259    53220    edificio_id_seq    SEQUENCE     �   ALTER TABLE public.edificio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.edificio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    53221    espacio_deportivo    TABLE     �   CREATE TABLE public.espacio_deportivo (
    id integer NOT NULL,
    nombre public.esc_dep,
    nomenclatura character varying,
    area double precision,
    id_zona integer
);
 %   DROP TABLE public.espacio_deportivo;
       public         heap    postgres    false    850            �            1259    53226    espacio_deportivo_id_seq    SEQUENCE     �   ALTER TABLE public.espacio_deportivo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.espacio_deportivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    53227    hurto_esp_d    TABLE     O   CREATE TABLE public.hurto_esp_d (
    id_hurto integer,
    id_espd integer
);
    DROP TABLE public.hurto_esp_d;
       public         heap    postgres    false            �            1259    53230    hurtos    TABLE     �   CREATE TABLE public.hurtos (
    id integer NOT NULL,
    hora public.hora,
    modalidad public.modalidad_hurto,
    num_objetos_robados integer
);
    DROP TABLE public.hurtos;
       public         heap    postgres    false    858    854            �            1259    53235 	   hurtos_ed    TABLE     K   CREATE TABLE public.hurtos_ed (
    id_hurto integer,
    id_ed integer
);
    DROP TABLE public.hurtos_ed;
       public         heap    postgres    false            �            1259    53238    hurtos_id_seq    SEQUENCE     �   ALTER TABLE public.hurtos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hurtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    53239 	   hurtos_zv    TABLE     K   CREATE TABLE public.hurtos_zv (
    id_hurto integer,
    id_zv integer
);
    DROP TABLE public.hurtos_zv;
       public         heap    postgres    false            �            1259    53242    id_seq    SEQUENCE     o   CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.id_seq;
       public          postgres    false            �            1259    53243    universidad    TABLE     �   CREATE TABLE public.universidad (
    id integer NOT NULL,
    nombre character varying,
    sede character varying,
    direccion character varying,
    area double precision
);
    DROP TABLE public.universidad;
       public         heap    postgres    false            �            1259    53248 
   zona_verde    TABLE     l   CREATE TABLE public.zona_verde (
    id integer NOT NULL,
    area double precision,
    id_zona integer
);
    DROP TABLE public.zona_verde;
       public         heap    postgres    false            �            1259    53251    zonas    TABLE     �   CREATE TABLE public.zonas (
    id integer NOT NULL,
    nomenclatura character varying,
    area double precision,
    id_uni integer
);
    DROP TABLE public.zonas;
       public         heap    postgres    false            :          0    53215    edificio 
   TABLE DATA           U   COPY public.edificio (id, nombre, facultad, nomenclatura, area, id_zona) FROM stdin;
    public          postgres    false    214   <       <          0    53221    espacio_deportivo 
   TABLE DATA           T   COPY public.espacio_deportivo (id, nombre, nomenclatura, area, id_zona) FROM stdin;
    public          postgres    false    216   �C       >          0    53227    hurto_esp_d 
   TABLE DATA           8   COPY public.hurto_esp_d (id_hurto, id_espd) FROM stdin;
    public          postgres    false    218   E       ?          0    53230    hurtos 
   TABLE DATA           J   COPY public.hurtos (id, hora, modalidad, num_objetos_robados) FROM stdin;
    public          postgres    false    219   �E       @          0    53235 	   hurtos_ed 
   TABLE DATA           4   COPY public.hurtos_ed (id_hurto, id_ed) FROM stdin;
    public          postgres    false    220   �F       B          0    53239 	   hurtos_zv 
   TABLE DATA           4   COPY public.hurtos_zv (id_hurto, id_zv) FROM stdin;
    public          postgres    false    222    G       D          0    53243    universidad 
   TABLE DATA           H   COPY public.universidad (id, nombre, sede, direccion, area) FROM stdin;
    public          postgres    false    224   �G       E          0    53248 
   zona_verde 
   TABLE DATA           7   COPY public.zona_verde (id, area, id_zona) FROM stdin;
    public          postgres    false    225   �G       F          0    53251    zonas 
   TABLE DATA           ?   COPY public.zonas (id, nomenclatura, area, id_uni) FROM stdin;
    public          postgres    false    226   CH       M           0    0    edificio_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.edificio_id_seq', 69, true);
          public          postgres    false    215            N           0    0    espacio_deportivo_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.espacio_deportivo_id_seq', 22, true);
          public          postgres    false    217            O           0    0    hurtos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.hurtos_id_seq', 1, false);
          public          postgres    false    221            P           0    0    id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('public.id_seq', 1, false);
          public          postgres    false    223            �           2606    53257    edificio edificio_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.edificio
    ADD CONSTRAINT edificio_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.edificio DROP CONSTRAINT edificio_pkey;
       public            postgres    false    214            �           2606    53259 (   espacio_deportivo espacio_deportivo_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.espacio_deportivo
    ADD CONSTRAINT espacio_deportivo_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.espacio_deportivo DROP CONSTRAINT espacio_deportivo_pkey;
       public            postgres    false    216            �           2606    53261    hurtos hurtos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hurtos
    ADD CONSTRAINT hurtos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hurtos DROP CONSTRAINT hurtos_pkey;
       public            postgres    false    219            �           2606    53263    universidad universidad_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_pkey;
       public            postgres    false    224            �           2606    53265    zona_verde zona_verde_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.zona_verde
    ADD CONSTRAINT zona_verde_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.zona_verde DROP CONSTRAINT zona_verde_pkey;
       public            postgres    false    225            �           2606    53267    zonas zonas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.zonas
    ADD CONSTRAINT zonas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.zonas DROP CONSTRAINT zonas_pkey;
       public            postgres    false    226            �           2620    53268    hurtos actualizar_hurtos    TRIGGER     �   CREATE TRIGGER actualizar_hurtos BEFORE INSERT OR UPDATE ON public.hurtos FOR EACH ROW EXECUTE FUNCTION public.actualizar_id();
 1   DROP TRIGGER actualizar_hurtos ON public.hurtos;
       public          postgres    false    227    219            �           2606    53269    edificio edificio_id_zona_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.edificio
    ADD CONSTRAINT edificio_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES public.zonas(id);
 H   ALTER TABLE ONLY public.edificio DROP CONSTRAINT edificio_id_zona_fkey;
       public          postgres    false    226    3232    214            �           2606    53274 0   espacio_deportivo espacio_deportivo_id_zona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espacio_deportivo
    ADD CONSTRAINT espacio_deportivo_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES public.zonas(id);
 Z   ALTER TABLE ONLY public.espacio_deportivo DROP CONSTRAINT espacio_deportivo_id_zona_fkey;
       public          postgres    false    3232    226    216            �           2606    53279 $   hurto_esp_d hurto_esp_d_id_espd_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hurto_esp_d
    ADD CONSTRAINT hurto_esp_d_id_espd_fkey FOREIGN KEY (id_espd) REFERENCES public.espacio_deportivo(id);
 N   ALTER TABLE ONLY public.hurto_esp_d DROP CONSTRAINT hurto_esp_d_id_espd_fkey;
       public          postgres    false    218    216    3224            �           2606    53284 %   hurto_esp_d hurto_esp_d_id_hurto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hurto_esp_d
    ADD CONSTRAINT hurto_esp_d_id_hurto_fkey FOREIGN KEY (id_hurto) REFERENCES public.hurtos(id);
 O   ALTER TABLE ONLY public.hurto_esp_d DROP CONSTRAINT hurto_esp_d_id_hurto_fkey;
       public          postgres    false    3226    218    219            �           2606    53289    hurtos_ed hurtos_ed_id_ed_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.hurtos_ed
    ADD CONSTRAINT hurtos_ed_id_ed_fkey FOREIGN KEY (id_ed) REFERENCES public.edificio(id);
 H   ALTER TABLE ONLY public.hurtos_ed DROP CONSTRAINT hurtos_ed_id_ed_fkey;
       public          postgres    false    3222    220    214            �           2606    53294 !   hurtos_ed hurtos_ed_id_hurto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hurtos_ed
    ADD CONSTRAINT hurtos_ed_id_hurto_fkey FOREIGN KEY (id_hurto) REFERENCES public.hurtos(id);
 K   ALTER TABLE ONLY public.hurtos_ed DROP CONSTRAINT hurtos_ed_id_hurto_fkey;
       public          postgres    false    3226    220    219            �           2606    53299 !   hurtos_zv hurtos_zv_id_hurto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hurtos_zv
    ADD CONSTRAINT hurtos_zv_id_hurto_fkey FOREIGN KEY (id_hurto) REFERENCES public.hurtos(id);
 K   ALTER TABLE ONLY public.hurtos_zv DROP CONSTRAINT hurtos_zv_id_hurto_fkey;
       public          postgres    false    222    219    3226            �           2606    53304    hurtos_zv hurtos_zv_id_zv_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hurtos_zv
    ADD CONSTRAINT hurtos_zv_id_zv_fkey FOREIGN KEY (id_zv) REFERENCES public.zona_verde(id);
 H   ALTER TABLE ONLY public.hurtos_zv DROP CONSTRAINT hurtos_zv_id_zv_fkey;
       public          postgres    false    3230    222    225            �           2606    53309 "   zona_verde zona_verde_id_zona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.zona_verde
    ADD CONSTRAINT zona_verde_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES public.zonas(id);
 L   ALTER TABLE ONLY public.zona_verde DROP CONSTRAINT zona_verde_id_zona_fkey;
       public          postgres    false    225    226    3232            �           2606    53314    zonas zonas_id_uni_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.zonas
    ADD CONSTRAINT zonas_id_uni_fkey FOREIGN KEY (id_uni) REFERENCES public.universidad(id);
 A   ALTER TABLE ONLY public.zonas DROP CONSTRAINT zonas_id_uni_fkey;
       public          postgres    false    226    224    3228            :   �  x��W�r�<�~�|�DW���ǆE� ���C��l��<���>�GtP������f��K��"HILgWWeee�X���܎}j�E�۪NC�]'�G��b�K��4���"8�J��y�1�.�ߦۮOc�K圢p����`��2#�B?����U^�� ~�N,)�-�V�c�q�׈�PM�I��w�rS|�ۻ)���i��z�V�d�)���:��������6��>�[��#�}ӎ��O+~6YA���k�e�
��
'�8�ܸ���?C]�W@p7�P���_Z:�(nR�侸������߿E��&��+�N8kJOD�*g"I�]P_���*�R;GV*�3 �c��zț߻�0H(�JG!��E�<3�ԗ���u�^y<chq�Z�m=��U���Վ�3I��A����K�B�S����q*���}�{�J|,Ʌ�FR�21�}>|���]��W�T�)Yz��0��,@����3��M{��:��ߒ��{����Hh�%�֛��^l~mR�aW�m��J��iv���4)�-E��O����^�u�^�K�֛�#3� �h�ŕhId��q4�O�S�o�Մz�(�$�3�S�i�e %��[4ۘ���9�UbոH�Cz�T�(p �$=*㬌\M�%���DJ�!�ڙ ̅�dw x��k�!B��Vi�:��:Υ�V�,}C�%�Z�X:��p�×'˂����ݡd����o�lc>*=��4	�PYE�i�	O���i���E�A�;+�g��(7=�~Oч�3Q ��j���Q�݊� g�ݼo��D�%���)�#��dC)��1��D�Κz��Q`�;ї�E�SB�Y���'��r�y߾H���--ަ����C�v��Q>��)����	Le��s���8�fR�ef�ҡ'<���P;>��<viTXC��D���;�៦0qї��(F���@Yb���$g��ӘY^�Q��x R�[idd,��k�/�� ő��|��aD���<�J#-*$M���X�"�I,z�,t^�5z6?����JZa2�|Vl��� 5�x7��}ѫ͘0�ځ'둘Ka$쏵!*�)�l�I�-�͇
S"��d��/bÔ��m4^A�¶���'.-��M*�I39N
��
���0�X-�
^�]�v�Nʹ*�VM��&]���0U;��X|�W鮻c�K#���� �V�c�,�|a�V�,ҥ���~��b�1�U/���O؆0t�P�R2UA0��&���ұ�sp�g~þ����Sd�x�1T ���׈χ&u�?�&�h�A���1H��2pr��g����ی1��⬚6��Q�%8N�LB4������T�����e��@t�nb�?�4�L�
����|\φᏟ_?�|���K�Z��J�-��ɀV������n�607�rs�@x)��k�*B�=f?����$<*P�������}�%�f��"�G�Q`�����0���+/X%J5�Q���_��z��P��N̊f��P���0OR��>����`T98 ,��,z�@�]��_1��y5�YJ�#�aP+\�e���Y?t�K�91۵�k���S�ڈ�n��R�.���݊�c���'1�5���$67�p_|��M�5罭���TXbJ����O�>��W}fc�SX1 9ڨ`"ߜ�p�B�C!ȸ+����\Y�5P0�����/�n0���1W[ny]����2P	��<�6�a��c�]���	kVE���8q�t]E����¾:��Dx��#��4�:�����ƒ#b���:)��f��6��D:�	K�;�	3K�fm)n�P������� �yw<g��[�d�ʳ1X�V�or��y�$Vk2�j,ƨm��)�W�-w�C�Dkj��Tk��WHXSl~�C��|b�Y���̒��`�i�5f.\3��K,�];t[�)�����`>�s���\,�W�j�      <   �  x�}�=�A���)�	F�;�"s 2?c�%c^8?5��$��)�T�p;���立���o?��ǭ9��{W&N��*mz��mPi���!���Ђ*��!�eS��P�$�6�Vx� �t�ܯO��G�0+�.�Nѱ&	FS*8�`#@ƒ�]$������՝���w��Tq��dk�z�K,\�Y2�2����+E� `b���O�綣��e�><@SU�1�H(���YH�aNMG(JS��^lҥ�ȁ��L��3���0�j�nL֧���~B��Q��C\�ڝ�������g�� �{��	.bkT�����UO������1g¯=��n�����xA��.�c��������a����ym���v���#�C��,���o��f��FJ�cǿ�������      >   "   x�3�44�24��`�Ę�Ќ��D��qqq VU�      ?      x�uRAn�0<{_�Tٵ±��=T{�h�"����+���jh�D3s�Y�Ό�q�4|t��8r��|��Ω��Ek<�DF���2]�i�&�3Q�foL)3��	�ؘ��ߗW�I'Aq�v[�[�CK�*���ب������|Uj�Ғ�hŪǸW��ן��#*�h�"&J��T6�?�����x��CCc���/��5�-y�6%֏��u, �)Y�DEIz�4c�5X�����t��$!���'�K zT      @   O   x����0��0L/&�Nv��s�׏Bł�8��ZC�(�a#Ÿ�K-���E*�f=���ӈ�f���/��}H~�i<      B   P   x����@B�RL&��&���:"{�����P��w*�$�bN3ʲ,;
t FCT��yD�rF|�8���ָ��}�Xj(      D   O   x�3���,K-*�LILQHI�QK��I��M�9�2/%���9GO��XA���@���������D��������Ԑ+F��� &?'      E   T   x��� Aгc����_ǚ��� Am�%+=2�J�����2(�q3����z��N!w��f��>]��� q�g��װ�      F   ]   x�ɹB1�x]��v%��C�_Ng���ޙdp	��S�PJ���x��imKED�(n�p��v�Ȇ�u��9��f��4���o����J     