PGDMP                     	    z            practise-db    15.0    15.0 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    17308    practise-db    DATABASE     o   CREATE DATABASE "practise-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "practise-db";
                postgres    false            ?            1255    17317 5   users_add(character varying, character varying, text) 	   PROCEDURE       CREATE PROCEDURE public.users_add(IN full_name character varying, IN email character varying, IN password_hash text)
    LANGUAGE plpgsql
    AS $$
begin 
	insert into users(full_name, email, password_hash)
	values(full_name, email, password_hash);
end $$;
 t   DROP PROCEDURE public.users_add(IN full_name character varying, IN email character varying, IN password_hash text);
       public          postgres    false                        1255    17321    users_count()    FUNCTION     ?   CREATE FUNCTION public.users_count() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
users_count int;
begin
select count(*) into users_count from users;
return users_count;
end$$;
 $   DROP FUNCTION public.users_count();
       public          postgres    false            ?            1255    17320    users_delete(integer) 	   PROCEDURE     ?   CREATE PROCEDURE public.users_delete(IN id integer)
    LANGUAGE plpgsql
    AS $$
begin 
	delete from users
	where users.id = users_delete.id;
end $$;
 3   DROP PROCEDURE public.users_delete(IN id integer);
       public          postgres    false            ?            1259    17504    branches    TABLE     ?  CREATE TABLE public.branches (
    id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    address text NOT NULL,
    region text,
    email character varying(50) NOT NULL,
    messanger character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    call_center character varying(50) NOT NULL,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
    DROP TABLE public.branches;
       public         heap    postgres    false            ?            1259    17503    branches_id_seq    SEQUENCE     ?   ALTER TABLE public.branches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            ?            1259    18178    branches_rectory    TABLE     q   CREATE TABLE public.branches_rectory (
    id integer NOT NULL,
    branch_id integer,
    rectory_id integer
);
 $   DROP TABLE public.branches_rectory;
       public         heap    postgres    false            ?            1259    18177    branches_rectory_id_seq    SEQUENCE     ?   ALTER TABLE public.branches_rectory ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.branches_rectory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            ?            1259    18110    document_receptions    TABLE     ?   CREATE TABLE public.document_receptions (
    id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    phone_number character varying(13) NOT NULL,
    enrollee_id integer
);
 '   DROP TABLE public.document_receptions;
       public         heap    postgres    false            ?            1259    18109    document_receptions_id_seq    SEQUENCE     ?   ALTER TABLE public.document_receptions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.document_receptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            ?            1259    17643    enrolees    TABLE     !  CREATE TABLE public.enrolees (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    pass_image text NOT NULL,
    image text,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    telegram text,
    phone_number character varying(50) NOT NULL,
    diploma_certificate_copy character varying(50),
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
    DROP TABLE public.enrolees;
       public         heap    postgres    false            ?            1259    17642    enrolees_id_seq    SEQUENCE     ?   ALTER TABLE public.enrolees ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.enrolees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            ?            1259    17913 
   faculities    TABLE     ?  CREATE TABLE public.faculities (
    id integer NOT NULL,
    faculties_name character varying(50) NOT NULL,
    specialist_name character varying(50) NOT NULL,
    number_students integer NOT NULL,
    grant_numbers integer,
    language text,
    tuition_fee double precision,
    faculties_code integer NOT NULL,
    type_of_lesson character varying(50) NOT NULL,
    department_id integer,
    teacher_id integer,
    room_id integer
);
    DROP TABLE public.faculities;
       public         heap    postgres    false            ?            1259    17912    faculities_id_seq    SEQUENCE     ?   ALTER TABLE public.faculities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.faculities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            ?            1259    18065    faculties_students    TABLE     u   CREATE TABLE public.faculties_students (
    id integer NOT NULL,
    faculity_id integer,
    student_id integer
);
 &   DROP TABLE public.faculties_students;
       public         heap    postgres    false            ?            1259    18064    faculties_students_id_seq    SEQUENCE     ?   ALTER TABLE public.faculties_students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.faculties_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            ?            1259    17549    finance_department    TABLE     5  CREATE TABLE public.finance_department (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    telegram_link character varying(50) NOT NULL,
    phone_number character varying(13) NOT NULL,
    address text NOT NULL,
    is_male boolean,
    salary double precision,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
 &   DROP TABLE public.finance_department;
       public         heap    postgres    false            ?            1259    17548    finance_department_id_seq    SEQUENCE     ?   ALTER TABLE public.finance_department ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.finance_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            ?            1259    18080    finance_department_students    TABLE     o   CREATE TABLE public.finance_department_students (
    finance_department_id integer,
    student_id integer
);
 /   DROP TABLE public.finance_department_students;
       public         heap    postgres    false            ?            1259    18000    international_departments    TABLE     ?  CREATE TABLE public.international_departments (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    subject character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(13) NOT NULL,
    address character varying(50) NOT NULL,
    work_time time without time zone,
    work_day text,
    country character varying(50),
    salary double precision,
    rectory_id integer,
    student_id integer,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
 -   DROP TABLE public.international_departments;
       public         heap    postgres    false            ?            1259    17999     international_departments_id_seq    SEQUENCE     ?   ALTER TABLE public.international_departments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.international_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            ?            1259    18044    international_faculities    TABLE     ?  CREATE TABLE public.international_faculities (
    id integer NOT NULL,
    faculties_name character varying(50) NOT NULL,
    specialist_name character varying(50) NOT NULL,
    faculities_code integer NOT NULL,
    how_many_students_accepted integer,
    how_much_grant integer,
    language character varying(30),
    type_of_lesson character varying(50) NOT NULL,
    tuition_fee double precision NOT NULL,
    intenational_department integer,
    teacher_id integer,
    room_id integer
);
 ,   DROP TABLE public.international_faculities;
       public         heap    postgres    false            ?            1259    18043    international_faculities_id_seq    SEQUENCE     ?   ALTER TABLE public.international_faculities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.international_faculities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            ?            1259    18094     international_faculties_students    TABLE     ?   CREATE TABLE public.international_faculties_students (
    id integer NOT NULL,
    international_faculty_id integer,
    student_id integer
);
 4   DROP TABLE public.international_faculties_students;
       public         heap    postgres    false            ?            1259    18093 '   international_faculties_students_id_seq    SEQUENCE     ?   ALTER TABLE public.international_faculties_students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.international_faculties_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            ?            1259    18136    meetings    TABLE       CREATE TABLE public.meetings (
    id integer NOT NULL,
    meeting_name character varying(50) NOT NULL,
    date_time timestamp with time zone NOT NULL,
    rectory_id integer,
    room_id integer,
    study_d_id integer,
    international_d_id integer
);
    DROP TABLE public.meetings;
       public         heap    postgres    false            ?            1259    18135    meetings_id_seq    SEQUENCE     ?   ALTER TABLE public.meetings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.meetings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            ?            1259    18162    meetings_teachers    TABLE     s   CREATE TABLE public.meetings_teachers (
    id integer NOT NULL,
    meeting_id integer,
    teacher_id integer
);
 %   DROP TABLE public.meetings_teachers;
       public         heap    postgres    false            ?            1259    18161    meetings_teachers_id_seq    SEQUENCE     ?   ALTER TABLE public.meetings_teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.meetings_teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249            ?            1259    17674    other_state_cooperations    TABLE     =  CREATE TABLE public.other_state_cooperations (
    id integer NOT NULL,
    name_university character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(13) NOT NULL,
    country character varying(50) NOT NULL,
    region text NOT NULL,
    language text NOT NULL,
    user_name character varying(50) NOT NULL,
    rector_name character varying(50) NOT NULL,
    university_year integer,
    rectory_id integer,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
 ,   DROP TABLE public.other_state_cooperations;
       public         heap    postgres    false            ?            1259    17673    other_state_cooperations_id_seq    SEQUENCE     ?   ALTER TABLE public.other_state_cooperations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.other_state_cooperations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            ?            1259    18122 2   other_state_cooperations_international_departments    TABLE     ?   CREATE TABLE public.other_state_cooperations_international_departments (
    other_state_cooperation_id integer,
    international_department_id integer
);
 F   DROP TABLE public.other_state_cooperations_international_departments;
       public         heap    postgres    false            ?            1259    17493    rectory    TABLE     v  CREATE TABLE public.rectory (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50),
    password character varying(50) NOT NULL,
    telegram_link character varying(50),
    phone_number character varying(13) NOT NULL,
    address text NOT NULL,
    time_work date NOT NULL,
    year_of_employment integer,
    experience integer,
    salary double precision NOT NULL,
    is_male boolean,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
    DROP TABLE public.rectory;
       public         heap    postgres    false            ?            1259    17492    rectory_id_seq    SEQUENCE     ?   ALTER TABLE public.rectory ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rectory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            ?            1259    17526    rooms    TABLE     ?   CREATE TABLE public.rooms (
    id integer NOT NULL,
    name_room character varying(50) NOT NULL,
    floor_room integer NOT NULL,
    number_of_seats integer NOT NULL,
    desks integer NOT NULL,
    projector integer,
    board integer
);
    DROP TABLE public.rooms;
       public         heap    postgres    false            ?            1259    17525    rooms_id_seq    SEQUENCE     ?   ALTER TABLE public.rooms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            ?            1259    17839    students    TABLE     }  CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    pass_image text NOT NULL,
    student_image text NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    telegram_link text NOT NULL,
    phone_number_family character varying(13) NOT NULL,
    phone_number_student character varying(13) NOT NULL,
    course_student integer NOT NULL,
    faculty text NOT NULL,
    tuition_fee double precision NOT NULL,
    language_facullty character varying(10),
    is_male character varying(50),
    is_foreigner boolean,
    country character varying(50) NOT NULL,
    study_d_id integer,
    teacher_id integer,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
    DROP TABLE public.students;
       public         heap    postgres    false            ?            1259    17838    students_id_seq    SEQUENCE     ?   ALTER TABLE public.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            ?            1259    17762    study_departments    TABLE     ?  CREATE TABLE public.study_departments (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    telegram_link character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    subject character varying(25) NOT NULL,
    work_experience integer,
    level character varying(10) NOT NULL,
    is_male boolean,
    address text,
    salary double precision,
    rectory_id integer,
    enrolee_id integer,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
 %   DROP TABLE public.study_departments;
       public         heap    postgres    false            ?            1259    17761    study_departments_id_seq    SEQUENCE     ?   ALTER TABLE public.study_departments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.study_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            ?            1259    17617    teachers    TABLE     Z  CREATE TABLE public.teachers (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    telegram_link character varying(50),
    phone_number character varying(13) NOT NULL,
    subject text NOT NULL,
    is_male boolean,
    address text NOT NULL,
    work_experience integer,
    salary double precision,
    CONSTRAINT proper_email CHECK (((email)::text ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text))
);
    DROP TABLE public.teachers;
       public         heap    postgres    false            ?            1259    17616    teachers_id_seq    SEQUENCE     ?   ALTER TABLE public.teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            ?            1259    18194    xemis    TABLE     ?   CREATE TABLE public.xemis (
    id integer NOT NULL,
    faculties_name character varying(50) NOT NULL,
    teacher_id integer,
    student_id integer
);
    DROP TABLE public.xemis;
       public         heap    postgres    false            ?            1259    18193    xemis_id_seq    SEQUENCE     ?   ALTER TABLE public.xemis ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.xemis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    253            ?          0    17504    branches 
   TABLE DATA           o   COPY public.branches (id, full_name, address, region, email, messanger, phone_number, call_center) FROM stdin;
    public          postgres    false    217   ??                 0    18178    branches_rectory 
   TABLE DATA           E   COPY public.branches_rectory (id, branch_id, rectory_id) FROM stdin;
    public          postgres    false    251   ??       ?          0    18110    document_receptions 
   TABLE DATA           W   COPY public.document_receptions (id, full_name, phone_number, enrollee_id) FROM stdin;
    public          postgres    false    244   ??       ?          0    17643    enrolees 
   TABLE DATA           ?   COPY public.enrolees (id, first_name, last_name, birth_date, pass_image, image, email, password, telegram, phone_number, diploma_certificate_copy) FROM stdin;
    public          postgres    false    225   {?       ?          0    17913 
   faculities 
   TABLE DATA           ?   COPY public.faculities (id, faculties_name, specialist_name, number_students, grant_numbers, language, tuition_fee, faculties_code, type_of_lesson, department_id, teacher_id, room_id) FROM stdin;
    public          postgres    false    233   ??       ?          0    18065    faculties_students 
   TABLE DATA           I   COPY public.faculties_students (id, faculity_id, student_id) FROM stdin;
    public          postgres    false    239   R?       ?          0    17549    finance_department 
   TABLE DATA           ?   COPY public.finance_department (id, first_name, last_name, birth_date, email, password, telegram_link, phone_number, address, is_male, salary) FROM stdin;
    public          postgres    false    221   ??       ?          0    18080    finance_department_students 
   TABLE DATA           X   COPY public.finance_department_students (finance_department_id, student_id) FROM stdin;
    public          postgres    false    240   ??       ?          0    18000    international_departments 
   TABLE DATA           ?   COPY public.international_departments (id, first_name, last_name, birth_date, subject, email, phone_number, address, work_time, work_day, country, salary, rectory_id, student_id) FROM stdin;
    public          postgres    false    235   ??       ?          0    18044    international_faculities 
   TABLE DATA           ?   COPY public.international_faculities (id, faculties_name, specialist_name, faculities_code, how_many_students_accepted, how_much_grant, language, type_of_lesson, tuition_fee, intenational_department, teacher_id, room_id) FROM stdin;
    public          postgres    false    237   0?       ?          0    18094     international_faculties_students 
   TABLE DATA           d   COPY public.international_faculties_students (id, international_faculty_id, student_id) FROM stdin;
    public          postgres    false    242   ??       ?          0    18136    meetings 
   TABLE DATA           t   COPY public.meetings (id, meeting_name, date_time, rectory_id, room_id, study_d_id, international_d_id) FROM stdin;
    public          postgres    false    247   ?                  0    18162    meetings_teachers 
   TABLE DATA           G   COPY public.meetings_teachers (id, meeting_id, teacher_id) FROM stdin;
    public          postgres    false    249   ??       ?          0    17674    other_state_cooperations 
   TABLE DATA           ?   COPY public.other_state_cooperations (id, name_university, email, phone_number, country, region, language, user_name, rector_name, university_year, rectory_id) FROM stdin;
    public          postgres    false    227   ??       ?          0    18122 2   other_state_cooperations_international_departments 
   TABLE DATA           ?   COPY public.other_state_cooperations_international_departments (other_state_cooperation_id, international_department_id) FROM stdin;
    public          postgres    false    245   ?       ?          0    17493    rectory 
   TABLE DATA           ?   COPY public.rectory (id, first_name, last_name, birth_date, email, password, telegram_link, phone_number, address, time_work, year_of_employment, experience, salary, is_male) FROM stdin;
    public          postgres    false    215   ??       ?          0    17526    rooms 
   TABLE DATA           d   COPY public.rooms (id, name_room, floor_room, number_of_seats, desks, projector, board) FROM stdin;
    public          postgres    false    219   ?       ?          0    17839    students 
   TABLE DATA              COPY public.students (id, first_name, last_name, birth_date, pass_image, student_image, email, password, telegram_link, phone_number_family, phone_number_student, course_student, faculty, tuition_fee, language_facullty, is_male, is_foreigner, country, study_d_id, teacher_id) FROM stdin;
    public          postgres    false    231   Q       ?          0    17762    study_departments 
   TABLE DATA           ?   COPY public.study_departments (id, first_name, last_name, birth_date, email, password, telegram_link, phone_number, subject, work_experience, level, is_male, address, salary, rectory_id, enrolee_id) FROM stdin;
    public          postgres    false    229          ?          0    17617    teachers 
   TABLE DATA           ?   COPY public.teachers (id, first_name, last_name, birth_date, email, password, telegram_link, phone_number, subject, is_male, address, work_experience, salary) FROM stdin;
    public          postgres    false    223   Q                0    18194    xemis 
   TABLE DATA           K   COPY public.xemis (id, faculties_name, teacher_id, student_id) FROM stdin;
    public          postgres    false    253   ?	                 0    0    branches_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.branches_id_seq', 4, true);
          public          postgres    false    216                       0    0    branches_rectory_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.branches_rectory_id_seq', 9, true);
          public          postgres    false    250                       0    0    document_receptions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.document_receptions_id_seq', 8, true);
          public          postgres    false    243                       0    0    enrolees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.enrolees_id_seq', 22, true);
          public          postgres    false    224                       0    0    faculities_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.faculities_id_seq', 5, true);
          public          postgres    false    232                       0    0    faculties_students_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.faculties_students_id_seq', 15, true);
          public          postgres    false    238                       0    0    finance_department_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.finance_department_id_seq', 7, true);
          public          postgres    false    220                       0    0     international_departments_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.international_departments_id_seq', 6, true);
          public          postgres    false    234                       0    0    international_faculities_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.international_faculities_id_seq', 3, true);
          public          postgres    false    236                       0    0 '   international_faculties_students_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.international_faculties_students_id_seq', 10, true);
          public          postgres    false    241                       0    0    meetings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.meetings_id_seq', 7, true);
          public          postgres    false    246                       0    0    meetings_teachers_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.meetings_teachers_id_seq', 11, true);
          public          postgres    false    248                       0    0    other_state_cooperations_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.other_state_cooperations_id_seq', 11, true);
          public          postgres    false    226                       0    0    rectory_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.rectory_id_seq', 5, true);
          public          postgres    false    214                       0    0    rooms_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.rooms_id_seq', 122, true);
          public          postgres    false    218                       0    0    students_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.students_id_seq', 15, true);
          public          postgres    false    230                       0    0    study_departments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.study_departments_id_seq', 10, true);
          public          postgres    false    228                       0    0    teachers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.teachers_id_seq', 17, true);
          public          postgres    false    222                       0    0    xemis_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.xemis_id_seq', 10, true);
          public          postgres    false    252            ?           2606    17513    branches branches_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_email_key;
       public            postgres    false    217            ?           2606    17515 "   branches branches_phone_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_phone_number_key UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_phone_number_key;
       public            postgres    false    217            ?           2606    17511    branches branches_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_pkey;
       public            postgres    false    217            ,           2606    18182 &   branches_rectory branches_rectory_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.branches_rectory
    ADD CONSTRAINT branches_rectory_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.branches_rectory DROP CONSTRAINT branches_rectory_pkey;
       public            postgres    false    251            $           2606    18116 8   document_receptions document_receptions_phone_number_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.document_receptions
    ADD CONSTRAINT document_receptions_phone_number_key UNIQUE (phone_number);
 b   ALTER TABLE ONLY public.document_receptions DROP CONSTRAINT document_receptions_phone_number_key;
       public            postgres    false    244            &           2606    18114 ,   document_receptions document_receptions_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.document_receptions
    ADD CONSTRAINT document_receptions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.document_receptions DROP CONSTRAINT document_receptions_pkey;
       public            postgres    false    244            ?           2606    17652    enrolees enrolees_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.enrolees
    ADD CONSTRAINT enrolees_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.enrolees DROP CONSTRAINT enrolees_email_key;
       public            postgres    false    225            ?           2606    17654 "   enrolees enrolees_phone_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.enrolees
    ADD CONSTRAINT enrolees_phone_number_key UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.enrolees DROP CONSTRAINT enrolees_phone_number_key;
       public            postgres    false    225            ?           2606    17650    enrolees enrolees_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.enrolees
    ADD CONSTRAINT enrolees_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.enrolees DROP CONSTRAINT enrolees_pkey;
       public            postgres    false    225                       2606    17919    faculities faculities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.faculities
    ADD CONSTRAINT faculities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.faculities DROP CONSTRAINT faculities_pkey;
       public            postgres    false    233                        2606    18069 *   faculties_students faculties_students_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.faculties_students
    ADD CONSTRAINT faculties_students_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.faculties_students DROP CONSTRAINT faculties_students_pkey;
       public            postgres    false    239            ?           2606    17558 /   finance_department finance_department_email_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.finance_department
    ADD CONSTRAINT finance_department_email_key UNIQUE (email);
 Y   ALTER TABLE ONLY public.finance_department DROP CONSTRAINT finance_department_email_key;
       public            postgres    false    221            ?           2606    17562 6   finance_department finance_department_phone_number_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.finance_department
    ADD CONSTRAINT finance_department_phone_number_key UNIQUE (phone_number);
 `   ALTER TABLE ONLY public.finance_department DROP CONSTRAINT finance_department_phone_number_key;
       public            postgres    false    221            ?           2606    17556 *   finance_department finance_department_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.finance_department
    ADD CONSTRAINT finance_department_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.finance_department DROP CONSTRAINT finance_department_pkey;
       public            postgres    false    221            ?           2606    17560 7   finance_department finance_department_telegram_link_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.finance_department
    ADD CONSTRAINT finance_department_telegram_link_key UNIQUE (telegram_link);
 a   ALTER TABLE ONLY public.finance_department DROP CONSTRAINT finance_department_telegram_link_key;
       public            postgres    false    221                       2606    18009 =   international_departments international_departments_email_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.international_departments
    ADD CONSTRAINT international_departments_email_key UNIQUE (email);
 g   ALTER TABLE ONLY public.international_departments DROP CONSTRAINT international_departments_email_key;
       public            postgres    false    235                       2606    18011 D   international_departments international_departments_phone_number_key 
   CONSTRAINT     ?   ALTER TABLE ONLY public.international_departments
    ADD CONSTRAINT international_departments_phone_number_key UNIQUE (phone_number);
 n   ALTER TABLE ONLY public.international_departments DROP CONSTRAINT international_departments_phone_number_key;
       public            postgres    false    235                       2606    18007 8   international_departments international_departments_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.international_departments
    ADD CONSTRAINT international_departments_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.international_departments DROP CONSTRAINT international_departments_pkey;
       public            postgres    false    235                       2606    18048 6   international_faculities international_faculities_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.international_faculities
    ADD CONSTRAINT international_faculities_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.international_faculities DROP CONSTRAINT international_faculities_pkey;
       public            postgres    false    237            "           2606    18098 F   international_faculties_students international_faculties_students_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculties_students
    ADD CONSTRAINT international_faculties_students_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.international_faculties_students DROP CONSTRAINT international_faculties_students_pkey;
       public            postgres    false    242            (           2606    18140    meetings meetings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_pkey;
       public            postgres    false    247            *           2606    18166 (   meetings_teachers meetings_teachers_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.meetings_teachers
    ADD CONSTRAINT meetings_teachers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.meetings_teachers DROP CONSTRAINT meetings_teachers_pkey;
       public            postgres    false    249                        2606    17683 ;   other_state_cooperations other_state_cooperations_email_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.other_state_cooperations
    ADD CONSTRAINT other_state_cooperations_email_key UNIQUE (email);
 e   ALTER TABLE ONLY public.other_state_cooperations DROP CONSTRAINT other_state_cooperations_email_key;
       public            postgres    false    227                       2606    17681 6   other_state_cooperations other_state_cooperations_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.other_state_cooperations
    ADD CONSTRAINT other_state_cooperations_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.other_state_cooperations DROP CONSTRAINT other_state_cooperations_pkey;
       public            postgres    false    227                       2606    17685 ?   other_state_cooperations other_state_cooperations_user_name_key 
   CONSTRAINT        ALTER TABLE ONLY public.other_state_cooperations
    ADD CONSTRAINT other_state_cooperations_user_name_key UNIQUE (user_name);
 i   ALTER TABLE ONLY public.other_state_cooperations DROP CONSTRAINT other_state_cooperations_user_name_key;
       public            postgres    false    227            ?           2606    17502     rectory rectory_phone_number_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.rectory
    ADD CONSTRAINT rectory_phone_number_key UNIQUE (phone_number);
 J   ALTER TABLE ONLY public.rectory DROP CONSTRAINT rectory_phone_number_key;
       public            postgres    false    215            ?           2606    17500    rectory rectory_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.rectory
    ADD CONSTRAINT rectory_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.rectory DROP CONSTRAINT rectory_pkey;
       public            postgres    false    215            ?           2606    17532    rooms rooms_name_room_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_name_room_key UNIQUE (name_room);
 C   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_name_room_key;
       public            postgres    false    219            ?           2606    17530    rooms rooms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    219                       2606    17848    students students_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
       public            postgres    false    231                       2606    17852 )   students students_phone_number_family_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_phone_number_family_key UNIQUE (phone_number_family);
 S   ALTER TABLE ONLY public.students DROP CONSTRAINT students_phone_number_family_key;
       public            postgres    false    231                       2606    17854 *   students students_phone_number_student_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_phone_number_student_key UNIQUE (phone_number_student);
 T   ALTER TABLE ONLY public.students DROP CONSTRAINT students_phone_number_student_key;
       public            postgres    false    231                       2606    17846    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    231                       2606    17850 #   students students_telegram_link_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_telegram_link_key UNIQUE (telegram_link);
 M   ALTER TABLE ONLY public.students DROP CONSTRAINT students_telegram_link_key;
       public            postgres    false    231                       2606    17771 -   study_departments study_departments_email_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.study_departments
    ADD CONSTRAINT study_departments_email_key UNIQUE (email);
 W   ALTER TABLE ONLY public.study_departments DROP CONSTRAINT study_departments_email_key;
       public            postgres    false    229                       2606    17773 4   study_departments study_departments_phone_number_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.study_departments
    ADD CONSTRAINT study_departments_phone_number_key UNIQUE (phone_number);
 ^   ALTER TABLE ONLY public.study_departments DROP CONSTRAINT study_departments_phone_number_key;
       public            postgres    false    229            
           2606    17769 (   study_departments study_departments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.study_departments
    ADD CONSTRAINT study_departments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.study_departments DROP CONSTRAINT study_departments_pkey;
       public            postgres    false    229            ?           2606    17626    teachers teachers_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_email_key;
       public            postgres    false    223            ?           2606    17628 "   teachers teachers_phone_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_phone_number_key UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_phone_number_key;
       public            postgres    false    223            ?           2606    17624    teachers teachers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.teachers DROP CONSTRAINT teachers_pkey;
       public            postgres    false    223            .           2606    18198    xemis xemis_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.xemis
    ADD CONSTRAINT xemis_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.xemis DROP CONSTRAINT xemis_pkey;
       public            postgres    false    253            K           2606    18183 0   branches_rectory branches_rectory_branch_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.branches_rectory
    ADD CONSTRAINT branches_rectory_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id);
 Z   ALTER TABLE ONLY public.branches_rectory DROP CONSTRAINT branches_rectory_branch_id_fkey;
       public          postgres    false    3558    217    251            L           2606    18188 1   branches_rectory branches_rectory_rectory_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.branches_rectory
    ADD CONSTRAINT branches_rectory_rectory_id_fkey FOREIGN KEY (rectory_id) REFERENCES public.rectory(id);
 [   ALTER TABLE ONLY public.branches_rectory DROP CONSTRAINT branches_rectory_rectory_id_fkey;
       public          postgres    false    3552    251    215            B           2606    18117 8   document_receptions document_receptions_enrollee_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.document_receptions
    ADD CONSTRAINT document_receptions_enrollee_id_fkey FOREIGN KEY (enrollee_id) REFERENCES public.enrolees(id);
 b   ALTER TABLE ONLY public.document_receptions DROP CONSTRAINT document_receptions_enrollee_id_fkey;
       public          postgres    false    225    244    3582            4           2606    17920 (   faculities faculities_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.faculities
    ADD CONSTRAINT faculities_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.study_departments(id);
 R   ALTER TABLE ONLY public.faculities DROP CONSTRAINT faculities_department_id_fkey;
       public          postgres    false    233    229    3594            5           2606    17930 "   faculities faculities_room_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.faculities
    ADD CONSTRAINT faculities_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);
 L   ALTER TABLE ONLY public.faculities DROP CONSTRAINT faculities_room_id_fkey;
       public          postgres    false    219    233    3562            6           2606    17925 %   faculities faculities_teacher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.faculities
    ADD CONSTRAINT faculities_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);
 O   ALTER TABLE ONLY public.faculities DROP CONSTRAINT faculities_teacher_id_fkey;
       public          postgres    false    3576    223    233            <           2606    18070 6   faculties_students faculties_students_faculity_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.faculties_students
    ADD CONSTRAINT faculties_students_faculity_id_fkey FOREIGN KEY (faculity_id) REFERENCES public.faculities(id);
 `   ALTER TABLE ONLY public.faculties_students DROP CONSTRAINT faculties_students_faculity_id_fkey;
       public          postgres    false    3606    233    239            =           2606    18075 5   faculties_students faculties_students_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.faculties_students
    ADD CONSTRAINT faculties_students_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 _   ALTER TABLE ONLY public.faculties_students DROP CONSTRAINT faculties_students_student_id_fkey;
       public          postgres    false    231    3602    239            >           2606    18083 R   finance_department_students finance_department_students_finance_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.finance_department_students
    ADD CONSTRAINT finance_department_students_finance_department_id_fkey FOREIGN KEY (finance_department_id) REFERENCES public.finance_department(id);
 |   ALTER TABLE ONLY public.finance_department_students DROP CONSTRAINT finance_department_students_finance_department_id_fkey;
       public          postgres    false    221    240    3568            ?           2606    18088 G   finance_department_students finance_department_students_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.finance_department_students
    ADD CONSTRAINT finance_department_students_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 q   ALTER TABLE ONLY public.finance_department_students DROP CONSTRAINT finance_department_students_student_id_fkey;
       public          postgres    false    3602    231    240            7           2606    18012 C   international_departments international_departments_rectory_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_departments
    ADD CONSTRAINT international_departments_rectory_id_fkey FOREIGN KEY (rectory_id) REFERENCES public.rectory(id);
 m   ALTER TABLE ONLY public.international_departments DROP CONSTRAINT international_departments_rectory_id_fkey;
       public          postgres    false    235    3552    215            8           2606    18017 C   international_departments international_departments_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_departments
    ADD CONSTRAINT international_departments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 m   ALTER TABLE ONLY public.international_departments DROP CONSTRAINT international_departments_student_id_fkey;
       public          postgres    false    231    3602    235            9           2606    18049 N   international_faculities international_faculities_intenational_department_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculities
    ADD CONSTRAINT international_faculities_intenational_department_fkey FOREIGN KEY (intenational_department) REFERENCES public.international_departments(id);
 x   ALTER TABLE ONLY public.international_faculities DROP CONSTRAINT international_faculities_intenational_department_fkey;
       public          postgres    false    235    237    3612            :           2606    18059 >   international_faculities international_faculities_room_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculities
    ADD CONSTRAINT international_faculities_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);
 h   ALTER TABLE ONLY public.international_faculities DROP CONSTRAINT international_faculities_room_id_fkey;
       public          postgres    false    219    237    3562            ;           2606    18054 A   international_faculities international_faculities_teacher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculities
    ADD CONSTRAINT international_faculities_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);
 k   ALTER TABLE ONLY public.international_faculities DROP CONSTRAINT international_faculities_teacher_id_fkey;
       public          postgres    false    237    223    3576            @           2606    18099 _   international_faculties_students international_faculties_students_international_faculty_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculties_students
    ADD CONSTRAINT international_faculties_students_international_faculty_id_fkey FOREIGN KEY (international_faculty_id) REFERENCES public.international_faculities(id);
 ?   ALTER TABLE ONLY public.international_faculties_students DROP CONSTRAINT international_faculties_students_international_faculty_id_fkey;
       public          postgres    false    3614    237    242            A           2606    18104 Q   international_faculties_students international_faculties_students_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.international_faculties_students
    ADD CONSTRAINT international_faculties_students_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 {   ALTER TABLE ONLY public.international_faculties_students DROP CONSTRAINT international_faculties_students_student_id_fkey;
       public          postgres    false    242    3602    231            E           2606    18156 )   meetings meetings_international_d_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_international_d_id_fkey FOREIGN KEY (international_d_id) REFERENCES public.international_departments(id);
 S   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_international_d_id_fkey;
       public          postgres    false    235    247    3612            F           2606    18141 !   meetings meetings_rectory_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_rectory_id_fkey FOREIGN KEY (rectory_id) REFERENCES public.rectory(id);
 K   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_rectory_id_fkey;
       public          postgres    false    247    3552    215            G           2606    18146    meetings meetings_room_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);
 H   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_room_id_fkey;
       public          postgres    false    3562    247    219            H           2606    18151 !   meetings meetings_study_d_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_study_d_id_fkey FOREIGN KEY (study_d_id) REFERENCES public.study_departments(id);
 K   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_study_d_id_fkey;
       public          postgres    false    229    3594    247            I           2606    18167 3   meetings_teachers meetings_teachers_meeting_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.meetings_teachers
    ADD CONSTRAINT meetings_teachers_meeting_id_fkey FOREIGN KEY (meeting_id) REFERENCES public.meetings(id);
 ]   ALTER TABLE ONLY public.meetings_teachers DROP CONSTRAINT meetings_teachers_meeting_id_fkey;
       public          postgres    false    3624    249    247            J           2606    18172 3   meetings_teachers meetings_teachers_teacher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.meetings_teachers
    ADD CONSTRAINT meetings_teachers_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);
 ]   ALTER TABLE ONLY public.meetings_teachers DROP CONSTRAINT meetings_teachers_teacher_id_fkey;
       public          postgres    false    3576    223    249            C           2606    18130 r   other_state_cooperations_international_departments other_state_cooperations_inter_international_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.other_state_cooperations_international_departments
    ADD CONSTRAINT other_state_cooperations_inter_international_department_id_fkey FOREIGN KEY (international_department_id) REFERENCES public.international_departments(id);
 ?   ALTER TABLE ONLY public.other_state_cooperations_international_departments DROP CONSTRAINT other_state_cooperations_inter_international_department_id_fkey;
       public          postgres    false    235    3612    245            D           2606    18125 r   other_state_cooperations_international_departments other_state_cooperations_intern_other_state_cooperation_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.other_state_cooperations_international_departments
    ADD CONSTRAINT other_state_cooperations_intern_other_state_cooperation_id_fkey FOREIGN KEY (other_state_cooperation_id) REFERENCES public.other_state_cooperations(id);
 ?   ALTER TABLE ONLY public.other_state_cooperations_international_departments DROP CONSTRAINT other_state_cooperations_intern_other_state_cooperation_id_fkey;
       public          postgres    false    227    245    3586            /           2606    17686 A   other_state_cooperations other_state_cooperations_rectory_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.other_state_cooperations
    ADD CONSTRAINT other_state_cooperations_rectory_id_fkey FOREIGN KEY (rectory_id) REFERENCES public.rectory(id);
 k   ALTER TABLE ONLY public.other_state_cooperations DROP CONSTRAINT other_state_cooperations_rectory_id_fkey;
       public          postgres    false    227    3552    215            2           2606    17855 !   students students_study_d_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_study_d_id_fkey FOREIGN KEY (study_d_id) REFERENCES public.study_departments(id);
 K   ALTER TABLE ONLY public.students DROP CONSTRAINT students_study_d_id_fkey;
       public          postgres    false    231    229    3594            3           2606    17860 !   students students_teacher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);
 K   ALTER TABLE ONLY public.students DROP CONSTRAINT students_teacher_id_fkey;
       public          postgres    false    223    231    3576            0           2606    17779 3   study_departments study_departments_enrolee_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.study_departments
    ADD CONSTRAINT study_departments_enrolee_id_fkey FOREIGN KEY (enrolee_id) REFERENCES public.enrolees(id);
 ]   ALTER TABLE ONLY public.study_departments DROP CONSTRAINT study_departments_enrolee_id_fkey;
       public          postgres    false    229    225    3582            1           2606    17774 3   study_departments study_departments_rectory_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.study_departments
    ADD CONSTRAINT study_departments_rectory_id_fkey FOREIGN KEY (rectory_id) REFERENCES public.rectory(id);
 ]   ALTER TABLE ONLY public.study_departments DROP CONSTRAINT study_departments_rectory_id_fkey;
       public          postgres    false    229    215    3552            M           2606    18204    xemis xemis_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.xemis
    ADD CONSTRAINT xemis_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 E   ALTER TABLE ONLY public.xemis DROP CONSTRAINT xemis_student_id_fkey;
       public          postgres    false    253    231    3602            N           2606    18199    xemis xemis_teacher_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.xemis
    ADD CONSTRAINT xemis_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);
 E   ALTER TABLE ONLY public.xemis DROP CONSTRAINT xemis_teacher_id_fkey;
       public          postgres    false    3576    253    223            ?   ?   x?e??
?0????)??6ŏ?o? ??j??u?"z?D?`?8???0??<L'Q????т??CGa?Z????V@?M?? J)?h?e?~?ڂ?(????`\EJa??x?gd?'??#?)G? +n??("?q??J?Ԃ?*}?i6?G#??Nu?^{??DEvB/Y??0$???9?? u?j?         3   x?ȹ  ???$ۼ???H&?P(H??-?R?aS>?M????6???      ?   v   x?M˽
?0F??}/F?4??*?upq	$?J???^??>\α??1?X??1?????J??e?	?Q?.mSv??q?2?&x?R?V?#0b??\?j@d???wG$?x?MZދr??????I'g      ?     x???]O?0???I;ߓ??2LB???ݸ??Z$6??Nݯ?;QKmwH?@?y??s? ??:*%S??\?c?I?SX}??Y[?^y냿??|?[?J?@?????b???e	??{U??U??5?????S???PU(???~{?^?????odM??*%???????2???t??g?{	<?nCZX??r?K?(."???89????$M?????lGEoI?85?ԟ?'	ZL?XR?%?ִTh?-qg?w?ԿsTL?P??M???֌=(R?(?c?F8?w?F?4?'?3??s:\???8??SG??NB?3\?@c΀
???du?`?????:?jg?r?Ť???H*x&?%?'6N???'x(vM?u!è<?u#???@hg??~?)??o飘???>?g?dD????UB?C?)??vɤ??9)X????^?;ڶLm??xl??l?y??M"?%p#	i????v?
]?c??]??}cs?)q?R?.???!^????????????s?!4QR'%?[?(w????Sa???o????I?9%9??a-|a5'v???J???>*Mj??NL??/,?}D6㱔zý]~??8ёIQ8%\?f??????_????k?(&5iJ???/rO8?pO?????C?=f\7?]?܄?K?xӋ??a???@·?%?g?6,?=󺦘?J?~?<x??W??????R;?i?wC?'??J??`?A%~????r?????g5&u?IO9?f? ???      ?   ?   x?uO?
?0<?~E?@???^?
=գ?P?4i"տwSP/????c?	?G?dB]G?t??D?
Ѹ?T?qAM???dƳ??7?
?Γw?	-?+8??ÚA??? &{q???3i?pQ ??w??<?KB*?????6r???-??XBCq44gՃ8?	R-???"??
/+D|HxSG      ?   G   x?̹?0???(ƣ?#ɽ??:L&?2??։6HK?-v?9??Z??m_?:ZHS!?^8?i??&?i?=????      ?     x?u?Qo?0??/???Ɔ??I?6?ڦ?բ?R^??\0`?????????7_?w??ܙ^9????=d?????P-??k?L??B?;q?q?w???YC3MO???ʎ?????V~?)
?N5H&???RX? ߽*???M0VI??L6?o?0(?L
??,?(???D?nq7?u@r?D?\y?G??ӌ?<?TR?[??D??9
?????5l???? d??<eT?\0??"?-?Yc?s????gat?q,J??????`????~?5?P??৞z}ZV???H??]?/???y\??s?Qi?yy?;?ނ/?ʬ,?We?Ku#?3Z?"AR??`F?Ӻ?1???0??{???Z????ġm??,?W??q?A???????????{=)??????i音??%|&???e_q??}??x?n?Ȣ?X?:?3???UUk???mu??E`???F9????[^????e????Q?vF+5???W?[?JA??E?&????lz?O-?%?{?$??]F      ?   .   x?3?4?2?4bc 6bS 6bs.#??1?????2rb???? ?      ?   !  x????n?0???+???WbX??K?*?vՍS??u!??1??H?YY???;?]?`A{Ӣ?(??0ob8d??{jjb4?n7???d??0?ZD1X???????oVѷ??	?!??)?mX.qx?LB??
ϾNr??+c?????z??p??̉#???r??TU?h)q?????띂#???#h?a?????$*?:?w?a?_???????
?????xqዢ???%Xs4	^R?=eGT?\V??m?rx??????'?p̏e?6n)??)8???u-%?c?????      ?   ?   x?]???0D??W?@I??????R?Z?????'QT?n~???Y܃??M?????րZkp??<??Hd?'??G??gi??]?o??/?l?P??J?ʩ??g\&W??-?}?????^6      ?   6   x???  ????$????#?BAڤl1?`?ɲ??????U??E?5??-      ?   ?   x??ϻ
?@????S?	3???Z;	??,AM?$"???;?	?S??0????e^PV-?ǙJ?M?u?*?>g??R?8mk?Ss?y??????
??SU?dk?8?OHe;j-??i??9????+\??=9S??*??D?\?T4          :   x?˹?@???(?c?t_/??3YD?,3??b?jf????qsT:?x???f'?? ?E??      ?     x?u??r?0?ח??d$??l;??????L7נ? ?????4d????wν???j??A?
???]??K??Q
9??I?6(?~?h??X˶?Dz?쁵?\
?q!??TнGH6 ?-??F?H?Vd???? ????B??
????f?ʠ)e;???Gmo+???\?N*;??D&t?@?Д?x?x?=<?????F??QDb???0-?+Yʺ????u)????k?????п????dؠ9?*?ϨGx??"cU&lc'e?N ?f??6??????u??vf???HA???4??#R6?????&Y???"m'???*%ڍ$=mXh:?c????7y?ָN????i羨??7? ??g??zd+.d?mW?	?Oݻ7??6???M?[-?S(?}???G"?T?Y??1o'??M??1%?=??t??t#?w9?ȳ?&?:#D7!?!???i_?6ك:?;ⲡ#g[??K?Z??5?Կy??????*      ?   )   x?3?4?2?4bc 6bS.#??1???1?p??qqq {V      ?   ?  x?m?ъ?0???S??I???P?n??B),?Boz?d&?&%?)??=?)La@?r$???g?????,?S?.?*?
?<Nڍ?>L??|??=aŒ?JpZ?????~??q7:????À?/GPJ??i??FQ?e4y?/PQFK?JZ??P	?*Ja)*??????xx???iK?E??ƍ??Ia;˕?x???׬?6?x?+??::???s8?qO?P???E%?|?,FG???t??`???Ȓ	??B?????t}?y?P????o???V$?B*?_m??g?H??E֔??Q?F?k???x?a?Ό??+?????[???$????bz????š??p?af?JB-?"O!?y!/ɓ???&?X??f?YS??h?&??XuR>׶)1LB???bf?8???r?3??d=???O˫????7hoȷɳ?C??_?&??[?l?kW?_????      ?   2  x?eֻnA??x?)?h??\C?  B,?????gNI???Q?f???/???m\?e?e܎?uN?U??P?P	????	?0?0	???:??q?ܛ?[???u?.V)V-UV+5V/u?(?,M?yn??Dzn[{?z??t????*?ª??j?????????I??mk?H?m???[???u?.V)V-UV+5V/u?(?,MR9??>?????C?	??d?[l??D????st`?N??魸?????????s|*`?O??????u0??5?????ޠ???M0Wh????CS0?h??????[?s?^+{?^+{?>?ܣ/0??"]?????ts?`???YF??]Ƹ|???˘`?2??s??`?2?]????0??e$???[q?2ke?2'????.S??e*??Ls??`?2?]f???q??=??)??<c?l?ૹ???µ????ýy??y¹??q?????Fǘ??|?Ws?Ks?ks?[s?{??G??s?c????_?_??_??}{yyڸ?$??0־????>=??}?????%u;o??p?^?{ж?      ?   ?  x???]o?0???i??0iڔ*]?vS?U??v??X??????H?J?s??yrr??Zr??O?s E?^??UA?i??M?x?x??~?D7޳1??j(??l??m??????q?I?þ?^?N6JT????R.???箂? QX?aE????D@`SJ!^* a?FT5W{?ڞA??*??~?<?-?
ִݲ??݆<:A?m?ң=??E?<S??h?~1
b?gMc?~?? ?K ?.??#??e-??????Z+??E???Aq???eB??????#??e<?????'3???o???d??&???k?+???x??ۈ?NPn??t?NGv|?m????;) ?-?????C=???l?O)???S??W3~r??U??Z?wk?^u?4e???]ȳ?Pv???lF?1???ME?ּ??n80x??cz}Jy???S????r???g??f?^D????i}?7k?Ųm?3?N?\?????g{???gځ
??'/f{????!?=?-<????GVzv?????S?(?K???.?S????????4?ϕ|??????=????c?q??n??''???&??'??4zX??{???ώ1l?u??ĝ???@?.???$	<1A;????H????öQ?^??W???ճ=?;?c[??
ni???F????7?Mԡ?tv=?E?mH?]A??K;      ?   !  x???Q??@???S?Pw?4?Ż?F/gr>?eY$??a??~???z?˥?}??d??????e???y?
,???$?0???=????
u?&q??h???-?p????2???̧e!?35??O~?sH?ӄ?<H?bE??,5?P?+	5,?0 ?
?@Y?~?d??	>????|XsQ <ɜ^?x}u?K?|kc??;*^D???????G????/?0??d-?Z+IvU?g?:???c?F??h???ho?????G??N?6?;?3?<G?W?9?????}??pS?it7D?%?vk?)z!???5??,S=1?Pf??qO\?#?Q??u?R?!.2?T??&[??&??ܛ?Ji?ޙ????6׸?%#un??B???ak??g???R?UU??ݮa???և???J???????^?_???Q"lT3t?? 6????<	5?
bxH????Vd/????7c???F2?Qȑ?O?U???Ų??B:Q??Ɛ52?????p??Kֻ?M?G^?a{[S?tW?F??MS??3?{?y?>???      ?   E  x?}??r?6???</@??t?4N??l??z?;?????ɕ,???l??????\??9?^?_R?2??
B?R?$>?й???M&??B7 ?R??J???RAe?????]sP??Z??;}??X?????!?<Z?F??$)????j???;?Z!B????Gm??j?R?0?P??P??˦??`UY?=X?_ƙ
O<??剽u%??dʻ?k1@	???#?6???g??6?"PJ? ?ib?[5?.z?vE??(}g.;?$?[}?(?~?y_I+???Bu@q??֯X?B?&&tV?z????h+???(?85V?$y?T??e%?K%NFE@"D?a=4???2?????A?$q?ߑ????q(??W5k?i???ӄ3y3??^2??g?(?3*????MjXeu-m????'1???%?ʍ????긩?t,??y?f??[?~z?It?????A?˔??96? qC?$*?&????~?U??=?y?J???N2x_?C%??j??h???)?????C???R????p????R?]?0?J?z.??@s???)<G$<N?O:??Y??Z? aH?a]T&?`~??ҭ?	?O?yg???Sl????
??.??&B?Ѥ?So?;a????!P?H?D???[?Q?2ѱ??Lò?{)L????KU?J??0?:?b????R?A7??????E??????B??&kզ>????????j??	X???2
???(??>;?q"??.'q(8??C$?\?f?S????1rg?<b?*b-^8~?4?T?8(???`?3??L&6????If?(>Ӻ?g?"???#k^Z ?{?ɦ$?M?v$??+??K/??$2?"?=??|`?3N?t]?e'N?8q?i???????N?p?D?e?????$???$i????z???Ь????Y??F??8踾??5ݶ?҄?]A??:5?{?U?hX?4h?;3I???fIX???????N?!?.????Fʳ?Xw????sxى?NoR;?ݺ??i?O+?.?/f????#Op\Z?dڒ??RT??r????????C?̃?&??ݻ??w??s{ss?̜??         L   x?Mǻ?0@??o?(??-0B)???rw???UQ?9?͙b.Ts??v??Y?tit??pL??FW?????     