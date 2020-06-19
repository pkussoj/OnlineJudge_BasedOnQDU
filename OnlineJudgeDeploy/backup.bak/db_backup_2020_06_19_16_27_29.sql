--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE onlinejudge;




--
-- Drop roles
--

DROP ROLE onlinejudge;


--
-- Roles
--

CREATE ROLE onlinejudge;
ALTER ROLE onlinejudge WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md54827417b344ff91a2f608bbad9b4e488';






--
-- Database creation
--

CREATE DATABASE onlinejudge WITH TEMPLATE = template0 OWNER = onlinejudge;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect onlinejudge

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acm_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.acm_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    accepted_number integer NOT NULL,
    total_time integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.acm_contest_rank OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.acm_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acm_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.acm_contest_rank_id_seq OWNED BY public.acm_contest_rank.id;


--
-- Name: announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.announcement OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_id_seq OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.announcement_id_seq OWNED BY public.announcement.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: contest; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    real_time_rank boolean NOT NULL,
    password text,
    rule_type text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL,
    allowed_ip_ranges jsonb NOT NULL
);


ALTER TABLE public.contest OWNER TO onlinejudge;

--
-- Name: contest_announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest_announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    contest_id integer NOT NULL,
    created_by_id integer NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.contest_announcement OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_announcement_id_seq OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_announcement_id_seq OWNED BY public.contest_announcement.id;


--
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_id_seq OWNER TO onlinejudge;

--
-- Name: contest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_id_seq OWNED BY public.contest.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_dramatiq_task; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_dramatiq_task (
    id uuid NOT NULL,
    status character varying(8) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    message_data bytea NOT NULL
);


ALTER TABLE public.django_dramatiq_task OWNER TO onlinejudge;

--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO onlinejudge;

--
-- Name: judge_server; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.judge_server (
    id integer NOT NULL,
    hostname text NOT NULL,
    ip text,
    judger_version text NOT NULL,
    cpu_core integer NOT NULL,
    memory_usage double precision NOT NULL,
    cpu_usage double precision NOT NULL,
    last_heartbeat timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    task_number integer NOT NULL,
    service_url text,
    is_disabled boolean NOT NULL
);


ALTER TABLE public.judge_server OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.judge_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.judge_server_id_seq OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.judge_server_id_seq OWNED BY public.judge_server.id;


--
-- Name: oi_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.oi_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    total_score integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oi_contest_rank OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.oi_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oi_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.oi_contest_rank_id_seq OWNED BY public.oi_contest_rank.id;


--
-- Name: options_sysoptions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.options_sysoptions (
    id integer NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE public.options_sysoptions OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.options_sysoptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_sysoptions_id_seq OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.options_sysoptions_id_seq OWNED BY public.options_sysoptions.id;


--
-- Name: problem; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    input_description text NOT NULL,
    output_description text NOT NULL,
    samples jsonb NOT NULL,
    test_case_id text NOT NULL,
    test_case_score jsonb NOT NULL,
    hint text,
    languages jsonb NOT NULL,
    template jsonb NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone,
    time_limit integer NOT NULL,
    memory_limit integer NOT NULL,
    spj boolean NOT NULL,
    spj_language text,
    spj_code text,
    spj_version text,
    rule_type text NOT NULL,
    visible boolean NOT NULL,
    difficulty text NOT NULL,
    source text,
    submission_number bigint NOT NULL,
    accepted_number bigint NOT NULL,
    created_by_id integer NOT NULL,
    _id text NOT NULL,
    statistic_info jsonb NOT NULL,
    total_score integer NOT NULL,
    contest_id integer,
    is_public boolean NOT NULL,
    spj_compile_ok boolean NOT NULL,
    io_mode jsonb NOT NULL,
    share_submission boolean NOT NULL
);


ALTER TABLE public.problem OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_id_seq OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_id_seq OWNED BY public.problem.id;


--
-- Name: problem_tag; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tag (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.problem_tag OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tag_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tag_id_seq OWNED BY public.problem_tag.id;


--
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    problemtag_id integer NOT NULL
);


ALTER TABLE public.problem_tags OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tags_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tags_id_seq OWNED BY public.problem_tags.id;


--
-- Name: submission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.submission (
    id text NOT NULL,
    contest_id integer,
    problem_id integer NOT NULL,
    create_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    result integer NOT NULL,
    info jsonb NOT NULL,
    language text NOT NULL,
    shared boolean NOT NULL,
    statistic_info jsonb NOT NULL,
    username text NOT NULL,
    ip text
);


ALTER TABLE public.submission OWNER TO onlinejudge;

--
-- Name: user; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    username text NOT NULL,
    email text,
    create_time timestamp with time zone,
    admin_type text NOT NULL,
    reset_password_token text,
    reset_password_token_expire_time timestamp with time zone,
    auth_token text,
    two_factor_auth boolean NOT NULL,
    tfa_token text,
    open_api boolean NOT NULL,
    open_api_appkey text,
    is_disabled boolean NOT NULL,
    problem_permission text NOT NULL,
    session_keys jsonb NOT NULL
);


ALTER TABLE public."user" OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    acm_problems_status jsonb NOT NULL,
    avatar text NOT NULL,
    blog character varying(200),
    mood text,
    accepted_number integer NOT NULL,
    submission_number integer NOT NULL,
    github text,
    school text,
    major text,
    user_id integer NOT NULL,
    total_score bigint NOT NULL,
    oi_problems_status jsonb NOT NULL,
    real_name text,
    language text
);


ALTER TABLE public.user_profile OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: acm_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.acm_contest_rank_id_seq'::regclass);


--
-- Name: announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement ALTER COLUMN id SET DEFAULT nextval('public.announcement_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: contest id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest ALTER COLUMN id SET DEFAULT nextval('public.contest_id_seq'::regclass);


--
-- Name: contest_announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement ALTER COLUMN id SET DEFAULT nextval('public.contest_announcement_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: judge_server id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server ALTER COLUMN id SET DEFAULT nextval('public.judge_server_id_seq'::regclass);


--
-- Name: oi_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.oi_contest_rank_id_seq'::regclass);


--
-- Name: options_sysoptions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions ALTER COLUMN id SET DEFAULT nextval('public.options_sysoptions_id_seq'::regclass);


--
-- Name: problem id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem ALTER COLUMN id SET DEFAULT nextval('public.problem_id_seq'::regclass);


--
-- Name: problem_tag id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag ALTER COLUMN id SET DEFAULT nextval('public.problem_tag_id_seq'::regclass);


--
-- Name: problem_tags id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags ALTER COLUMN id SET DEFAULT nextval('public.problem_tags_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Data for Name: acm_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.acm_contest_rank (id, submission_number, accepted_number, total_time, submission_info, contest_id, user_id) FROM stdin;
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.announcement (id, title, content, create_time, last_update_time, visible, created_by_id) FROM stdin;
1	欢迎来到北京大学软件与微电子学院OnlineJudge系统	<p>仓库地址：<a href="https://github.com/pkussoj/OnlineJudge_BasedOnQDU" target="_blank">https://github.com/pkussoj/OnlineJudge_BasedOnQDU</a></p><p>基于青岛大学OJ做的二次开发：<a href="https://github.com/QingdaoU/OnlineJudge" target="_blank">https://github.com/QingdaoU/OnlineJudge</a></p><p><br /></p><p>关于题目与难度</p><p>10000-19999简单</p><p>20000-29999中等</p><p>30000-39999困难</p><p>40000-49999历届比赛题</p><p><br /></p><p>关于题目来源，都是网上公开可查可下载的题目，如有侵权请联系我们，我们会尽快删除。</p><p><br /></p><p>有问题请联系管理员：deadknightlsq</p>	2020-06-18 11:44:58.201685+00	2020-06-18 15:05:46.435831+00	t	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add session	3	add_session
10	Can change session	3	change_session
11	Can delete session	3	delete_session
12	Can view session	3	view_session
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add task	5	add_task
18	Can change task	5	change_task
19	Can delete task	5	delete_task
20	Can view task	5	view_task
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add user profile	7	add_userprofile
26	Can change user profile	7	change_userprofile
27	Can delete user profile	7	delete_userprofile
28	Can view user profile	7	view_userprofile
29	Can add announcement	8	add_announcement
30	Can change announcement	8	change_announcement
31	Can delete announcement	8	delete_announcement
32	Can view announcement	8	view_announcement
33	Can add judge server	9	add_judgeserver
34	Can change judge server	9	change_judgeserver
35	Can delete judge server	9	delete_judgeserver
36	Can view judge server	9	view_judgeserver
37	Can add problem	10	add_problem
38	Can change problem	10	change_problem
39	Can delete problem	10	delete_problem
40	Can view problem	10	view_problem
41	Can add problem tag	11	add_problemtag
42	Can change problem tag	11	change_problemtag
43	Can delete problem tag	11	delete_problemtag
44	Can view problem tag	11	view_problemtag
45	Can add acm contest rank	12	add_acmcontestrank
46	Can change acm contest rank	12	change_acmcontestrank
47	Can delete acm contest rank	12	delete_acmcontestrank
48	Can view acm contest rank	12	view_acmcontestrank
49	Can add contest	13	add_contest
50	Can change contest	13	change_contest
51	Can delete contest	13	delete_contest
52	Can view contest	13	view_contest
53	Can add contest announcement	14	add_contestannouncement
54	Can change contest announcement	14	change_contestannouncement
55	Can delete contest announcement	14	delete_contestannouncement
56	Can view contest announcement	14	view_contestannouncement
57	Can add oi contest rank	15	add_oicontestrank
58	Can change oi contest rank	15	change_oicontestrank
59	Can delete oi contest rank	15	delete_oicontestrank
60	Can view oi contest rank	15	view_oicontestrank
61	Can add submission	16	add_submission
62	Can change submission	16	change_submission
63	Can delete submission	16	delete_submission
64	Can view submission	16	view_submission
65	Can add sys options	17	add_sysoptions
66	Can change sys options	17	change_sysoptions
67	Can delete sys options	17	delete_sysoptions
68	Can view sys options	17	view_sysoptions
\.


--
-- Data for Name: contest; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest (id, title, description, real_time_rank, password, rule_type, start_time, end_time, create_time, last_update_time, visible, created_by_id, allowed_ip_ranges) FROM stdin;
\.


--
-- Data for Name: contest_announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest_announcement (id, title, content, create_time, contest_id, created_by_id, visible) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	sessions	session
4	contenttypes	contenttype
5	django_dramatiq	task
6	account	user
7	account	userprofile
8	announcement	announcement
9	conf	judgeserver
10	problem	problem
11	problem	problemtag
12	contest	acmcontestrank
13	contest	contest
14	contest	contestannouncement
15	contest	oicontestrank
16	submission	submission
17	options	sysoptions
\.


--
-- Data for Name: django_dramatiq_task; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_dramatiq_task (id, status, created_at, updated_at, message_data) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	account	0001_initial	2020-06-14 17:10:36.395465+00
2	account	0002_auto_20170209_1028	2020-06-14 17:10:36.440896+00
3	account	0003_userprofile_total_score	2020-06-14 17:10:36.487239+00
4	account	0005_auto_20170830_1154	2020-06-14 17:10:36.543028+00
5	account	0006_user_session_keys	2020-06-14 17:10:36.596646+00
6	account	0008_auto_20171011_1214	2020-06-14 17:10:36.816378+00
7	account	0009_auto_20171125_1514	2020-06-14 17:10:36.823056+00
8	account	0010_auto_20180501_0436	2020-06-14 17:10:36.86284+00
9	account	0011_auto_20180501_0456	2020-06-14 17:10:36.868901+00
10	account	0012_userprofile_language	2020-06-14 17:10:36.874244+00
11	announcement	0001_initial	2020-06-14 17:10:36.892557+00
12	announcement	0002_auto_20171011_1214	2020-06-14 17:10:36.904177+00
13	announcement	0003_auto_20180501_0436	2020-06-14 17:10:36.911495+00
14	contenttypes	0001_initial	2020-06-14 17:10:36.927139+00
15	contenttypes	0002_remove_content_type_name	2020-06-14 17:10:36.938566+00
16	auth	0001_initial	2020-06-14 17:10:36.996996+00
17	auth	0002_alter_permission_name_max_length	2020-06-14 17:10:37.003292+00
18	auth	0003_alter_user_email_max_length	2020-06-14 17:10:37.008969+00
19	auth	0004_alter_user_username_opts	2020-06-14 17:10:37.014715+00
20	auth	0005_alter_user_last_login_null	2020-06-14 17:10:37.020305+00
21	auth	0006_require_contenttypes_0002	2020-06-14 17:10:37.022173+00
22	auth	0007_alter_validators_add_error_messages	2020-06-14 17:10:37.027688+00
23	auth	0008_alter_user_username_max_length	2020-06-14 17:10:37.033181+00
24	auth	0009_alter_user_last_name_max_length	2020-06-14 17:10:37.038643+00
25	conf	0001_initial	2020-06-14 17:10:37.072865+00
26	conf	0002_auto_20171011_1214	2020-06-14 17:10:37.11494+00
27	conf	0003_judgeserver_is_disabled	2020-06-14 17:10:37.135683+00
28	conf	0004_auto_20180501_0436	2020-06-14 17:10:37.152418+00
29	problem	0001_initial	2020-06-14 17:10:37.200656+00
30	contest	0001_initial	2020-06-14 17:10:37.36089+00
31	contest	0002_auto_20170209_0845	2020-06-14 17:10:37.421185+00
32	contest	0003_auto_20170217_0820	2020-06-14 17:10:37.483145+00
33	contest	0004_auto_20170717_1324	2020-06-14 17:10:37.502873+00
34	contest	0005_auto_20170823_0918	2020-06-14 17:10:37.533625+00
35	contest	0006_auto_20171011_1214	2020-06-14 17:10:37.592826+00
36	contest	0007_contestannouncement_visible	2020-06-14 17:10:37.617597+00
37	contest	0008_contest_allowed_ip_ranges	2020-06-14 17:10:37.639699+00
38	contest	0009_auto_20180501_0436	2020-06-14 17:10:37.678735+00
39	contest	0010_auto_20190326_0201	2020-06-14 17:10:37.704502+00
40	django_dramatiq	0001_initial	2020-06-14 17:10:37.723165+00
41	options	0001_initial	2020-06-14 17:10:37.743867+00
42	options	0002_auto_20180501_0436	2020-06-14 17:10:37.75041+00
43	options	0003_migrate_languages_options	2020-06-14 17:10:37.753571+00
44	submission	0001_initial	2020-06-14 17:10:37.77903+00
45	submission	0002_auto_20170509_1203	2020-06-14 17:10:37.79393+00
46	submission	0005_submission_username	2020-06-14 17:10:37.834395+00
47	submission	0006_auto_20170830_1154	2020-06-14 17:10:37.844561+00
48	submission	0007_auto_20170923_1318	2020-06-14 17:10:37.97716+00
49	submission	0008_submission_ip	2020-06-14 17:10:37.989618+00
50	submission	0009_delete_user_output	2020-06-14 17:10:38.006879+00
51	problem	0002_problem__id	2020-06-14 17:10:38.038555+00
52	problem	0003_auto_20170217_0820	2020-06-14 17:10:38.13227+00
53	problem	0004_auto_20170501_0637	2020-06-14 17:10:38.260102+00
54	problem	0005_auto_20170815_1258	2020-06-14 17:10:38.320351+00
55	problem	0006_auto_20170823_0918	2020-06-14 17:10:38.419342+00
56	problem	0008_auto_20170923_1318	2020-06-14 17:10:38.620989+00
57	problem	0009_auto_20171011_1214	2020-06-14 17:10:38.8154+00
58	problem	0010_problem_spj_compile_ok	2020-06-14 17:10:38.86679+00
59	problem	0011_fix_problem_ac_count	2020-06-14 17:10:38.886508+00
60	problem	0012_auto_20180501_0436	2020-06-14 17:10:39.025827+00
61	problem	0013_problem_io_mode	2020-06-14 17:10:39.061115+00
62	problem	0014_problem_share_submission	2020-06-14 17:10:39.092579+00
63	sessions	0001_initial	2020-06-14 17:10:39.112455+00
64	submission	0011_fix_submission_number	2020-06-14 17:10:39.13289+00
65	submission	0012_auto_20180501_0436	2020-06-14 17:10:39.174945+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: judge_server; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.judge_server (id, hostname, ip, judger_version, cpu_core, memory_usage, cpu_usage, last_heartbeat, create_time, task_number, service_url, is_disabled) FROM stdin;
2	b5691518c34e	172.18.0.3	2.1.1	4	17	100	2020-06-19 08:27:28.715426+00	2020-06-18 09:25:47.681011+00	0	http://judge-server:8080	f
1	58016c82d5a9	172.18.0.2	2.1.1	4	17	0	2020-06-17 03:25:34.977575+00	2020-06-14 17:10:45.24302+00	0	http://judge-server:8080	f
\.


--
-- Data for Name: oi_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.oi_contest_rank (id, submission_number, total_score, submission_info, contest_id, user_id) FROM stdin;
\.


--
-- Data for Name: options_sysoptions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.options_sysoptions (id, key, value) FROM stdin;
7	smtp_config	{}
9	throttling	{"ip": {"capacity": 100, "fill_rate": 0.1, "default_capacity": 50}, "user": {"capacity": 20, "fill_rate": 0.03, "default_capacity": 10}}
10	languages	[{"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.c", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}}, "name": "C", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.c", "max_memory": 268435456, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <stdio.h>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  printf(\\"%d\\", add(1, 2));\\n  return 0;\\n}\\n//APPEND END"}, "description": "GCC 5.4", "content_type": "text/x-csrc"}, {"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}}, "name": "C++", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <iostream>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  std::cout << add(1, 2);\\n  return 0;\\n}\\n//APPEND END"}, "description": "G++ 5.4", "content_type": "text/x-c++src"}, {"name": "Java", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/java -cp {exe_dir} -XX:MaxRAM={max_memory}k -Djava.security.manager -Dfile.encoding=UTF-8 -Djava.security.policy==/etc/java_policy -Djava.awt.headless=true Main", "seccomp_rule": null, "memory_limit_check_only": 1}, "compile": {"exe_name": "Main", "src_name": "Main.java", "max_memory": -1, "max_cpu_time": 5000, "max_real_time": 10000, "compile_command": "/usr/bin/javac {src_path} -d {exe_dir} -encoding UTF8"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "OpenJDK 1.8", "content_type": "text/x-java"}, {"name": "Python2", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/python {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "solution.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 2.7", "content_type": "text/x-python"}, {"name": "Python3", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8", "PYTHONIOENCODING=utf-8"], "command": "/usr/bin/python3 {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "__pycache__/solution.cpython-35.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python3 -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 3.5", "content_type": "text/x-python"}]
8	judge_server_token	"CHANGE_THIS"
1	website_base_url	"http://127.0.0.1"
2	website_name	"PSOJ"
3	website_name_shortcut	"PKUSSOJ"
4	website_footer	"北京大学软件与微电子学院实验班OnlineJudge"
5	allow_register	true
6	submission_list_show_all	true
\.


--
-- Data for Name: problem; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem (id, title, description, input_description, output_description, samples, test_case_id, test_case_score, hint, languages, template, create_time, last_update_time, time_limit, memory_limit, spj, spj_language, spj_code, spj_version, rule_type, visible, difficulty, source, submission_number, accepted_number, created_by_id, _id, statistic_info, total_score, contest_id, is_public, spj_compile_ok, io_mode, share_submission) FROM stdin;
1	A+B Problem	<p>Calculate a+b<br /></p>	<p>Two integer a,b (0&lt;=a,b&lt;=10)<br /></p>	<p>Output a+b<br /></p>	[{"input": "1 2", "output": "3"}]	894a89b17ea3a7acd7873bfc9c5df6b2	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Java", "Python2", "Python3"]	{"C": "//PREPEND BEGIN\\n#include <stdio.h>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  int a, b;\\n  scanf(\\"%d %d\\", &a, &b);\\n  printf(\\"%d\\", add(a, b));\\n  return 0;\\n}\\n//APPEND END"}	2020-06-14 17:27:50.776239+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low		36	12	1	0	{"0": 12, "-1": 2, "-2": 22}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
18	friend-斐波那契	<p><img alt="微信截图_20200618202220.png" src="/public/upload/78cbb8ac50.png" width="1020" height="130" /><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个数n。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个数，代表答案。</span><br /></p>	[{"input": "6", "output": "104"}]	b7a459abc729b06d1f4625d4f6a807f5	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>数据输入范围提示：</p><p><img alt="微信截图_20200618202322.png" src="/public/upload/c28072b367.png" width="585" height="117" /><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 12:26:02.097082+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10025	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
19	序列计数	<p>Alice 想要得到一个长度为n的序列，序列中的数都是不超过m的正整数，而且这n个数的和是p的倍数。</p><p>Alice 还希望，这n个数中，至少有一个数是质数。</p><p>Alice 想知道，有多少个序列满足她的要求。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行三个数n</span><span style="color: rgba(0, 0, 0, 0.87);">、m</span><span style="color: rgba(0, 0, 0, 0.87);">和p</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个数，满足 Alice 要求的序列的数量。</span></p><p><span style="color: rgba(0, 0, 0, 0.87);">由于满足条件的序列可能很多，输出结果对20170408</span><span style="color: rgba(0, 0, 0, 0.87);">取模。</span></p>	[{"input": "3 5 3", "output": "33"}]	c169cab98f6f17e63d832c0a09d9d66d	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p><img alt="微信截图_20200618203539.png" src="/public/upload/bb9e383e8a.png" width="528" height="117" /><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 12:37:55.719555+00	\N	2000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10026	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
31	多项式乘法	<p><span style="color: rgba(0, 0, 0, 0.87);">输入两个多项式，输出这两个多项式的乘积。</span><br /></p>	<p style="margin-left: 0px;">第一行两个整数n和m，分别表示两个多项式的次数。</p><p>第二行n+1个整数，分别表示第一个多项式的0到n次项前的系数。</p><p>第三行个m+1整数，分别表示第二个多项式的0到m次项前的系数。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行n+m+1</span><span style="color: rgba(0, 0, 0, 0.87);">个整数，分别表示乘起来后的多项式的0</span><span style="color: rgba(0, 0, 0, 0.87);">到n+m</span><span style="color: rgba(0, 0, 0, 0.87);">次项前的系数。</span><br /></p>	[{"input": "1 2\\n1 2\\n1 2 1", "output": "1 4 5 2"}]	e893c7bf8ce1416237198a29e1b055c4	[{"score": 5, "input_name": "1.in", "output_name": "1.out"}, {"score": 5, "input_name": "2.in", "output_name": "2.out"}, {"score": 5, "input_name": "3.in", "output_name": "3.out"}, {"score": 5, "input_name": "4.in", "output_name": "4.out"}, {"score": 5, "input_name": "5.in", "output_name": "5.out"}, {"score": 5, "input_name": "6.in", "output_name": "6.out"}, {"score": 5, "input_name": "7.in", "output_name": "7.out"}, {"score": 5, "input_name": "8.in", "output_name": "8.out"}, {"score": 5, "input_name": "9.in", "output_name": "9.out"}, {"score": 5, "input_name": "10.in", "output_name": "10.out"}, {"score": 5, "input_name": "11.in", "output_name": "11.out"}, {"score": 5, "input_name": "12.in", "output_name": "12.out"}, {"score": 5, "input_name": "13.in", "output_name": "13.out"}, {"score": 5, "input_name": "14.in", "output_name": "14.out"}, {"score": 5, "input_name": "15.in", "output_name": "15.out"}, {"score": 5, "input_name": "16.in", "output_name": "16.out"}, {"score": 5, "input_name": "17.in", "output_name": "17.out"}, {"score": 5, "input_name": "18.in", "output_name": "18.out"}, {"score": 5, "input_name": "19.in", "output_name": "19.out"}, {"score": 5, "input_name": "20.in", "output_name": "20.out"}]	<p>n,m属于[1,10^5],且保证输入中的系数大于等于0且小于等于9。</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 03:55:57.117037+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	9	10046	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
14	两数之和	<p>给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。<br /></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。</p><p>给定 nums = 2,7,11,15  target = 9</p><p>因为 nums[0] + nums[1] = 2 + 7 = 9</p><p>所以返回 0,1</p>	<p><span style="color: rgb(51, 51, 51);">整数数组和目标值，分割符为英文逗号和空格  2<span style="color: rgb(51, 51, 51);">,</span>7<span style="color: rgb(51, 51, 51);">,</span>11,15 9</span><br /></p>	<p><span style="color: rgb(51, 51, 51);">整数数组，<span style="color: rgb(51, 51, 51);">分割符为英文逗号</span>0,1</span><br /></p>	[{"input": "2,7,11,15 9", "output": "0,1"}]	162242797806854e56f118751866f31e	[{"score": 5, "input_name": "1.in", "output_name": "1.out"}, {"score": 5, "input_name": "2.in", "output_name": "2.out"}, {"score": 5, "input_name": "3.in", "output_name": "3.out"}, {"score": 5, "input_name": "4.in", "output_name": "4.out"}, {"score": 5, "input_name": "5.in", "output_name": "5.out"}, {"score": 5, "input_name": "6.in", "output_name": "6.out"}, {"score": 5, "input_name": "7.in", "output_name": "7.out"}, {"score": 5, "input_name": "8.in", "output_name": "8.out"}, {"score": 5, "input_name": "9.in", "output_name": "9.out"}, {"score": 5, "input_name": "10.in", "output_name": "10.out"}, {"score": 5, "input_name": "11.in", "output_name": "11.out"}, {"score": 5, "input_name": "12.in", "output_name": "12.out"}, {"score": 5, "input_name": "13.in", "output_name": "13.out"}, {"score": 5, "input_name": "14.in", "output_name": "14.out"}, {"score": 5, "input_name": "15.in", "output_name": "15.out"}, {"score": 5, "input_name": "16.in", "output_name": "16.out"}, {"score": 5, "input_name": "17.in", "output_name": "17.out"}, {"score": 5, "input_name": "18.in", "output_name": "18.out"}, {"score": 5, "input_name": "19.in", "output_name": "19.out"}, {"score": 5, "input_name": "20.in", "output_name": "20.out"}, {"score": 5, "input_name": "21.in", "output_name": "21.out"}]		["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 10:33:38.119576+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	力扣（LeetCode）	1	1	3	10021	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
15	最长公共子串	<p><span style="color: rgba(0, 0, 0, 0.87);">给定n</span><span style="color: rgba(0, 0, 0, 0.87);">个字符串，试求出这些字符串的最长公共子串。</span><br /></p>	<p>第一行一个整数n。</p><p>下面第2到n+1行，每行一个字符串。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">仅一行，包含一个正整数，表示n</span><span style="color: rgba(0, 0, 0, 0.87);">个字符串的最长公共子串长度。</span><br /></p>	[{"input": "2\\nababc\\ncbaab", "output": "2"}]	13042d537dce369a0ee3425c79f3d19c	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p><img alt="EDI{)_UT)_EYRC6PR(%MV%B.png" src="/public/upload/3f652a6f4a.png" width="501" height="75" /><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 10:49:16.271344+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10022	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
16	找相同子串	<p><span style="color: rgba(0, 0, 0, 0.87);">给定两个字符串，在两个字符串中各取出一个子串使得这两个子串相同,请找出这种情况的方案数。两个方案不同的定义是，当且仅当这两个子串中有一个字串位置不同。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">两行，两个字符串s1 s2</span><span style="color: rgba(0, 0, 0, 0.87);">，长度分别为n1 n2</span><span style="color: rgba(0, 0, 0, 0.87);">。字符串中只有小写字母。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输出一个数值为方案数的整数表示答案</span><br /></p>	[{"input": "aabb\\nbbaa", "output": "10"}]	54dbe4826906d4489f3c631fec3c713a	[{"score": 5, "input_name": "1.in", "output_name": "1.out"}, {"score": 5, "input_name": "2.in", "output_name": "2.out"}, {"score": 5, "input_name": "3.in", "output_name": "3.out"}, {"score": 5, "input_name": "4.in", "output_name": "4.out"}, {"score": 5, "input_name": "5.in", "output_name": "5.out"}, {"score": 5, "input_name": "6.in", "output_name": "6.out"}, {"score": 5, "input_name": "7.in", "output_name": "7.out"}, {"score": 5, "input_name": "8.in", "output_name": "8.out"}, {"score": 5, "input_name": "9.in", "output_name": "9.out"}, {"score": 5, "input_name": "10.in", "output_name": "10.out"}, {"score": 5, "input_name": "11.in", "output_name": "11.out"}, {"score": 5, "input_name": "12.in", "output_name": "12.out"}, {"score": 5, "input_name": "13.in", "output_name": "13.out"}, {"score": 5, "input_name": "14.in", "output_name": "14.out"}, {"score": 5, "input_name": "15.in", "output_name": "15.out"}, {"score": 5, "input_name": "16.in", "output_name": "16.out"}, {"score": 5, "input_name": "17.in", "output_name": "17.out"}, {"score": 5, "input_name": "18.in", "output_name": "18.out"}, {"score": 5, "input_name": "19.in", "output_name": "19.out"}, {"score": 5, "input_name": "20.in", "output_name": "20.out"}]	<p>数据范围提示：</p><p>1&lt;=n1,n2&lt;=200000</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 11:06:53.149142+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10023	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
17	质数判定	<p><span style="color: rgba(0, 0, 0, 0.87);">判定输入的数是不是质数。</span><br /></p>	<p>若干行，一行一个数x。</p><p>行数不超过10的5次方。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">对于输入的每一行x，如果</span><span style="color: rgba(0, 0, 0, 0.87);">是质数输出一行</span><code>Y</code><span style="color: rgba(0, 0, 0, 0.87);">，否则输出一行</span><code>N</code><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	[{"input": "1\\n2\\n6\\n9\\n666623333", "output": "N\\nY\\nN\\nN\\nY"}]	1b5ca67e28546b4ed473714d6fa261a5	[{"score": 6, "input_name": "1.in", "output_name": "1.out"}, {"score": 6, "input_name": "2.in", "output_name": "2.out"}, {"score": 6, "input_name": "3.in", "output_name": "3.out"}, {"score": 6, "input_name": "4.in", "output_name": "4.out"}, {"score": 6, "input_name": "5.in", "output_name": "5.out"}, {"score": 6, "input_name": "6.in", "output_name": "6.out"}, {"score": 6, "input_name": "7.in", "output_name": "7.out"}, {"score": 6, "input_name": "8.in", "output_name": "8.out"}, {"score": 6, "input_name": "9.in", "output_name": "9.out"}, {"score": 6, "input_name": "10.in", "output_name": "10.out"}, {"score": 6, "input_name": "11.in", "output_name": "11.out"}, {"score": 6, "input_name": "12.in", "output_name": "12.out"}, {"score": 6, "input_name": "13.in", "output_name": "13.out"}, {"score": 6, "input_name": "14.in", "output_name": "14.out"}, {"score": 6, "input_name": "15.in", "output_name": "15.out"}, {"score": 6, "input_name": "16.in", "output_name": "16.out"}, {"score": 6, "input_name": "17.in", "output_name": "17.out"}, {"score": 6, "input_name": "18.in", "output_name": "18.out"}]	<p>数据范围提示：</p><p>1&lt;=x&lt;=10的18次方</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 12:15:15.754461+00	\N	5000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10024	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
20	密钥破解	<p><img alt="微信截图_20200618212032.png" src="/public/upload/f9866c0814.png" width="1222" height="490" /><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输入文件内容只有一行，为空格分隔的三个正整数e,N,c</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输出文件内容只有一行，为空格分隔的两个整数d,n</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	[{"input": "3 187 45", "output": "107 12"}]	85101555c863184430076c92a85ddaab	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>例子样例中p=11,q=17</p><p><img alt="微信截图_20200618212232.png" src="/public/upload/5e532b0647.png" width="357" height="52" /><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 13:24:51.859768+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	3	10027	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
21	矩阵乘法	<p><span style="color: rgba(0, 0, 0, 0.87);">分别给定nxp</span><span style="color: rgba(0, 0, 0, 0.87);">和pxm</span><span style="color: rgba(0, 0, 0, 0.87);">的两个矩阵A</span><span style="color: rgba(0, 0, 0, 0.87);">和B</span><span style="color: rgba(0, 0, 0, 0.87);">，求AxB</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">第一行三个正整数n</span><span style="color: rgba(0, 0, 0, 0.87);">、p</span><span style="color: rgba(0, 0, 0, 0.87);">、m</span><span style="color: rgba(0, 0, 0, 0.87);">，表示矩阵的长宽。</span></p><p><span style="color: rgba(0, 0, 0, 0.87);">之后的n</span><span style="color: rgba(0, 0, 0, 0.87);">行，每行p</span><span style="color: rgba(0, 0, 0, 0.87);">个整数，表示矩阵A</span><span style="color: rgba(0, 0, 0, 0.87);">。</span></p><p><span style="color: rgba(0, 0, 0, 0.87);">之后的p</span><span style="color: rgba(0, 0, 0, 0.87);">行，每行m</span><span style="color: rgba(0, 0, 0, 0.87);">个整数，表示矩阵B</span><span style="color: rgba(0, 0, 0, 0.87);">。</span></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输出n</span><span style="color: rgba(0, 0, 0, 0.87);">行，每行m</span><span style="color: rgba(0, 0, 0, 0.87);">个整数，表示矩阵AxB</span><span style="color: rgba(0, 0, 0, 0.87);">，每个数模“10的9次方加7”</span><span style="color: rgba(0, 0, 0, 0.87);">输出。</span><br /></p>	[{"input": "3 4 5\\n-2 -8 -9 8\\n-10 0 6 -8\\n-10 -6 6 9\\n4 -7 5 -5 9\\n10 -2 -10 5 5\\n-3 -7 -3 8 -2\\n-6 7 7 3 -2", "output": "999999898 149 153 999999929 999999951\\n999999997 999999979 999999883 74 999999921\\n999999835 103 55 95 999999857"}]	eb3fe820d3ea71a62114b96e8b7eb619	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<h4>数据范围与提示：</h4><p><img alt="微信截图_20200618213558.png" src="/public/upload/35bda32ea4.png" width="371" height="39" /><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 13:41:22.773297+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	3	1	3	10028	{"0": 1, "-1": 2}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
22	647的养牛之路	<p><span style="color: rgba(0, 0, 0, 0.87);">647出去创业赚够了足够多的钱，后来却选择去山沟沟里养牛。一只刚出生的奶牛需要养殖4年开始生的一头奶牛（假设只生母牛），以后每年生一只。647想要设计一个程序，输入</span><span style="color: rgba(0, 0, 0, 0.87);">n</span><span style="color: rgba(0, 0, 0, 0.87);">年，可以有多少头奶牛。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一个整数</span><span style="color: rgba(0, 0, 0, 0.87);">n</span><span style="color: rgba(0, 0, 0, 0.87);">，表示</span><span style="color: rgba(0, 0, 0, 0.87);">n</span><span style="color: rgba(0, 0, 0, 0.87);">年之后。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一个整数</span><span style="color: rgba(0, 0, 0, 0.87);">m</span><span style="color: rgba(0, 0, 0, 0.87);">，表示</span><span style="color: rgba(0, 0, 0, 0.87);">n</span><span style="color: rgba(0, 0, 0, 0.87);">年后奶牛数量</span><br /></p>	[{"input": "13", "output": "36"}]	5fb86f61fac5f2abb6c30b93367f1e67	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>对于30%的数据，n≤20n</p><p>对于50%的数据，n≤30n</p><p>对于70%的数据，n≤40n</p><p>对于100%的数据，n≤70n</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 15:20:27.086396+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	SYZOJ	2	2	1	10051	{"0": 2}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
23	高精度加法	<p><span style="color: rgba(0, 0, 0, 0.87);">现在要求输入</span><span style="color: rgba(0, 0, 0, 0.87);">2</span><span style="color: rgba(0, 0, 0, 0.87);">个正整数数</span><span style="color: rgba(0, 0, 0, 0.87);">a</span><span style="color: rgba(0, 0, 0, 0.87);">,</span><span style="color: rgba(0, 0, 0, 0.87);">b</span><span style="color: rgba(0, 0, 0, 0.87);">输出</span><span style="color: rgba(0, 0, 0, 0.87);">a+b</span><span style="color: rgba(0, 0, 0, 0.87);">的结果</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">两个正整数数</span><span style="color: rgba(0, 0, 0, 0.87);">a</span><span style="color: rgba(0, 0, 0, 0.87);">,</span><span style="color: rgba(0, 0, 0, 0.87);">b</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一个数，</span><span style="color: rgba(0, 0, 0, 0.87);">a+b</span><span style="color: rgba(0, 0, 0, 0.87);">的结果 注意数字开头不要有多余的</span><span style="color: rgba(0, 0, 0, 0.87);">0</span><br /></p>	[{"input": "3 4", "output": "7"}]	3d6fa55c1d69b305b3eb78cce3a6a1db	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>b1&lt;=a,b的位数&lt;=500 &lt;= 500&lt;=500</p><p>保证输入的数字开头不为000</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 15:36:01.643406+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low		3	2	1	10052	{"0": 2, "-1": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
24	高精度乘法	<p><span style="color: rgba(0, 0, 0, 0.87);">输入a,b。输出a*b的结果</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行两个数a,b</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个整数，a*b的结果</span><br /></p>	[{"input": "2 3", "output": "6"}]	e53f728bf2974be748b5cb7eb6f56a55	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>a,b两数的位数不超过500位</p><p>保证输入的两数开头第一位不是0</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-18 16:18:00.231143+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low		1	1	1	10053	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
25	最佳观光组合	<p>给定正整数数组 A，A[i] 表示第 i 个观光景点的评分，并且两个景点 i 和 j 之间的距离为 j - i。</p><p>一对景点（i &lt; j）组成的观光组合的得分为（A[i] + A[j] + i - j）：景点的评分之和减去它们两者之间的距离。</p><p>返回一对观光景点能取得的最高分。</p>	<p>正整数数组A</p><pre><br /></pre>	<pre>一对观光景点能取得的最高分。即max（A[i] + A[j] + i - j）</pre>	[{"input": "[8,1,5,2,6]", "output": "11"}]	edd1fc97cb061abd8d6076b3ed739ab8	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]	<pre>i = 0, j = 2, <code style="font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; color: inherit; background-color: transparent; padding: 0px; border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; tab-size: 4;">A[i] + A[j] + i - j = 8 + 5 + 0 - 2 = 11</code></pre>	["C", "C++", "Java", "Python2", "Python3"]	{"C": "//PREPEND BEGIN\\n#include <stdio.h>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint maxScoreSightseeingPair(int* A, int ASize){\\n  // Please fill this area\\n\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  int A[5]={8,1,5,2,6};\\n  int ASize=5;\\n  printf(\\"%d\\", maxScoreSightseeingPair(int* A, int ASize));\\n  return 0;\\n}\\n//APPEND END", "C++": "//PREPEND BEGIN\\n#include <iostream>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint maxScoreSightseeingPair(vector<int>& A){\\n   // Please fill this area\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  vector<int> A[5]={8,1,5,2,6};\\n  std::cout <<maxScoreSightseeingPair(vector<int>& A);\\n  return 0;\\n}\\n//APPEND END", "Java": "//PREPEND BEGIN\\n//PREPEND END\\nclass Solution {\\n  //TEMPLATE BEGIN\\n    public int maxScoreSightseeingPair(int[] A) {\\n      // Please fill this area\\n\\n    }\\n  //TEMPLATE END\\n  //APPEND BEGIN\\n   public static void main() {\\n        int A[5]={8,1,5,2,6};\\n        System.out.println(\\"%d\\",maxScoreSightseeingPair(int[] A));\\n    }\\n  //APPEND END\\n}", "Python2": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END", "Python3": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}	2020-06-19 01:36:32.332067+00	\N	200	256	f	\N	\N	\N	OI	t	Mid	来源：力扣（LeetCode）  链接：https://leetcode-cn.com/problems/best-sightseeing-pair	0	0	9	3	{}	100	\N	f	f	{"input": "1.in", "output": "1.out", "io_mode": "Standard IO"}	t
29	回文数	<p><span style="color: rgb(38, 38, 38);">判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。</span><br /></p>	<p>输入一串数字</p>	<p><span style="color: rgb(38, 38, 38);">判断这串数字正序（从左向右）和倒序（从右向左）读是否都是一样的整数，是回文数则返回true，不是则返回false</span><br /></p>	[{"input": "121", "output": "true"}, {"input": "-121", "output": "false"}]	278f55f0b87c8151c5e75286894c3540	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]	<pre>从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。</pre>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 03:35:25.996772+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	力扣	2	0	9	10044	{"-2": 2}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
26	Guess Data	<p>给你一个提示，请猜测对应的日期。假设日期用中的一个整数表示。</p><p>在任意一个数据点输出都可以得到一定的同情分。</p>	<p>第一行一个整数，表示日期的范围是。</p><p>第二行一个字符串，为一个关于日期的 Python 表达式，表示给出的提示。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">对于每个测试点，请将对应答案写入</span><code>date#.usr</code><span style="color: rgba(0, 0, 0, 0.87);">中，并填入网页下方提交答案处，或者以 zip 压缩包形式上传。</span><br /></p>	[{"input": "10\\nabs(x - 7) == 4", "output": "3"}]	b3ed0ffa4a76a8b689dc1069dd374f1d	[{"score": 20, "input_name": "1.in", "output_name": "1.out"}, {"score": 20, "input_name": "2.in", "output_name": "2.out"}, {"score": 20, "input_name": "3.in", "output_name": "3.out"}, {"score": 20, "input_name": "4.in", "output_name": "4.out"}, {"score": 20, "input_name": "5.in", "output_name": "5.out"}]	<p>本题中给出的 Python 表达式与 C++ 语义相同。表达式中<code>x</code>是一个整型变量，当<code>x</code>为正确答案时，表达式求值为<code>True</code>；否则为<code>False</code>。保证答案惟一。</p><p>注：</p><ul><li>Python 中<code>a ** b</code>表示计算。</li><li><code>pi</code>的值为；三角函数使用弧度制。</li><li>给出的表达式可以直接在 Python 中<code>from math import *</code>后求值。</li><li>本题的测试数据中，<code>in</code>文件是输出可得的分数百分比；<code>out</code>文件是正确日期。在上传提交答案类题目时，如果 Special Judge 不需要<code>in</code>/<code>out</code>文件，可在<code>data.yml</code>中对应省略<code>inputFile</code>/<code>outputFile</code>项。</li><li>不保证答案是一个公历日期。</li></ul>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 02:17:31.256004+00	\N	1000	256	f	\N	\N	\N	OI	t	Low	LibreOJ	1	0	9	10041	{"-2": 1}	100	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
27	后缀排序	<p><span style="color: rgba(0, 0, 0, 0.87);">读入一个长度为</span><span style="color: rgba(0, 0, 0, 0.87);">的由大小写英文字母或数字组成的字符串，请把这个字符串的所有非空后缀按字典序从小到大排序，然后按顺序输出后缀的第一个字符在原串中的位置。位置编号为1</span><span style="color: rgba(0, 0, 0, 0.87);">到n</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个长度为</span><span style="color: rgba(0, 0, 0, 0.87);">的仅包含大小写英文字母或数字的字符串。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">第一行n</span><span style="color: rgba(0, 0, 0, 0.87);">个整数，第i</span><span style="color: rgba(0, 0, 0, 0.87);">个整数为SA[i]</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	[{"input": "ababa", "output": "5 3 1 4 2"}]	9c95f5387eed1e07111b3d417d88250f	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>1&lt;=n&lt;=10^6</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 02:25:33.572636+00	\N	4000	512	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	9	10042	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
36	反素数	<p>如果一个大于等于1的正整数n，满足所有小于n且大于等于1的所有正整数的约数个数都小于n的约数个数，则n是一个反素数。譬如：1,2,4,6,12,24，它们都是反素数。</p><p>请你计算不大于n的最大反素数。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个正整数n</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">只包含一个整数，即不大于n</span><span style="color: rgba(0, 0, 0, 0.87);">的最大反素数。</span><br /></p>	[{"input": "1000", "output": "840"}]	bc4b1580b6256024f7dcb60a8c1d2bb0	[{"score": 13, "input_name": "1.in", "output_name": "1.out"}, {"score": 13, "input_name": "2.in", "output_name": "2.out"}, {"score": 13, "input_name": "3.in", "output_name": "3.out"}, {"score": 13, "input_name": "4.in", "output_name": "4.out"}, {"score": 13, "input_name": "5.in", "output_name": "5.out"}, {"score": 13, "input_name": "6.in", "output_name": "6.out"}, {"score": 13, "input_name": "7.in", "output_name": "7.out"}, {"score": 13, "input_name": "8.in", "output_name": "8.out"}]	<p>1&lt;=n&lt;=2*10^9</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 06:07:33.708934+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	9	10050	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
35	质因数分解	<p><span style="color: rgba(0, 0, 0, 0.87);">已知正整数n</span><span style="color: rgba(0, 0, 0, 0.87);">是两个不同的质数的乘积，试求出较大的那个质数。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输入只有一行，包含一个正整数n</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输出只有一行，包含一个正整数p</span><span style="color: rgba(0, 0, 0, 0.87);">，即较大的那个质数。</span><br /></p>	[{"input": "21", "output": "7"}]	382aa9ac1fa76f5fa877bd79b992bf76	[{"score": 20, "input_name": "1.in", "output_name": "1.out"}, {"score": 20, "input_name": "2.in", "output_name": "2.out"}, {"score": 20, "input_name": "3.in", "output_name": "3.out"}, {"score": 20, "input_name": "4.in", "output_name": "4.out"}, {"score": 20, "input_name": "5.in", "output_name": "5.out"}]	<p>6&lt;=n&lt;=2*10^9</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 06:01:32.420301+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	9	10049	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
33	Lyndon分解	<p>读入一个由大小写英文字母或数字组成的字符串s，请把这个字符串分成若干部分s=s1s2s3s4s5.......sm，使得每个s i都是<a href="https://en.wikipedia.org/wiki/Lyndon_word" target="_blank">Lyndon Word</a>，且满足对于所有1&lt;=i&lt;n，都有s i&gt;s i+1。输出s1到sm这些串长度的右端点的位置。位置编号为1到n。</p><p>一个字符串是一个 Lyndon Word 表示s是其所有后缀中的最小者。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行一个长度为n</span><span style="color: rgba(0, 0, 0, 0.87);">的仅包含大小写英文字母或数字的字符串s</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">一行若干个整数，第i</span><span style="color: rgba(0, 0, 0, 0.87);">个表示si</span><span style="color: rgba(0, 0, 0, 0.87);">的右端点在s</span><span style="color: rgba(0, 0, 0, 0.87);">中的位置。</span><br /></p>	[{"input": "ababa", "output": "2 4 5"}, {"input": "bbababaabaaabaaaab", "output": "1 2 4 6 9 13 18"}]	54ef5e30f116a32682e934820fef8a2f	[{"score": 9, "input_name": "1.in", "output_name": "1.out"}, {"score": 9, "input_name": "2.in", "output_name": "2.out"}, {"score": 9, "input_name": "3.in", "output_name": "3.out"}, {"score": 9, "input_name": "4.in", "output_name": "4.out"}, {"score": 9, "input_name": "5.in", "output_name": "5.out"}, {"score": 9, "input_name": "6.in", "output_name": "6.out"}, {"score": 9, "input_name": "7.in", "output_name": "7.out"}, {"score": 9, "input_name": "8.in", "output_name": "8.out"}, {"score": 9, "input_name": "9.in", "output_name": "9.out"}, {"score": 9, "input_name": "10.in", "output_name": "10.out"}, {"score": 9, "input_name": "11.in", "output_name": "11.out"}]	<p>1&lt;|s|&lt;2^20</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 05:43:12.234624+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	1	1	9	10047	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
34	最长公共子串	<p><span style="color: rgba(0, 0, 0, 0.87);">给定n</span><span style="color: rgba(0, 0, 0, 0.87);">个字符串，试求出这些字符串的最长公共子串。</span><br /></p>	<p>第一行一个整数n。</p><p>下面第2到n+1行，每行一个字符串。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">仅一行，包含一个正整数，表示n</span><span style="color: rgba(0, 0, 0, 0.87);">个字符串的最长公共子串长度。</span><br /></p>	[{"input": "2\\nababc\\ncbaab", "output": "2"}]	67d7f42424903349a2b6a22ff4567e0b	[{"score": 14, "input_name": "1.in", "output_name": "1.out"}, {"score": 14, "input_name": "2.in", "output_name": "2.out"}, {"score": 14, "input_name": "3.in", "output_name": "3.out"}, {"score": 14, "input_name": "4.in", "output_name": "4.out"}, {"score": 14, "input_name": "5.in", "output_name": "5.out"}, {"score": 14, "input_name": "6.in", "output_name": "6.out"}, {"score": 14, "input_name": "7.in", "output_name": "7.out"}]	<p><span style="color: rgba(0, 0, 0, 0.87);">对于第i</span><span style="color: rgba(0, 0, 0, 0.87);">个测试点，保证n=i+1</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 05:52:01.557839+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	2	1	9	10048	{"0": 1, "-1": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
32	旋转字符串	<p>小明突发奇想，能不能把一个字符串向左边旋转一下呢？</p><p>字符串的旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请用一个函数帮小明实现字符串旋转操作的功能吧。</p><p>输入是一个字符串<span style="color: rgb(119, 119, 119);">$</span>s<span style="color: rgb(119, 119, 119);">$</span>和一个数字<span style="color: rgb(119, 119, 119);">$</span>n<span style="color: rgb(119, 119, 119);">$</span>，输出字符串向左旋转<span style="color: rgb(119, 119, 119);">$</span>n<span style="color: rgb(119, 119, 119);">$</span>位后的结果。</p><p>比如，输入字符串&quot;abcdefg&quot;和数字2，该函数将返回左旋转两位得到的结果&quot;cdefgab&quot;。</p>	<p>输入有两行，第一行是一个字符串<span style="color: rgb(119, 119, 119);">$</span>s<span style="color: rgb(119, 119, 119);">$，第二行是</span>一个数字<span style="color: rgb(119, 119, 119);">$</span>n<span style="color: rgb(119, 119, 119);">$。</span><span style="color: rgb(119, 119, 119);">例如：</span></p><p>abcdefg</p><p>2</p>	<p><span style="color: rgb(51, 51, 51);">输出字符串向左旋转</span><span style="color: rgb(119, 119, 119);">$</span><span style="color: rgb(51, 51, 51);">n</span><span style="color: rgb(119, 119, 119);">$</span><span style="color: rgb(51, 51, 51);">位后的结果。例如：</span><br /></p><p><span style="color: rgb(51, 51, 51);">cdefgab<br /></span></p>	[{"input": "abcdefg\\n2", "output": "cdefgab"}, {"input": "lrloseumgh\\n6", "output": "umghlrlose"}]	2e791824dbceddda810a8ad99355e41f	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]		["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 05:20:41.138768+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	来源：剑指offer	1	1	10	10031	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
28	两数之和 II - 输入有序数组	<p>给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。  函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。<br /></p><ul><li>返回的下标值（index1 和 index2）不是从零开始的。</li><li>你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。</li></ul>	<p>输入一个<span style="color: rgb(51, 51, 51);">已按照升序排列的有序数组</span>以及一个目标数</p>	<p><span style="color: rgb(51, 51, 51);">在数组中找到两个数使得它们相加之和等于目标数。  函数应该返回这两个下标值 index1 和 index2</span><br /></p>	[{"input": "numbers = [2, 7, 11, 15], target = 9", "output": "[1,2]"}]	853802c85f1af6dfc2b640ffa60eb97c	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]	<pre>2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 </pre>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 02:35:50.348121+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	力扣（LeetCode） 链接：https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。	1	0	9	10043	{"-2": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
30	子串查找	<p>给定一个字符串和一个字符串，求在中的出现次数。和中的字符均为英语大写字母或小写字母。</p><p>中不同位置出现的可重叠。</p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输入共两行，分别是字符串</span><span style="color: rgba(0, 0, 0, 0.87);">和字符串</span><span style="color: rgba(0, 0, 0, 0.87);">。</span><br /></p>	<p><span style="color: rgba(0, 0, 0, 0.87);">输出一个整数，表示</span><span style="color: rgba(0, 0, 0, 0.87);">在</span><span style="color: rgba(0, 0, 0, 0.87);">中的出现次数。</span><br /></p>	[{"input": "zyzyzyz\\nzyz", "output": "3"}]	eb5f749c4d6101486ba0610d48999eff	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p>字符串的长度属于[1，10^6],且3仅仅包含大小写字母</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 03:48:20.110074+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	LibreOJ	3	1	9	10045	{"0": 1, "-2": 2}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
37	在排序数组中统计数字频次	<p>老师给了小薇一个排好了序的数组（升序）<span style="color: rgb(119, 119, 119);">$</span>A<span style="color: rgb(119, 119, 119);">$</span>，还给了她一个数字target，让她找找这个数字在排序数组中出现的次数，算法要求越快越好哦！</p><p>这可难到了小薇，你快来帮帮她吧！</p>	<p>第一行为一个数字<span style="color: rgb(119, 119, 119);">$</span>n<span style="color: rgb(119, 119, 119);">$</span>，为排序数组的长度。</p><p>第二行为<span style="color: rgb(119, 119, 119);">$</span>n<span style="color: rgb(119, 119, 119);">$</span>个数字，排序数组的内容（保证有序）。</p><p>第三行为一个数字target。</p>	<p>target的出现频次，数字</p>	[{"input": "6\\n5 7 7 8 8 10\\n8", "output": "2"}, {"input": "6\\n5 7 7 8 8 10\\n6", "output": "0"}]	b9986f65eb6fc472d543a7b7b41aabbd	[{"score": 10, "input_name": "1.in", "output_name": "1.out"}, {"score": 10, "input_name": "2.in", "output_name": "2.out"}, {"score": 10, "input_name": "3.in", "output_name": "3.out"}, {"score": 10, "input_name": "4.in", "output_name": "4.out"}, {"score": 10, "input_name": "5.in", "output_name": "5.out"}, {"score": 10, "input_name": "6.in", "output_name": "6.out"}, {"score": 10, "input_name": "7.in", "output_name": "7.out"}, {"score": 10, "input_name": "8.in", "output_name": "8.out"}, {"score": 10, "input_name": "9.in", "output_name": "9.out"}, {"score": 10, "input_name": "10.in", "output_name": "10.out"}]	<p><span style="color: rgb(119, 119, 119);">$$</span>0<span style="color: rgb(119, 119, 119);">\\</span><span style="color: rgb(170, 55, 49);">le</span>n<span style="color: rgb(119, 119, 119);">\\</span><span style="color: rgb(170, 55, 49);">le</span>50000<span style="color: rgb(119, 119, 119);">$$</span></p><p>二分查找左右边界</p>	["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 07:14:09.965895+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low	来源：剑指offer	1	1	10	10032	{"0": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
38	三数之和	<p>给你一个包含n个整数的数组nums，判断nums中是否存在三个元素a，b，c，使得 a+b+c=0 ？请你找出所有满足条件且<b>不重复</b>的三元组</p>	<p>第一行有一个数字n，n是数组的长度</p><p>第二行有n个数字，是数组的各个元素</p>	<p>输出不重复的k行(0&lt;=k&lt;=n)<br /></p><p>每行三个数字 a，b，c，要求a+b+c=0且a&lt;=b&lt;=c</p>	[{"input": "6\\n-1 0 1 2 -1 -4", "output": "-1 0 1\\n-1 -1 2"}]	65a3d253cb05ec79ebb625abaee3a52d	[{"score": 60, "input_name": "1.in", "output_name": "1.out"}, {"score": 40, "input_name": "2.in", "output_name": "2.out"}]		["C", "C++", "Java", "Python2", "Python3"]	{}	2020-06-19 07:58:56.88096+00	\N	1000	256	f	\N	\N	\N	OI	t	Low	LeetCode	0	0	14	10011	{}	100	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
\.


--
-- Data for Name: problem_tag; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tag (id, name) FROM stdin;
1	begin
2	测试
3	1
4	蓝桥杯-历届试题
5	test
6	简单题
7	非对称加密
8	DP
9	高精度
10	简单
11	排序
12	两数之和
13	子串查找
14	串
15	jiandan
16	子串
17	数组
18	查找
19	双指针
\.


--
-- Data for Name: problem_tags; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tags (id, problem_id, problemtag_id) FROM stdin;
2	1	1
40	14	6
41	15	6
44	16	6
45	17	6
46	18	6
47	19	6
48	20	7
49	21	6
50	22	8
51	23	9
52	24	9
53	25	8
56	28	12
57	29	10
58	30	13
59	31	10
60	32	14
61	32	10
64	34	16
65	35	10
66	33	15
67	36	10
68	26	10
69	27	11
73	37	17
74	37	18
75	37	11
78	38	19
\.


--
-- Data for Name: submission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.submission (id, contest_id, problem_id, create_time, user_id, code, result, info, language, shared, statistic_info, username, ip) FROM stdin;
c84068793bda6eac0612bbde47fd1d84	\N	1	2020-06-19 08:15:39.935396+00	14	def f(a,b):\n  return a+b	-1	{"err": null, "data": [{"error": 0, "memory": 5844992, "output": null, "result": -1, "signal": 0, "cpu_time": 12, "exit_code": 0, "real_time": 16, "test_case": "1", "output_md5": "d41d8cd98f00b204e9800998ecf8427e"}]}	Python3	f	{"time_cost": 12, "memory_cost": 5844992}	pku_zbt	183.214.21.105
1e93430469f61551b1b3dee87f22a627	\N	1	2020-06-19 07:01:03.40358+00	14	int add(a, b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/5e9c293bc872458988fff9e1e0ea6d44/solution.py\\", line 1\\n    int add(a, b) {\\n          ^\\nSyntaxError: invalid syntax"}	pku_zbt	183.214.21.105
b6845f80ce97131a1bd2101355ce2882	\N	1	2020-06-14 17:29:31.286038+00	1	int add(int a, int b) {\n    return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 0, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 573440}	root	121.28.131.82
d40f7cb5a4c8703758e83f859b34241a	\N	1	2020-06-14 17:38:06.575121+00	1	int add(int a, int b) {\n    return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 569344}	root	121.28.131.82
8e3a722e0557d27cdf488a0a796c87ad	\N	1	2020-06-15 01:39:19.511542+00	3	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 569344}	douzefan	110.243.177.246
9aae557a1c084c46c09880f74b34efdc	\N	1	2020-06-15 02:01:42.704962+00	3	int add(int a, int b) {\n  return a+b;\n}	-2	{}	Java	f	{"score": 0, "err_info": "/judger/run/1f94291dad6547b78db30fb9ff367300/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n^\\n/judger/run/1f94291dad6547b78db30fb9ff367300/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n    ^\\n/judger/run/1f94291dad6547b78db30fb9ff367300/Main.java:3: error: class, interface, or enum expected\\n}\\n^\\n3 errors"}	douzefan	110.243.177.246
73a3826b90aafb26846d406374b19473	\N	1	2020-06-15 02:06:47.163697+00	3	public class Main{\n\tpublic static void main(String[] args) {\n        \n    }\n}	-1	{"err": null, "data": [{"error": 0, "memory": 22765568, "output": null, "result": -1, "signal": 0, "cpu_time": 54, "exit_code": 0, "real_time": 58, "test_case": "1", "output_md5": "d41d8cd98f00b204e9800998ecf8427e"}]}	Java	f	{"time_cost": 54, "memory_cost": 22765568}	douzefan	110.243.177.246
558d90e816a3cd13fb61410557deb400	\N	1	2020-06-15 02:18:12.086977+00	5	#include<iostream>\nusing namespace std;\nint main{\n  int a,b;\n  cin>>a>>b;\n  cout<<a+b;\t\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/0e5d5764d3444561a331a294077b0e39/main.cpp:4:3: error: expected primary-expression before 'int'\\n   int a,b;\\n   ^\\n/judger/run/0e5d5764d3444561a331a294077b0e39/main.cpp:4:3: error: expected '}' before 'int'\\n/judger/run/0e5d5764d3444561a331a294077b0e39/main.cpp:4:3: error: expected ',' or ';' before 'int'\\ncompilation terminated due to -fmax-errors=3."}	fightcg	221.192.179.156
31598e0c0516f5398dae8872835134cb	\N	1	2020-06-15 02:20:46.926415+00	5	#include<iostream>\nusing namespace std;\nint main(){\n  int a,b;\n  cin>>a>>b;\n  cout<<a+b;\n  return 0;\t\n}	0	{"err": null, "data": [{"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C++	f	{"time_cost": 0, "memory_cost": 1454080}	fightcg	221.192.179.156
b1263f6379be1c9648596b369c0a5753	\N	1	2020-06-15 02:20:52.646588+00	5	#include<iostream>\nusing namespace std;\nint main(){\n  int a,b;\n  cin>>a>>b;\n  cout<<a+b;\n  return 0;\t\n}	0	{"err": null, "data": [{"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C++	f	{"time_cost": 1, "memory_cost": 1458176}	fightcg	221.192.179.156
fc4ec9b8a0f1adaecb6adce18d2011e5	\N	1	2020-06-15 02:20:55.466792+00	5	#include<iostream>\nusing namespace std;\nint main(){\n  int a,b;\n  cin>>a>>b;\n  cout<<a+b;\n  return 0;\t\n}	0	{"err": null, "data": [{"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C++	f	{"time_cost": 0, "memory_cost": 1454080}	fightcg	221.192.179.156
b36e8fda4dff01465b4780f21b050e79	\N	1	2020-06-15 03:26:29.858017+00	6	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/usr/lib/gcc/x86_64-linux-gnu/5/../../../x86_64-linux-gnu/crt1.o: In function `_start':\\n(.text+0x20): undefined reference to `main'\\ncollect2: error: ld returned 1 exit status"}	zhangqx	123.116.125.143
ecc86f26cf249cd2a3aeeb15a0b9dded	\N	1	2020-06-15 03:28:04.097543+00	6	#include <iostream> \nusing namespace std;\nint main()\n{\n    int a,b;\n    cin >> a >> b;;\n    cout << a+b;\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C++	f	{"time_cost": 0, "memory_cost": 1454080}	zhangqx	123.116.125.143
39ece902fa105240fe9c52e0e4c96a60	\N	18	2020-06-18 12:26:56.304494+00	3	#include <string.h>\n#include <stdio.h>\n#define ll long long\n#define MOD 1000000007\nstruct nobe {\n    ll a[2][2];\n    nobe() { memset(a, 0, sizeof(a)); }\n};\nll n;\nll sum;\nnobe mut(nobe x, nobe y) {\n    nobe res;\n    for (ll i = 0; i < 2; i++)\n        for (int j = 0; j < 2; j++)\n            for (int k = 0; k < 2; k++) res.a[i][j] = (res.a[i][j] + x.a[i][k] * y.a[k][j]) % MOD;\n    return res;\n}  // 2-2矩阵乘法\nvoid quick(ll n) {\n    nobe c, res;\n    c.a[0][0] = c.a[0][1] = c.a[1][0] = 1;\n    c.a[1][1] = 0;\n    for (int i = 0; i < 2; i++) res.a[i][i] = 1;\n    while (n) {\n        if (n & 1)\n            res = mut(res, c);\n        c = mut(c, c);\n        n = n >> 1;\n    }  // F(0)=0,F(1)=1,F(2)=1且res矩阵每个数都会变化，没有规律\n    printf("%lld\\n", (res.a[0][0] % MOD) * (res.a[1][0] % MOD) % MOD);  //这是对的\n}\nint main() {\n    while (scanf("%lld", &n) != EOF) quick(n);\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "cd089b9c47f1f6e75da0527ab6c0c828"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "2", "output_md5": "bbc368f80f9da155cbf23fae23de18ad"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "c8bfc7cc040629e8bc24d359eeb5cd9f"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "82480dbee53ab289205180c445bd2026"}, {"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "5", "output_md5": "e3c344a88d544e765098394d5c2fa38f"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 0, "test_case": "6", "output_md5": "610933784cec8561dd63e66f186a0eb9"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "7", "output_md5": "d6515075a427645daa776b33288c06c4"}, {"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "8", "output_md5": "109c983aa05f67dca1bf414fe0e17a7f"}, {"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "9", "output_md5": "f26afaa239c8f981aa9812c2daa69c35"}, {"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "4de5aec06b7f41f58a46a778ccd0b05c"}]}	C++	f	{"time_cost": 0, "memory_cost": 573440}	douzefan	110.243.177.246
9db57ad367d8ebb464893ae504be9e07	\N	23	2020-06-18 15:36:46.496099+00	1	#include <bits/stdc++.h>\nusing namespace std;\nunsigned int a[1000],b[1000],sum[1000];\nint main()\n{\n\tios::sync_with_stdio(false);\n\tstring s1,s2;\n\tcin>>s1>>s2;\n\tfor(int i=0;i<s1.size();i++)\n\t{\n\t\ta[i+1]=s1[i]-'0';\n\t}\n\tfor(int i=0;i<s2.size();i++)\n\t{\n\t\tb[i+1]=s2[i]-'0';\n\t}\n\tint k=1;\n\tint flag=max(s1.size(),s2.size());\n\tfor(int i=s1.size(),j=s2.size();i>0||j>0;i--,j--)\n\t{\n\t\tsum[k]+=a[i]+b[j];\n\t\tif(sum[k]>=10)\n\t\t{\n\t\t\tsum[k]%=10;\n\t\t\tsum[k+1]++;\n\t\t\tflag=max(k+1,flag);\n\t\t}\n\t\tk++;\n\t}\n\tfor(int i=flag;i>0;i--)\n\t{\n\t\tcout<<sum[i];\n\t}\n\treturn 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1482752, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}, {"error": 0, "memory": 1490944, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "dc1f0f8ca86384d373a462052016ea95"}, {"error": 0, "memory": 1490944, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "3", "output_md5": "b51a15f382ac914391a58850ab343b00"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "3e5b6ef5b27247cc470d130ddc9f6bae"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "5", "output_md5": "2bf443c7443f177838b40e07f20a811a"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "63698f0f63e190a73a93c0e2cff2040a"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "7", "output_md5": "be778d7cd750b9a89602d816357ebddd"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "8", "output_md5": "796cf6c1d82f2df5a8ad59ef6831dd9d"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "9", "output_md5": "063287895a24fab1bbb600bf690e6710"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "47d949056a9244a90916ac44f46c4fc6"}]}	C++	f	{"time_cost": 1, "memory_cost": 1503232}	root	121.28.131.82
856e04064fd27fac0002f432ddd67670	\N	32	2020-06-19 06:08:58.951701+00	10	#include <assert.h> //  assert\n#include <cstdio>   // freopen\n#include <cstdlib>  // rand()\n#include <fstream>  // ofstream, ifstream, fstream\n#include <iostream>\n#include <string> // string\n\nusing namespace std;\n\nclass Solution\n{\npublic:\n    string reverseLeftWords(string s, int n)\n    {\n        if (s.size() == 0)\n        {\n            return s;\n        }\n        int len = s.size();\n        str = s;\n        reverse(0, n - 1);\n        // cout << str << endl;\n        reverse(n, len - 1);\n        // cout << str << endl;\n        reverse(0, len - 1);\n        // cout << str << endl;\n        return str;\n    }\n    void reverse(int left, int right)\n    {\n        if (left <= right)\n        {\n            int len = (right - left) / 2;\n            for (int i = 0; i <= len; i++)\n            {\n                char t = str[left + i];\n                str[left + i] = str[right - i];\n                str[right - i] = t;\n            }\n        }\n    }\n\nprivate:\n    string str;\n};\n\nconst int length_lim = 10000;\nvoid gen_test_case(int cnt, Solution so)\n{\n    int len = rand() % length_lim;\n    string s(len, 'a');\n    for (int i = 0; i < len; i++)\n    {\n        int k = rand() % 26;\n        s[i] = 'a' + k;\n    }\n    ofstream out_file, in_file;\n    char in_name[10];\n    char out_name[10];\n    sprintf(in_name, "%d.in", cnt);\n    sprintf(out_name, "%d.out", cnt);\n    in_file.open(in_name, ios::out);\n    out_file.open(out_name, ios::out);\n    int n = rand() % len;\n    in_file << s << endl;\n    //\tcout << len << endl;\n    in_file << n;\n    //\tcout << so.reverseLeftWords(s, n) << endl;\n    out_file << so.reverseLeftWords(s, n);\n}\n\nvoid test_case(int cnt, Solution so)\n{\n    ifstream in_file;\n    ifstream out_file;\n    char in_name[10];\n    char out_name[10];\n    sprintf(in_name, "%d.in", cnt);\n    sprintf(out_name, "%d.out", cnt);\n    in_file.open(in_name, ios::in);\n    out_file.open(out_name, ios::out);\n    int n;\n    string s;\n    string ans;\n    in_file >> s >> n;\n    out_file >> ans;\n    string res = so.reverseLeftWords(s, n);\n    // cout << res << endl;\n    // cout << ans << endl;\n    // cout << ans.compare(res) << endl;\n    assert(ans == res);\n}\n\nvoid gen_out_file(int le, int ri)\n{\n    Solution so;\n    for (int i = le; i <= ri; i++)\n    {\n        //freopen(filename, 'r', stdin);\n        //freopen(filename2, 'w', stdout);\n        gen_test_case(i, so);\n    }\n}\n\nvoid online_test()\n{\n    Solution so;\n    int n;\n    string s;\n    cin >> s >> n;\n    string res = so.reverseLeftWords(s, n);\n    cout << res << endl;\n}\n\nint main()\n{\n    // gen_out_file(8, 10);\n    // file_test_case(1, 2);\n    online_test();\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1474560, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "285ea77a24cb7471c8954cf468e8270c"}, {"error": 0, "memory": 1478656, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "349bb5075c76111c03adc33f0824ea3f"}, {"error": 0, "memory": 1486848, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "b7e65002ff40dab52e503f68c36aaa12"}, {"error": 0, "memory": 1486848, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "422dd538244a609f11e7b597db74ec8f"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "5", "output_md5": "e26fb1a127909ad931afbf56b4222be7"}, {"error": 0, "memory": 1495040, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "07a76d2c98aa5296cb5f5c7e42448096"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "7", "output_md5": "a02712f7292a91401f4de31d0fc8d45e"}, {"error": 0, "memory": 1482752, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "8", "output_md5": "b7e65002ff40dab52e503f68c36aaa12"}, {"error": 0, "memory": 1486848, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "9", "output_md5": "422dd538244a609f11e7b597db74ec8f"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "10", "output_md5": "e26fb1a127909ad931afbf56b4222be7"}]}	C++	f	{"time_cost": 1, "memory_cost": 1503232}	dengluo	111.77.220.210
dd9c6282b7c5a019313ed79bbdee39c0	\N	1	2020-06-19 08:20:10.62848+00	14	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 569344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 569344}	pku_zbt	183.214.21.105
486bb73e5bf1be9d5a27eafd293d1c0e	\N	29	2020-06-19 06:38:39.308918+00	9	#include <stdio.h>\nint reverse(int x){\n    int ret=0,max=0x7fffffff,min=0;\n    long rs=0;\n    for(;x;rs=rs*10+x%10,x/=10);\n    return ret=rs>max||rs<min?0:rs;\n}\nbool isPalindrome(int x){\n    return x==reverse(x);\n}\nint main(){\n   int a;\n  scanf("%d",&a);\n  if(isPalindrome(a)){\n    printf("true");\n  }\n  else{\n    printf("false");\n  }\n  return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/59de869b58344e96b6ff487ee7094dd8/main.c:8:1: error: unknown type name 'bool'\\n bool isPalindrome(int x){\\n ^"}	alice	111.165.158.111
c152edb69a483038f7926cc1afe72269	\N	1	2020-06-19 07:01:22.98815+00	14	def add(a, b):\n  // Please fill this blank\n  return a+b	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/b70289fdafa44e32b44ed3c908da2bbb/solution.py\\", line 2\\n    // Please fill this blank\\n     ^\\nSyntaxError: invalid syntax"}	pku_zbt	183.214.21.105
ef029169e2d86db75aa191132081510f	\N	19	2020-06-18 12:39:10.754457+00	3	#include <bits/stdc++.h>\n#define mset(a, b) memset(a, b, sizeof(a))\n#define mcpy(a, b) memcpy(a, b, sizeof(a))\nusing namespace std;\ntypedef long long LL;\nconst int N = 105;\nconst int MAXN = 20000007;\n\ntemplate <typename T>\ninline void read(T &AKNOI) {\n    T x = 0, flag = 1;\n    char ch = getchar();\n    while (!isdigit(ch)) {\n        if (ch == '-')\n            flag = -1;\n        ch = getchar();\n    }\n    while (isdigit(ch)) {\n        x = x * 10 + ch - '0';\n        ch = getchar();\n    }\n    AKNOI = flag * x;\n}\n\nnamespace ModCalculator {\nconst int MOD = 20170408;\ninline void Inc(int &x, int y) {\n    x += y;\n    if (x >= MOD)\n        x -= MOD;\n}\ninline void Dec(int &x, int y) {\n    x -= y;\n    if (x < 0)\n        x += MOD;\n}\ninline int Add(int x, int y) {\n    Inc(x, y);\n    return x;\n}\ninline int Sub(int x, int y) {\n    Dec(x, y);\n    return x;\n}\ninline int Mul(int x, int y) { return 1LL * x * y % MOD; }\ninline int Ksm(int x, int k) {\n    int ret = 1;\n    for (; k; k >>= 1) {\n        if (k & 1)\n            ret = Mul(ret, x);\n        x = Mul(x, x);\n    }\n    return ret;\n}\ninline int Inv(int x) { return Ksm(x, MOD - 2); }\n}  // namespace ModCalculator\nusing namespace ModCalculator;\n\nint n, m, p, cnt[N];\nint pr[MAXN], pcnt;\nbool vis[MAXN];\n\nstruct Matrix {\n    int a[N][N];\n    Matrix operator*(const Matrix &b) const {\n        Matrix ret;\n        for (int i = 0; i < p; ++i) {\n            for (int j = 0; j < p; ++j) {\n                int tmp = 0;\n                for (int k = 0; k < p; ++k) {\n                    Inc(tmp, Mul(a[i][k], b.a[k][j]));\n                }\n                ret.a[i][j] = tmp;\n            }\n        }\n        return ret;\n    }\n} F;\n\nMatrix Matrix_Ksm(Matrix x, int k) {\n    Matrix ret = x;\n    for (--k; k; k >>= 1) {\n        if (k & 1)\n            ret = ret * x;\n        x = x * x;\n    }\n    return ret;\n}\n\nvoid solve() {\n    read(n);\n    read(m);\n    read(p);\n    for (int i = 0; i < p; ++i) {\n        cnt[i] = m / p;\n        if (i)\n            cnt[i] += (m % p >= i);\n    }\n    for (int i = 0; i < p; ++i) {\n        for (int j = 0; j < p; ++j) {\n            F.a[i][j] = cnt[(j - i + p) % p];\n        }\n    }\n    int ans = Matrix_Ksm(F, n).a[0][0];\n    for (int i = 2; i <= m; ++i) {\n        if (!vis[i]) {\n            pr[++pcnt] = i;\n            --cnt[i % p];\n        }\n        for (int j = 1; j <= pcnt && i * pr[j] <= m; ++j) {\n            vis[i * pr[j]] = 1;\n            if (i % pr[j] == 0)\n                break;\n        }\n    }\n    for (int i = 0; i < p; ++i) {\n        for (int j = 0; j < p; ++j) {\n            F.a[i][j] = cnt[(j - i + p) % p];\n        }\n    }\n    Dec(ans, Matrix_Ksm(F, n).a[0][0]);\n    printf("%d\\n", ans);\n}\n\nint main() {\n    solve();\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 3760128, "output": null, "result": 0, "signal": 0, "cpu_time": 27, "exit_code": 0, "real_time": 30, "test_case": "1", "output_md5": "f44fd077fa960e6aafcf616bb25f62e3"}, {"error": 0, "memory": 3764224, "output": null, "result": 0, "signal": 0, "cpu_time": 29, "exit_code": 0, "real_time": 32, "test_case": "2", "output_md5": "a766d63d68214678cbd165c5277064d1"}, {"error": 0, "memory": 3760128, "output": null, "result": 0, "signal": 0, "cpu_time": 106, "exit_code": 0, "real_time": 108, "test_case": "3", "output_md5": "8e6836fe0aa54b7ed829954d9ccf728e"}, {"error": 0, "memory": 3760128, "output": null, "result": 0, "signal": 0, "cpu_time": 133, "exit_code": 0, "real_time": 135, "test_case": "4", "output_md5": "70544f7b794eb708733e9e139f136e7f"}, {"error": 0, "memory": 3756032, "output": null, "result": 0, "signal": 0, "cpu_time": 133, "exit_code": 0, "real_time": 136, "test_case": "5", "output_md5": "13e83df633d46e97a74fda10ae8b083c"}, {"error": 0, "memory": 4489216, "output": null, "result": 0, "signal": 0, "cpu_time": 89, "exit_code": 0, "real_time": 93, "test_case": "6", "output_md5": "968c965e331bebeaaa7bab85590e51c2"}, {"error": 0, "memory": 4390912, "output": null, "result": 0, "signal": 0, "cpu_time": 139, "exit_code": 0, "real_time": 141, "test_case": "7", "output_md5": "ef4a9e45641ec5e080b4646263dff9b1"}, {"error": 0, "memory": 4411392, "output": null, "result": 0, "signal": 0, "cpu_time": 116, "exit_code": 0, "real_time": 121, "test_case": "8", "output_md5": "ad9ac8c36cfe1cdbb3514cdb52bbfdc9"}, {"error": 0, "memory": 26779648, "output": null, "result": 0, "signal": 0, "cpu_time": 262, "exit_code": 0, "real_time": 267, "test_case": "9", "output_md5": "c4b0a15e23a015fd3a6053f3596c5b1d"}, {"error": 0, "memory": 26779648, "output": null, "result": 0, "signal": 0, "cpu_time": 237, "exit_code": 0, "real_time": 246, "test_case": "10", "output_md5": "a77e7626c42bdc4772df605ce0390b8c"}]}	C++	f	{"time_cost": 262, "memory_cost": 26779648}	douzefan	110.243.177.246
6c93db7e2a7af1afbf9e57102e9b2171	\N	1	2020-06-16 02:59:32.366487+00	9	int add(int a, int b) {\n  // Please fill this blank\n  return __a+b_________;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/9ac238038694425b81607cea05fa7485/main.c: In function 'add':\\n/judger/run/9ac238038694425b81607cea05fa7485/main.c:5:10: error: '__a' undeclared (first use in this function)\\n   return __a+b_________;\\n          ^\\n/judger/run/9ac238038694425b81607cea05fa7485/main.c:5:10: note: each undeclared identifier is reported only once for each function it appears in\\n/judger/run/9ac238038694425b81607cea05fa7485/main.c:5:14: error: 'b_________' undeclared (first use in this function)\\n   return __a+b_________;\\n              ^"}	alice	111.30.248.72
d8b6dd5f4bb7ed7b8aed36a90574f44c	\N	23	2020-06-18 15:37:03.860573+00	1	#include <bits/stdc++.h>\nusing namespace std;\nunsigned int a[1000],b[1000],sum[1000];\nint main()\n{\n\tios::sync_with_stdio(false);\n\tstring s1,s2;\n\tcin>>s1>>s2;\n\tfor(int i=0;i<s1.size();i++)\n\t{\n\t\ta[i+1]=s1[i]-'0';\n\t}\n\tfor(int i=0;i<s2.size();i++)\n\t{\n\t\tb[i+1]=s2[i]-'0';\n\t}\n\tint k=1;\n\tint flag=max(s1.size(),s2.size());\n\tfor(int i=s1.size(),j=s2.size();i>0||j>0;i--,j--)\n\t{\n\t\tsum[k]+=a[i]+b[j];\n\t\tif(sum[k]>=10)\n\t\t{\n\t\t\tsum[k]%=10;\n\t\t\tsum[k+1]++;\n\t\t\tflag=max(k+1,flag);\n\t\t}\n\t\tk++;\n\t}\n\tfor(int i=flag;i>1;i--)\n\t{\n\t\tcout<<sum[i];\n\t}\n\treturn 0;\n}	-1	{"err": null, "data": [{"error": 0, "memory": 1445888, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "d41d8cd98f00b204e9800998ecf8427e"}, {"error": 0, "memory": 1490944, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "072e81e77edf6f7370bc290b32c9bb81"}, {"error": 0, "memory": 1490944, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "069059b7ef840f0c74a814ec9237b6ec"}, {"error": 0, "memory": 1503232, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "4", "output_md5": "efb82acf687ad421246b00c7d14152c8"}, {"error": 0, "memory": 1499136, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "5", "output_md5": "e584be0f4a3f7f912e3039e10c16a114"}, {"error": 0, "memory": 1499136, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "b7a04bd4ae2f52e0dc7206c667f9ddc5"}, {"error": 0, "memory": 1503232, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "7", "output_md5": "be6c57704a17040c33c3517dcff1c9e7"}, {"error": 0, "memory": 1503232, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "8", "output_md5": "66758bc5629202c19ccd793763453e28"}, {"error": 0, "memory": 1499136, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "9", "output_md5": "da9db20d3b708fa171dce92e5e7ac088"}, {"error": 0, "memory": 1499136, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "6485c1444a1701513de001e4290f5b31"}]}	C++	f	{"time_cost": 1, "memory_cost": 1503232}	root	121.28.131.82
a2b3f21cf551d8834b10c65d94c329bb	\N	1	2020-06-16 03:00:15.146733+00	9	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 573440}	alice	111.30.248.72
6f59184003d901b78c72c55bb6e5a385	\N	1	2020-06-16 11:43:37.392994+00	10	int main() {\n \tint a, b;\n  scanf("%d %d", &a, &b);\n  printf("%d\\n", a + b);\n  return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/397fbe8e53e24509886dee0e6018d356/main.c:9:5: error: redefinition of 'main'\\n int main() {\\n     ^\\n/judger/run/397fbe8e53e24509886dee0e6018d356/main.c:3:5: note: previous definition of 'main' was here\\n int main() {\\n     ^"}	dengluo	182.111.78.78
29c4a0032aa92ea1d7961069c955ad6b	\N	1	2020-06-16 11:44:26.967875+00	10	int main() {\n \tint a, b;\n  scanf("%d %d", &a, &b);\n  printf("%d\\n", a + b);\n  return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/fbe5ad52cbfe4011a9c99554abf31d46/main.c:9:5: error: redefinition of 'main'\\n int main() {\\n     ^\\n/judger/run/fbe5ad52cbfe4011a9c99554abf31d46/main.c:3:5: note: previous definition of 'main' was here\\n int main() {\\n     ^"}	dengluo	182.111.78.78
c2bc14b900892b3f957f749716753ec1	\N	1	2020-06-16 11:45:00.504191+00	10	int add(int a, int b) {\n  // Please fill this blank\n  return a + b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 573440}	dengluo	182.111.78.78
2ac86c5e5c7ba8809250225c356d01e7	\N	1	2020-06-16 11:47:25.94002+00	8	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	Java	f	{"score": 0, "err_info": "/judger/run/ba016f74d58c411a81cfd33aba150ef0/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n^\\n/judger/run/ba016f74d58c411a81cfd33aba150ef0/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n    ^\\n/judger/run/ba016f74d58c411a81cfd33aba150ef0/Main.java:4: error: class, interface, or enum expected\\n}\\n^\\n3 errors"}	zhangzhiyuan	110.245.168.192
c220b034b1090ce4129c2bf104a2d664	\N	1	2020-06-16 11:47:38.142481+00	8	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	Java	f	{"score": 0, "err_info": "/judger/run/149205bbf4d8451ba41ca82b4f9c7192/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n^\\n/judger/run/149205bbf4d8451ba41ca82b4f9c7192/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n    ^\\n/judger/run/149205bbf4d8451ba41ca82b4f9c7192/Main.java:4: error: class, interface, or enum expected\\n}\\n^\\n3 errors"}	zhangzhiyuan	110.245.168.192
6cf79a7abdf83c043cc2af8992e636c9	\N	1	2020-06-16 11:47:50.89972+00	8	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 573440}	zhangzhiyuan	110.245.168.192
bf99e30296507437765fea99eaf1df2e	\N	1	2020-06-16 11:47:57.014423+00	8	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/usr/lib/gcc/x86_64-linux-gnu/5/../../../x86_64-linux-gnu/crt1.o: In function `_start':\\n(.text+0x20): undefined reference to `main'\\ncollect2: error: ld returned 1 exit status"}	zhangzhiyuan	110.245.168.192
e1688da6536f6aefbec220659f50911e	\N	20	2020-06-18 13:25:54.84044+00	3	#include <bits/stdc++.h>\nusing namespace std;\n\n#define LL long long\n#define Debug(x) cerr << #x << ": " << x << endl;\n\nconst LL Test[] = { 2,  3,  5,  7,  11, 13, 17, 19, 23, 29, 31, 37, 41,\n                    43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97 };\n\ninline LL mod(LL x, LL Mod) { return x >= Mod ? x - Mod : x; }\ninline LL Mul(LL x, LL y, LL Mod) { return (__int128)x * y % Mod; }\ninline LL qpow(LL x, LL y, LL Mod) {\n    LL ret = 1;\n    for (; y; y >>= 1, x = Mul(x, x, Mod))\n        if (y & 1)\n            ret = Mul(ret, x, Mod);\n    return ret;\n}\n\ninline bool MR(LL x) {\n    if (x == 1)\n        return false;\n    for (int i = 0; i < 25; i++)\n        if (x == Test[i])\n            return true;\n    for (int i = 0; i < 25; i++)\n        if (x % Test[i] == 0)\n            return false;\n    for (int i = 0; i < 25; i++) {\n        LL now = Test[i], nowc = x - 1, mc = qpow(now, x - 1, x), nc = 1;\n        if (mc != 1)\n            return false;\n        while (nc == 1 && nowc % 2 == 0) {\n            nc = qpow(now, nowc >>= 1, x);\n            if (nc != 1 && nc != x - 1)\n                return false;\n        }\n    }\n    return true;\n}\n\ninline LL randLL() { return (LL)rand() << 31LL | rand(); }\ninline LL find(LL N) {\n    LL x1 = 0, x2 = 0, c = randLL() % (N - 1) + 1, now = 1, g;\n    for (int w = 1;; w <<= 1, x1 = x2, now = 1) {\n        for (int i = 1; i <= w; i++) {\n            x2 = mod(Mul(x2, x2, N) + c, N);\n            now = Mul(now, abs(x2 - x1), N);\n            if (i % 127 == 0) {\n                g = __gcd(now, N);\n                if (g > 1)\n                    return g;\n            }\n        }\n        g = __gcd(now, N);\n        if (g > 1)\n            return g;\n    }\n}\ninline LL bigfact(LL x) {\n    if (x == 1 || MR(x))\n        return x;\n    LL now = x;\n    while (now == x) now = find(now);\n    return max(bigfact(now), bigfact(x / now));\n}\n\nLL e, N, c, d, n, x, y;\n\ninline void Exgcd(LL a, LL b) {\n    if (!b) {\n        x = 1;\n        y = 0;\n        return;\n    }\n    Exgcd(b, a % b);\n    LL tmp = x;\n    x = y;\n    y = tmp - (a / b) * y;\n}\n\nint main() {\n    scanf("%lld%lld%lld", &e, &N, &c);\n    LL p = bigfact(N), q = N / p, r = (p - 1) * (q - 1);\n    Exgcd(e, r);\n    d = x;\n    d = (d % r + r) % r;\n    n = qpow(c, d, N);\n    printf("%lld %lld\\n", d, n);\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "2bf2717b7aa2780be269ca589db27751"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "d7683d70fb64e5a9e5220517cb1bd327"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "e414d64543a8874dd5b8c92347d103d8"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "453bf78226da8c9578e5328069b0cdab"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 52, "test_case": "5", "output_md5": "9c69783dff7152c6e81ecff92a251b40"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 53, "test_case": "6", "output_md5": "c9a9750f5ec0392330ed75dbfd9ff253"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 52, "test_case": "7", "output_md5": "1a5cf30f10c1a9a0eb602f5f622101e0"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 4, "test_case": "8", "output_md5": "49cd020008dbc82dcbafbb7aef224460"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 53, "test_case": "9", "output_md5": "c9085058b1d7314f62563314df182bc8"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "10", "output_md5": "102b117b4d7735653dc6d45c14160200"}]}	C++	f	{"time_cost": 3, "memory_cost": 1466368}	douzefan	110.243.177.246
75798241f4d685fd4fd60c866dffa9e7	\N	23	2020-06-18 15:37:10.148037+00	1	#include <bits/stdc++.h>\nusing namespace std;\nunsigned int a[1000],b[1000],sum[1000];\nint main()\n{\n\tios::sync_with_stdio(false);\n\tstring s1,s2;\n\tcin>>s1>>s2;\n\tfor(int i=0;i<s1.size();i++)\n\t{\n\t\ta[i+1]=s1[i]-'0';\n\t}\n\tfor(int i=0;i<s2.size();i++)\n\t{\n\t\tb[i+1]=s2[i]-'0';\n\t}\n\tint k=1;\n\tint flag=max(s1.size(),s2.size());\n\tfor(int i=s1.size(),j=s2.size();i>0||j>0;i--,j--)\n\t{\n\t\tsum[k]+=a[i]+b[j];\n\t\tif(sum[k]>=10)\n\t\t{\n\t\t\tsum[k]%=10;\n\t\t\tsum[k+1]++;\n\t\t\tflag=max(k+1,flag);\n\t\t}\n\t\tk++;\n\t}\n\tfor(int i=flag;i>0;i--)\n\t{\n\t\tcout<<sum[i];\n\t}\n\treturn 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1482752, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}, {"error": 0, "memory": 1490944, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "dc1f0f8ca86384d373a462052016ea95"}, {"error": 0, "memory": 1490944, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "b51a15f382ac914391a58850ab343b00"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "4", "output_md5": "3e5b6ef5b27247cc470d130ddc9f6bae"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "5", "output_md5": "2bf443c7443f177838b40e07f20a811a"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "63698f0f63e190a73a93c0e2cff2040a"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "7", "output_md5": "be778d7cd750b9a89602d816357ebddd"}, {"error": 0, "memory": 1499136, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "8", "output_md5": "796cf6c1d82f2df5a8ad59ef6831dd9d"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "9", "output_md5": "063287895a24fab1bbb600bf690e6710"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "47d949056a9244a90916ac44f46c4fc6"}]}	C++	f	{"time_cost": 1, "memory_cost": 1503232}	root	121.28.131.82
2c38be4aa323d5749db7ceafeae4f171	\N	1	2020-06-16 17:52:14.240796+00	12	int main(){\n\n  int a, b;\n  cin>>a>>b;\n  cout<< a+b;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/483aceb6506840e694be11b49309b8be/main.cpp: In function 'int main()':\\n/judger/run/483aceb6506840e694be11b49309b8be/main.cpp:4:3: error: 'cin' was not declared in this scope\\n   cin>>a>>b;\\n   ^\\n/judger/run/483aceb6506840e694be11b49309b8be/main.cpp:5:3: error: 'cout' was not declared in this scope\\n   cout<< a+b;\\n   ^"}	tsj	222.140.140.224
5d91229a7de70a256da3442a14c4ba2e	\N	15	2020-06-18 10:51:51.607432+00	3	#include <bits/stdc++.h>\n#define N 500100\nusing namespace std;\nint read() {\n    int x = 0, f = 1;\n    char c = getchar();\n    while (c > '9' || c < '0') {\n        if (c == '-')\n            f = -1;\n        c = getchar();\n    }\n    while (c >= '0' && c <= '9') {\n        x = x * 10 + c - '0';\n        c = getchar();\n    }\n    return x * f;\n}\nchar ch[N], shit[] = { '@', '#', '$', '%', '^', '&', '!', '?', '>', '<', '*', '(', ')' };\nint sa[N], rk[N], tax[N], x[N], y[N], a[N], b[N], n, m, num, ans, height[N], t, all, flag;\nvoid get_sa() {\n    for (int i = 1; i <= n; ++i) ++tax[x[i] = ch[i]];\n    for (int i = 1; i <= m; ++i) tax[i] += tax[i - 1];\n    for (int i = n; i >= 1; i--) sa[tax[x[i]]--] = i;\n    for (int k = 1; k <= n; k <<= 1) {\n        num = 0;\n        for (int i = n - k + 1; i <= n; ++i) y[++num] = i;\n        for (int i = 1; i <= n; ++i)\n            if (sa[i] > k)\n                y[++num] = sa[i] - k;\n        for (int i = 1; i <= m; ++i) tax[i] = 0;\n        for (int i = 1; i <= n; ++i) ++tax[x[i]];\n        for (int i = 1; i <= m; ++i) tax[i] += tax[i - 1];\n        for (int i = n; i >= 1; i--) sa[tax[x[y[i]]]--] = y[i], y[i] = 0;\n        swap(x, y);\n        num = 1;\n        x[sa[1]] = 1;\n        for (int i = 2; i <= n; ++i)\n            x[sa[i]] = (y[sa[i]] == y[sa[i - 1]] && y[sa[i] + k] == y[sa[i - 1] + k]) ? num : ++num;\n        if (num == n)\n            break;\n        m = num;\n    }\n    for (int i = 1; i <= n; ++i) rk[sa[i]] = i;\n}\nvoid get_height() {\n    int now = 0;\n    for (int i = 1; i <= n; ++i) {\n        if (rk[i] == 1)\n            continue;\n        if (now > 0)\n            --now;\n        int j = sa[rk[i] - 1];\n        while (j + now <= n && i + now <= n && ch[i + now] == ch[j + now]) ++now;\n        height[rk[i]] = now;\n    }\n}\nint belong[N];\nbool check(int k) {\n    int lat = 0;\n    for (int i = 1; i <= n; ++i) {\n        if (height[i] < k) {\n            flag = 0;\n            for (int j = lat; j < i; ++j)\n                if (belong[sa[j]])\n                    flag |= (1 << (belong[sa[j]] - 1));\n            if (flag == (1 << t) - 1)\n                return 1;\n            lat = i;\n        }\n    }\n    return 0;\n}\nvoid get_ans() {\n    int l = 1, r = n, mid, ans;\n    while (l <= r) {\n        mid = (l + r) >> 1;\n        if (check(mid))\n            l = mid + 1, ans = mid;\n        else\n            r = mid - 1;\n    }\n    printf("%d", ans);\n}\nint main() {\n    t = read();\n    int nnn;\n    for (int i = 1; i <= t; ++i) {\n        scanf("%s", ch + n + 1);\n        nnn = n + 1;\n        n += strlen(ch + n + 1);\n        for (int j = nnn; j <= n; ++j) belong[j] = i;\n        ch[++n] = shit[i];\n    }\n    m = 300;\n    get_sa();\n    get_height();\n    get_ans();\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 14053376, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 4, "test_case": "1", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}, {"error": 0, "memory": 14057472, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 6, "test_case": "2", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 14061568, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 5, "test_case": "3", "output_md5": "a87ff679a2f3e71d9181a67b7542122c"}, {"error": 0, "memory": 14057472, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 6, "test_case": "4", "output_md5": "45c48cce2e2d7fbdea1afc51c7c6ad26"}, {"error": 0, "memory": 14057472, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 6, "test_case": "5", "output_md5": "c9f0f895fb98ab9159f51fd0297e236d"}, {"error": 0, "memory": 14057472, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 6, "test_case": "6", "output_md5": "a87ff679a2f3e71d9181a67b7542122c"}, {"error": 0, "memory": 14123008, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 6, "test_case": "7", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}, {"error": 0, "memory": 14131200, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 8, "test_case": "8", "output_md5": "1679091c5a880faf6fb5e6087eb1b2dc"}, {"error": 0, "memory": 14139392, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 8, "test_case": "9", "output_md5": "1679091c5a880faf6fb5e6087eb1b2dc"}, {"error": 0, "memory": 14692352, "output": null, "result": 0, "signal": 0, "cpu_time": 21, "exit_code": 0, "real_time": 23, "test_case": "10", "output_md5": "45c48cce2e2d7fbdea1afc51c7c6ad26"}]}	C++	f	{"time_cost": 21, "memory_cost": 14692352}	douzefan	110.243.177.246
3dc19212fcff5c7960f42b15a02eb225	\N	1	2020-06-19 08:14:25.823456+00	14	#include<stdio.h>\nint main(){\nint a,b;\n  scanf("%d%d",&a,&b);\n\tprintf("%d",a+b);  \n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/529e7e7416f24f9d9d75317146795926/main.c:9:5: error: redefinition of 'main'\\n int main() {\\n     ^\\n/judger/run/529e7e7416f24f9d9d75317146795926/main.c:4:5: note: previous definition of 'main' was here\\n int main(){\\n     ^"}	pku_zbt	183.214.21.105
b1b1033a612a1528e76baab4ae611470	\N	21	2020-06-18 13:41:57.458631+00	3	#define NDEBUG\n#include <algorithm>\n#include <cassert>\n#include <cstring>\n#include <functional>\n#include <initializer_list>\n#include <iostream>\n#include <memory>\n#include <random>\n#include <vector>\n\nnamespace test {\n\nconstexpr int P = 1e9 + 7;\n\nstruct Mat {\npublic:\n    std::vector<std::vector<int>> mat;\n    Mat(int n, int m) : mat(n, std::vector<int>(m)) {}\n    ~Mat() = default;\n    int row() const { return mat.size(); }     // 行\n    int col() const { return mat[0].size(); }  // 列\n    std::vector<int> &operator[](int k) { return mat[k]; }\n    const std::vector<int> &operator[](int k) const { return mat[k]; }\n    Mat operator*(const Mat &rhs) const {\n        assert(col() == rhs.row());\n        Mat ans(row(), rhs.col());\n        for (int i = 0; i != ans.row(); ++i)\n            for (int k = 0; k != col(); ++k)\n                for (int j = 0; j != ans.col(); ++j)\n                    ans[i][j] = (ans[i][j] + static_cast<long long>(this->operator[](i)[k]) * rhs[k][j]) % P;\n        return ans;\n    }\n};\n}  // namespace test\n\nusing test::Mat;\n\nusing namespace std;\nusing ll = long long;\nusing ull = unsigned long long;\nconst int N = 1e5 + 5;\nint main() {\n#ifdef LOCAL\n    freopen("..\\\\in", "r", stdin), freopen("..\\\\out", "w", stdout);\n#endif\n    ios::sync_with_stdio(false);\n    cin.tie(0);\n    int n, m, p;\n    cin >> n >> m >> p;\n    Mat a(n, m), b(m, p);\n    for (int i = 0; i != n; ++i) {\n        for (int j = 0; j != m; ++j) {\n            int v;\n            cin >> v;\n            if (v < 0)\n                v += test::P;\n            a[i][j] = v;\n        }\n    }\n    for (int i = 0; i != m; ++i) {\n        for (int j = 0; j != p; ++j) {\n            int v;\n            cin >> v;\n            if (v < 0)\n                v += test::P;\n            b[i][j] = v;\n        }\n    }\n    Mat c = a * b;\n    for (int i = 0; i != c.row(); ++i) {\n        for (int j = 0; j != c.col(); ++j) {\n            cout << c[i][j] << ' ';\n        }\n        cout << '\\n';\n    }\n    return 0;\n}	-1	{"err": null, "data": [{"error": 0, "memory": 1490944, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "caa40a9334712f011a3417434129cf12"}, {"error": 0, "memory": 1499136, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "b717baf32136167f90a18e90edca4405"}, {"error": 0, "memory": 1503232, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "7d3e0ea50a4020a5a304231c0167c588"}, {"error": 0, "memory": 1544192, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 4, "test_case": "4", "output_md5": "a6816ec1f65af0b06967068850ab92de"}, {"error": 0, "memory": 2351104, "output": null, "result": -1, "signal": 0, "cpu_time": 43, "exit_code": 0, "real_time": 49, "test_case": "5", "output_md5": "29c481018cb084f7463debbd9578be67"}, {"error": 0, "memory": 4513792, "output": null, "result": -1, "signal": 0, "cpu_time": 244, "exit_code": 0, "real_time": 252, "test_case": "6", "output_md5": "dc121e3c3da79a55304a7ea1bce62ffc"}, {"error": 0, "memory": 1560576, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "7", "output_md5": "28a1c4847a00d26fc1c71e3b767c8c27"}, {"error": 0, "memory": 2080768, "output": null, "result": -1, "signal": 0, "cpu_time": 19, "exit_code": 0, "real_time": 24, "test_case": "8", "output_md5": "601018ef67e7c91ceb7d35e38b938eba"}, {"error": 0, "memory": 4509696, "output": null, "result": -1, "signal": 0, "cpu_time": 236, "exit_code": 0, "real_time": 244, "test_case": "9", "output_md5": "9803a2dbc3c5b437c3810830c0156d04"}, {"error": 0, "memory": 1486848, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "10", "output_md5": "062698785b2c47550e96b5bde0fadd7b"}]}	C++	f	{"time_cost": 244, "memory_cost": 4513792}	douzefan	110.243.177.246
59534d8e9994f1b7e5e1337a1fcfc367	\N	24	2020-06-18 16:18:33.59139+00	1	#include<iostream>\n#include<cstdio>\n#include<queue>\n#include<cstring>\nusing namespace std;\nconst int N = 1e6 + 10;\ninline int read() {\n\tint s = 0, w = 1;\n\tchar ch = getchar();\n\twhile(ch < '0' || ch > '9') {if(ch == '-')w = -1; ch = getchar();}\n\twhile(ch >= '0' && ch <= '9')s = s * 10 + ch - '0', ch = getchar();\n\treturn s * w; \t\n}\n\nchar A[N], B[N];\nint a[N], b[N], c[N];\nint main() {\n\tcin >> A >> B;\n\tint lena = strlen(A), lenb = strlen(B);\n\tfor(int i = 0; i < lena; i++) {\n\t\ta[lena - i - 1] = A[i] - '0';\n\t}\n\tfor(int i = 0; i < lenb; i++) {\n\t\tb[lenb - i - 1] = B[i] - '0';\n\t}\n\tfor(int i = 0; i < lena; i++) {\n\t\tfor(int j = 0; j < lenb; j++) {\n\t\t\tc[i + j] += a[i] * b[j];\n\t\t}\n\t}\n\tint len = lena + lenb, tmp = 0;\n\tfor(int i = 0; i < len; i++) {\n\t\tc[i] += tmp;\n\t\ttmp = c[i] / 10;\n\t\tc[i] %= 10;\n\t}\n\twhile(!c[len] && len > 0) {\n\t\tlen--;\n\t}\n\tfor(int i = len; i >= 0; i--) {\n\t\tprintf("%d", c[i]);\n\t}\n\treturn 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 7741440, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "1", "output_md5": "1679091c5a880faf6fb5e6087eb1b2dc"}, {"error": 0, "memory": 7745536, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 4, "test_case": "2", "output_md5": "b4943cb7b16c54299a42f9ab3da7beba"}, {"error": 0, "memory": 7749632, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "3", "output_md5": "6459e30151c13d1900d98ddc99252e50"}, {"error": 0, "memory": 7749632, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "4", "output_md5": "49e6feddc2f12fd07b5b36b555b51d52"}, {"error": 0, "memory": 7745536, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 4, "test_case": "5", "output_md5": "c16553c9bd086693cfcf04e07f4b379a"}, {"error": 0, "memory": 7753728, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "6", "output_md5": "406045249a99eeb87f501b2164812780"}, {"error": 0, "memory": 7749632, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "7", "output_md5": "cb772c8b3be5a032f3e6171e5afcd0e5"}, {"error": 0, "memory": 7749632, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "8", "output_md5": "5d46085b001bbeae8e6ea93aff45b3b5"}, {"error": 0, "memory": 7749632, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "9", "output_md5": "14fea38909d088b8d9b2f622c60bd48e"}, {"error": 0, "memory": 7745536, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "10", "output_md5": "95f03d44eafcaa459fbd8c00b4ca3257"}]}	C++	f	{"time_cost": 1, "memory_cost": 7753728}	root	121.28.131.82
ebcf9a333cb0b7a4e47b9f8d677dc9cf	\N	34	2020-06-19 06:18:42.241144+00	9	#include <bits/stdc++.h>\n#define N 500100\nusing namespace std;\nint read() {\n    int x = 0, f = 1;\n    char c = getchar();\n    while (c > '9' || c < '0') {\n        if (c == '-')\n            f = -1;\n        c = getchar();\n    }\n    while (c >= '0' && c <= '9') {\n        x = x * 10 + c - '0';\n        c = getchar();\n    }\n    return x * f;\n}\nchar ch[N], shit[] = { '@', '#', '$', '%', '^', '&', '!', '?', '>', '<', '*', '(', ')' };\nint sa[N], rk[N], tax[N], x[N], y[N], a[N], b[N], n, m, num, ans, height[N], t, all, flag;\nvoid get_sa() {\n    for (int i = 1; i <= n; ++i) ++tax[x[i] = ch[i]];\n    for (int i = 1; i <= m; ++i) tax[i] += tax[i - 1];\n    for (int i = n; i >= 1; i--) sa[tax[x[i]]--] = i;\n    for (int k = 1; k <= n; k <<= 1) {\n        num = 0;\n        for (int i = n - k + 1; i <= n; ++i) y[++num] = i;\n        for (int i = 1; i <= n; ++i)\n            if (sa[i] > k)\n                y[++num] = sa[i] - k;\n        for (int i = 1; i <= m; ++i) tax[i] = 0;\n        for (int i = 1; i <= n; ++i) ++tax[x[i]];\n        for (int i = 1; i <= m; ++i) tax[i] += tax[i - 1];\n        for (int i = n; i >= 1; i--) sa[tax[x[y[i]]]--] = y[i], y[i] = 0;\n        swap(x, y);\n        num = 1;\n        x[sa[1]] = 1;\n        for (int i = 2; i <= n; ++i)\n            x[sa[i]] = (y[sa[i]] == y[sa[i - 1]] && y[sa[i] + k] == y[sa[i - 1] + k]) ? num : ++num;\n        if (num == n)\n            break;\n        m = num;\n    }\n    for (int i = 1; i <= n; ++i) rk[sa[i]] = i;\n}\nvoid get_height() {\n    int now = 0;\n    for (int i = 1; i <= n; ++i) {\n        if (rk[i] == 1)\n            continue;\n        if (now > 0)\n            --now;\n        int j = sa[rk[i] - 1];\n        while (j + now <= n && i + now <= n && ch[i + now] == ch[j + now]) ++now;\n        height[rk[i]] = now;\n    }\n}\nint belong[N];\nbool check(int k) {\n    int lat = 0;\n    for (int i = 1; i <= n; ++i) {\n        if (height[i] < k) {\n            flag = 0;\n            for (int j = lat; j < i; ++j)\n                if (belong[sa[j]])\n                    flag |= (1 << (belong[sa[j]] - 1));\n            if (flag == (1 << t) - 1)\n                return 1;\n            lat = i;\n        }\n    }\n    return 0;\n}\nvoid get_ans() {\n    int l = 1, r = n, mid, ans;\n    while (l <= r) {\n        mid = (l + r) >> 1;\n        if (check(mid))\n            l = mid + 1, ans = mid;\n        else\n            r = mid - 1;\n    }\n    printf("%d", ans);\n}\nint main() {\n    t = read();\n    int nnn;\n    for (int i = 1; i <= t; ++i) {\n        scanf("%s", ch + n + 1);\n        nnn = n + 1;\n        n += strlen(ch + n + 1);\n        for (int j = nnn; j <= n; ++j) belong[j] = i;\n        ch[++n] = shit[i];\n    }\n    m = 300;\n    get_sa();\n    get_height();\n    get_ans();\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 5488640, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 6, "test_case": "1", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}, {"error": 0, "memory": 5488640, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 6, "test_case": "2", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 5492736, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 5, "test_case": "3", "output_md5": "a87ff679a2f3e71d9181a67b7542122c"}, {"error": 0, "memory": 5496832, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 6, "test_case": "4", "output_md5": "45c48cce2e2d7fbdea1afc51c7c6ad26"}, {"error": 0, "memory": 5500928, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 6, "test_case": "5", "output_md5": "c9f0f895fb98ab9159f51fd0297e236d"}, {"error": 0, "memory": 5505024, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 5, "test_case": "6", "output_md5": "a87ff679a2f3e71d9181a67b7542122c"}, {"error": 0, "memory": 5636096, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 9, "test_case": "7", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}]}	C++	f	{"time_cost": 3, "memory_cost": 5636096}	alice	111.165.158.111
d115af5d1cc71245f2b35f63ae41ee9e	\N	1	2020-06-19 08:14:37.347938+00	14	#include<stdio.h>\nint main(){\nint a,b;\n  scanf("%d%d",&a,&b);\n\tprintf("%d",a+b);  \n  return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/34e041a866a04132a9807fcbfa21dca8/main.c:10:5: error: redefinition of 'main'\\n int main() {\\n     ^\\n/judger/run/34e041a866a04132a9807fcbfa21dca8/main.c:4:5: note: previous definition of 'main' was here\\n int main(){\\n     ^"}	pku_zbt	183.214.21.105
f9f77935074a8d33d5d1388476f1ac13	\N	1	2020-06-16 17:52:31.024129+00	12	int main(){\n\n  int a, b;\n  cin>>a>>b;\n  cout<< a+b;\n  return 0;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/bfebc3abc7704ef793407fe7dae2d044/main.cpp: In function 'int main()':\\n/judger/run/bfebc3abc7704ef793407fe7dae2d044/main.cpp:4:3: error: 'cin' was not declared in this scope\\n   cin>>a>>b;\\n   ^\\n/judger/run/bfebc3abc7704ef793407fe7dae2d044/main.cpp:5:3: error: 'cout' was not declared in this scope\\n   cout<< a+b;\\n   ^"}	tsj	222.140.140.224
b585cd953a560460b363a5f9e066979b	\N	14	2020-06-18 10:36:04.567481+00	3	#include <iostream>\n#include <vector>\n#include <string>\n#include <unordered_map>\nusing namespace std;\n\n\nclass Solution {\npublic:\n\tvector<int> twoSum(vector<int>& nums, int target) {\n\t\tunordered_map<int,int> m;\n\n        for(int i = 0; i<nums.size(); i++)\n            m[nums[i]] = i;         //向map中添加元素\n        \n        for(int i = 0; i<nums.size(); i++)\n        {\n            if(m.find(target-nums[i]) != m.end() && m[target-nums[i]] != i)  //如果m中存在对应的键值，且不为i\n                return {i, m[target-nums[i]]};\n        }\n        return {};\n\t}\n};\n\nvoid SplitString(const string& s, vector<int>& v, const string& c)\n{\n\tstring::size_type pos1, pos2;\n\tpos2 = s.find(c);\n\tpos1 = 0;\n\twhile (string::npos != pos2)\n\t{\n\t\tv.push_back(atoi(s.substr(pos1, pos2 - pos1).c_str()));\n\n\t\tpos1 = pos2 + c.size();\n\t\tpos2 = s.find(c, pos1);\n\t}\n\tif (pos1 != s.length())\n\t\tv.push_back(atoi(s.substr(pos1).c_str()));\n}\nint main() {\n\n\tSolution* solution = new Solution();\n\n\tstring input1;\n\n\tint target;\n\tcin >> input1;\n\tcin >> target;\n\n\tvector<int> nums;\n\t\n\tSplitString(input1, nums, ","); \n\t\n\tvector<int> res=solution->twoSum(nums, target);\n\n\t\n\tfor (int i = 0; i < res.size(); i++)\n\t\tif (i != res.size() - 1) cout << res[i] << ",";\n\t\telse cout << res[i];\n\t\n\treturn 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1515520, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "d192e0c4ad64a9c35fe32972477e4cd8"}, {"error": 0, "memory": 1507328, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "93e7709cfdece731b854c055e03e8565"}, {"error": 0, "memory": 1507328, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "05cf281c050be3da4eecf3bc6e8aac1b"}, {"error": 0, "memory": 1503232, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "4", "output_md5": "aa2cccd504827fae2b924b9b334db92c"}, {"error": 0, "memory": 1515520, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 21, "test_case": "5", "output_md5": "bff25630ffd02cdeeaabc2114909b7a3"}, {"error": 0, "memory": 1515520, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 20, "test_case": "6", "output_md5": "e355e4dab36951a7a989d4d54d02e01c"}, {"error": 0, "memory": 1507328, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "7", "output_md5": "624d82924638812b15441cb6e2369f1a"}, {"error": 0, "memory": 1515520, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "8", "output_md5": "bff25630ffd02cdeeaabc2114909b7a3"}, {"error": 0, "memory": 1507328, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 19, "test_case": "9", "output_md5": "88f4dade459df94417af63375959ad0b"}, {"error": 0, "memory": 1511424, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "10", "output_md5": "aa2cccd504827fae2b924b9b334db92c"}, {"error": 0, "memory": 1511424, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "11", "output_md5": "c6579aaf5457eee679bb88bc31162a3d"}, {"error": 0, "memory": 1515520, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "12", "output_md5": "e355e4dab36951a7a989d4d54d02e01c"}, {"error": 0, "memory": 1519616, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 20, "test_case": "13", "output_md5": "43f33b829be54f52bda9ac278ecb7775"}, {"error": 0, "memory": 1519616, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "14", "output_md5": "d84af6b72855fd556d52334724ee10ac"}, {"error": 0, "memory": 1527808, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "15", "output_md5": "3f737584580d57bc21fe16e48f6f0b93"}, {"error": 0, "memory": 1548288, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "16", "output_md5": "105dc25b1b8d5cd9a5b8e4200cfac78c"}, {"error": 0, "memory": 1519616, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "17", "output_md5": "8af10ccfd7478c4ab2521af2fc25ddb3"}, {"error": 0, "memory": 1556480, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "18", "output_md5": "fb6f482d7e893491f927e9cb49c58c0e"}, {"error": 0, "memory": 1527808, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "19", "output_md5": "253b81c521c6293bf46225fd28e255f6"}, {"error": 0, "memory": 1548288, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "20", "output_md5": "d7a2552dea33818fe4ea321cab73a0ba"}, {"error": 0, "memory": 2080768, "output": null, "result": 0, "signal": 0, "cpu_time": 5, "exit_code": 0, "real_time": 7, "test_case": "21", "output_md5": "9e959712105fa93a8076769b062ddb81"}]}	C++	f	{"time_cost": 5, "memory_cost": 2080768}	douzefan	110.243.177.246
e9d4a5c451db4b7c4f065290cb670f63	\N	21	2020-06-18 13:42:48.724246+00	3	#include <cstdio>\n#include <algorithm>\n#include <cstring>\n\ntypedef long long ll;\n\nconst int N = 500;\nconst ll P = 1e9 + 7;\n\nstruct Matrix {\n    int n, m;\n    ll a[N + 10][N + 10];\n\n    Matrix() {\n        n = m = 0;\n        memset(a, 0, sizeof(a));\n    }\n\n    ll* operator[](int i) { return a[i]; }\n};\n\ninline Matrix operator*(Matrix a, Matrix b) {\n    Matrix res;\n    res.n = a.n;\n    res.m = b.m;\n    for (int i = 1; i <= a.n; i++)\n        for (int j = 1; j <= b.m; j++)\n            for (int k = 1; k <= a.m; k++) res[i][j] = ((res[i][j] + a[i][k] * b[k][j] % P) + P) % P;\n    return res;\n}\n\nMatrix A, B;\nint n, m, p;\n\nint main() {\n    scanf("%d%d%d", &n, &p, &m);\n    A.n = n, A.m = p;\n    B.n = p, B.m = m;\n    for (int i = 1; i <= n; i++)\n        for (int j = 1; j <= p; j++) scanf("%lld", &A[i][j]);\n    for (int i = 1; i <= p; i++)\n        for (int j = 1; j <= m; j++) scanf("%lld", &B[i][j]);\n    Matrix res = A * B;\n    for (int i = 1; i <= n; i++) {\n        for (int j = 1; j <= m; j++) printf("%lld ", res[i][j]);\n        puts("");\n    }\n    return 0;\n}	-1	{"err": null, "data": [{"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 7, "test_case": "1", "output_md5": "caa40a9334712f011a3417434129cf12"}, {"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 6, "test_case": "2", "output_md5": "b717baf32136167f90a18e90edca4405"}, {"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 5, "test_case": "3", "output_md5": "7d3e0ea50a4020a5a304231c0167c588"}, {"error": 0, "memory": 10985472, "output": null, "result": -1, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 8, "test_case": "4", "output_md5": "a6816ec1f65af0b06967068850ab92de"}, {"error": 0, "memory": 10977280, "output": null, "result": -1, "signal": 0, "cpu_time": 107, "exit_code": 0, "real_time": 111, "test_case": "5", "output_md5": "29c481018cb084f7463debbd9578be67"}, {"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 718, "exit_code": 0, "real_time": 725, "test_case": "6", "output_md5": "dc121e3c3da79a55304a7ea1bce62ffc"}, {"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 5, "test_case": "7", "output_md5": "28a1c4847a00d26fc1c71e3b767c8c27"}, {"error": 0, "memory": 10981376, "output": null, "result": -1, "signal": 0, "cpu_time": 39, "exit_code": 0, "real_time": 44, "test_case": "8", "output_md5": "601018ef67e7c91ceb7d35e38b938eba"}, {"error": 0, "memory": 10985472, "output": null, "result": -1, "signal": 0, "cpu_time": 777, "exit_code": 0, "real_time": 786, "test_case": "9", "output_md5": "9803a2dbc3c5b437c3810830c0156d04"}, {"error": 0, "memory": 10981376, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 6, "test_case": "10", "output_md5": "062698785b2c47550e96b5bde0fadd7b"}]}	C++	f	{"time_cost": 777, "memory_cost": 10985472}	douzefan	110.243.177.246
f2eefb5fd11e43a324a023c2db3a89a8	\N	33	2020-06-19 06:19:50.459563+00	9	#include <iostream>\n#include <cstring>\n#include <cstdio>\nusing namespace std;\n#define N 1048577\nint n;\nchar sc[N];\nint main() {\n    scanf("%s", sc + 1);\n    n = strlen(sc + 1);\n    int i, j, k, p;\n    for (i = 1; i <= n;) {\n        j = i;\n        k = i + 1;\n        for (; sc[j] <= sc[k]; ++k)\n            if (sc[j] == sc[k])\n                ++j;\n            else\n                j = i;\n        p = k - j;\n        for (; i <= j; i += p) printf("%d ", i + p - 1);\n    }\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "a128adf6667c027e0cb6576b1edc6eb9"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "2", "output_md5": "3d7438cbe30e6d569f0e504786f0bae9"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "0b03e41b71497863a8a251d039a515f9"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "e9aa9f133ab4468b4564af29603270c0"}, {"error": 0, "memory": 1548288, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "5", "output_md5": "606c287ff48702ae1238b2fe5c8ac255"}, {"error": 0, "memory": 1548288, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "26d198a764aa5c0cea3b9d3c185453d9"}, {"error": 0, "memory": 1748992, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "7", "output_md5": "2b71385a5486036bd43112bbd76cd089"}, {"error": 0, "memory": 1662976, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 3, "test_case": "8", "output_md5": "81ab4ff47e704616220236cbc33ebd92"}, {"error": 0, "memory": 2502656, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 5, "test_case": "9", "output_md5": "d991b685ae0d51709070ea76a667ca9e"}, {"error": 0, "memory": 2506752, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 5, "test_case": "10", "output_md5": "4e8b3ae3624ed0a5c2a5c044a93abe98"}, {"error": 0, "memory": 2506752, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 74, "test_case": "11", "output_md5": "c9d8ce4d759dc115f234c42b0fe492b0"}]}	C++	f	{"time_cost": 66, "memory_cost": 2506752}	alice	111.165.158.111
5c3e296dd23cb671b033c3b5aae4224a	\N	30	2020-06-19 06:27:20.820809+00	9	#include <iostream>\n#include <cstdio>\n#include <cstring>\n#include <algorithm>\n\nusing namespace std;\ntypedef long long ll;\ninline int qr() {\n    int ret = 0, f = 0, c = getchar();\n    while (!isdigit(c)) f |= c == 45, c = getchar();\n    while (isdigit(c)) ret = ret * 10 + c - 48, c = getchar();\n    return f ? -ret : ret;\n}\nconst int maxn = 1e6 + 5;\nchar A[maxn], B[maxn];\nint nx[maxn];\n\nint main() {\n    cin >> (B + 1) >> (A + 1);\n    nx[0] = nx[1] = 0;\n    int n = strlen(A + 1);\n    for (int t = 2; t <= n; ++t) {\n        nx[t] = nx[t - 1];\n        while (nx[t] && A[t] != A[nx[t] + 1]) nx[t] = nx[nx[t]];\n        if (A[t] == A[nx[t] + 1])\n            ++nx[t];\n    }\n    int ans = 0;\n    for (int t = 1, p = 0, m = strlen(B + 1); t <= m; ++t) {\n        while (p && A[p + 1] != B[t]) p = nx[p];\n        if (A[p + 1] == B[t])\n            ++p;\n        if (p == n)\n            p = nx[p], ++ans;\n    }\n    cout << ans << endl;\n    return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/8e9a4d64e3fa43ca820ecbdd2a3c8242/main.c:1:20: fatal error: iostream: No such file or directory\\ncompilation terminated."}	alice	111.165.158.111
3cfeb0c7a2b534f21a6a06c180109ba9	\N	26	2020-06-19 06:41:41.500221+00	9	#include "interaction.h"\n#include <algorithm>\n#include <iostream>\n#include <cstring>\n#include <iomanip>\n#include <cstdio>\n#include <vector>\n#include <queue>\n#include <cmath>\n#define GET getchar()\n#define LL long long\nusing namespace std;\n\nnamespace FastIO {\ninline int read() {\n    int s = 0, f = 1;\n    char t = GET;\n    while ('0' > t || t > '9') {\n        if (t == '-')\n            f = -1;\n        t = GET;\n    }\n    while ('0' <= t && t <= '9') {\n        s = (s << 1) + (s << 3) + t - '0';\n        t = GET;\n    }\n    return s * f;\n}\n}  // namespace FastIO\nusing FastIO::read;\n\nint n;\nvector<int> Ans;\n\nint main() {\n    int n = get_num();\n    for (int i = 0, flg; i < n; i++) {\n        int l = 0, r = 1000000, md;\n        while (l <= r) {\n            md = (l + r) >> 1;\n            flg = guess(i, md);\n            if (flg == 0) {\n                Ans.push_back(md);\n                break;\n            } else if (flg == -1)\n                l = md + 1;\n            else\n                r = md - 1;\n        }\n    }\n    submit(Ans);\n    return 0;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/6bab744214da49ef80a063c55f9cc9a4/main.cpp:1:25: fatal error: interaction.h: No such file or directory\\ncompilation terminated."}	alice	111.165.158.111
48e23b5e3fcd4eb4fa9087b73cc8d6f7	\N	1	2020-06-16 17:52:40.887462+00	12	int main(){\n\n  int a, b;\n  cin>>a>>b;\n  cout<< a+b;\n  return 0;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/f07f5be0ec774451b562b62b198e1aca/main.cpp: In function 'int main()':\\n/judger/run/f07f5be0ec774451b562b62b198e1aca/main.cpp:4:3: error: 'cin' was not declared in this scope\\n   cin>>a>>b;\\n   ^\\n/judger/run/f07f5be0ec774451b562b62b198e1aca/main.cpp:5:3: error: 'cout' was not declared in this scope\\n   cout<< a+b;\\n   ^"}	tsj	222.140.140.224
c700729b10067e41415ec338b4900683	\N	16	2020-06-18 11:08:24.698372+00	3	#include <iostream>\n#include <cstring>\n#include <cstdio>\n#include <algorithm>\n#include <vector>\nusing namespace std;\nchar a[200005], b[200005];\nstruct Suffix_automaton {\n    int ch[400005][26];\n    int last = 1, tot = 1, len[400005], fa[400005];\n    long long cnt[400005];\n    void add(int c) {\n        int p = last, np = ++tot;\n        cnt[np]++;\n        last = tot;\n        len[np] = len[p] + 1;\n        while (p && !ch[p][c]) {\n            ch[p][c] = np;\n            p = fa[p];\n        }\n        if (!p)\n            fa[np] = 1;\n        else {\n            int q = ch[p][c];\n            if (len[q] == len[p] + 1)\n                fa[np] = q;\n            else {\n                int nq = ++tot;\n                memcpy(ch[nq], ch[q], sizeof(ch[q]));\n                fa[nq] = fa[q], len[nq] = len[p] + 1;\n                fa[q] = fa[np] = nq;\n                while (p && ch[p][c] == q) {\n                    ch[p][c] = nq;\n                    p = fa[p];\n                }\n            }\n        }\n    }\n    int p[200005], p2[400005];\n    void total(int l) {\n        for (int i = 1; i <= tot; i++) p[len[i]]++;\n        for (int i = 1; i <= l; i++) p[i] += p[i - 1];\n        for (int i = 1; i <= tot; i++) p2[p[len[i]]--] = i;\n        for (int i = tot; i >= 1; i--) cnt[fa[p2[i]]] += cnt[p2[i]];\n    }\n} A, B;\nlong long ans;\nvoid dfs(int ua, int ub) {\n    for (int i = 0; i < 26; i++) {\n        int va = A.ch[ua][i], vb = B.ch[ub][i];\n        if (va && vb)\n            dfs(va, vb);\n    }\n    if (ua != 1 && ub != 1)\n        ans = ans + A.cnt[ua] * B.cnt[ub];\n}\nint main() {\n    scanf("%s\\n%s", a, b);\n    int n = strlen(a), m = strlen(b);\n    for (int i = 0; i < n; i++) A.add(a[i] - 'a');\n    for (int i = 0; i < m; i++) B.add(b[i] - 'a');\n    A.total(n), B.total(m);\n    dfs(1, 1);\n    cout << ans;\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 24657920, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 7, "test_case": "1", "output_md5": "2e58f820119de04e04c4142464f407bc"}, {"error": 0, "memory": 24633344, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 6, "test_case": "2", "output_md5": "c7b3a3e910cb7481d0993204fd056e61"}, {"error": 0, "memory": 24625152, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 6, "test_case": "3", "output_md5": "adcfede3f8b337bf3888aad371197642"}, {"error": 0, "memory": 24645632, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 18, "test_case": "4", "output_md5": "544bb1b3d0d2c7a232372d95d1c9e752"}, {"error": 0, "memory": 25591808, "output": null, "result": 0, "signal": 0, "cpu_time": 7, "exit_code": 0, "real_time": 12, "test_case": "5", "output_md5": "c43ff541e595f5663b8dc1ac6454b693"}, {"error": 0, "memory": 25600000, "output": null, "result": 0, "signal": 0, "cpu_time": 6, "exit_code": 0, "real_time": 12, "test_case": "6", "output_md5": "7c34adc53a1ac7037f72ed315fa60481"}, {"error": 0, "memory": 25587712, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 14, "test_case": "7", "output_md5": "73aeeaaa58f136de6dba103996366492"}, {"error": 0, "memory": 25571328, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 14, "test_case": "8", "output_md5": "4cc9f21cb8ebf110768a8046d2303adf"}, {"error": 0, "memory": 102625280, "output": null, "result": 0, "signal": 0, "cpu_time": 464, "exit_code": 0, "real_time": 492, "test_case": "9", "output_md5": "1b51d8990f79b80b731d6ec2d5b4f15c"}, {"error": 0, "memory": 102625280, "output": null, "result": 0, "signal": 0, "cpu_time": 389, "exit_code": 0, "real_time": 455, "test_case": "10", "output_md5": "261219a4dfa2c159ec36b3ce4a639f9d"}, {"error": 0, "memory": 102641664, "output": null, "result": 0, "signal": 0, "cpu_time": 402, "exit_code": 0, "real_time": 446, "test_case": "11", "output_md5": "33993567bd8f88741ea2f17e4b01c2c7"}, {"error": 0, "memory": 102621184, "output": null, "result": 0, "signal": 0, "cpu_time": 448, "exit_code": 0, "real_time": 466, "test_case": "12", "output_md5": "67ad4823c27b228aef36ff860d68a33c"}, {"error": 0, "memory": 102629376, "output": null, "result": 0, "signal": 0, "cpu_time": 424, "exit_code": 0, "real_time": 451, "test_case": "13", "output_md5": "8b8b9f392df0f321792098bc605a642b"}, {"error": 0, "memory": 102612992, "output": null, "result": 0, "signal": 0, "cpu_time": 429, "exit_code": 0, "real_time": 504, "test_case": "14", "output_md5": "607477d99ee535c34b826d94bd9b84b2"}, {"error": 0, "memory": 102612992, "output": null, "result": 0, "signal": 0, "cpu_time": 459, "exit_code": 0, "real_time": 487, "test_case": "15", "output_md5": "8f717e90520c9ee7eaff7523aa0a9ba6"}, {"error": 0, "memory": 102633472, "output": null, "result": 0, "signal": 0, "cpu_time": 436, "exit_code": 0, "real_time": 463, "test_case": "16", "output_md5": "370b5ac529976220b40a244449576d5a"}, {"error": 0, "memory": 102633472, "output": null, "result": 0, "signal": 0, "cpu_time": 466, "exit_code": 0, "real_time": 500, "test_case": "17", "output_md5": "23563208e5794aa8e31ab64843244d7d"}, {"error": 0, "memory": 102617088, "output": null, "result": 0, "signal": 0, "cpu_time": 435, "exit_code": 0, "real_time": 490, "test_case": "18", "output_md5": "1837d0413a538593ff5f938b5678ec8c"}, {"error": 0, "memory": 102629376, "output": null, "result": 0, "signal": 0, "cpu_time": 438, "exit_code": 0, "real_time": 520, "test_case": "19", "output_md5": "f3f6baea4824dfcdc27840a0b2406c7f"}, {"error": 0, "memory": 102621184, "output": null, "result": 0, "signal": 0, "cpu_time": 448, "exit_code": 0, "real_time": 480, "test_case": "20", "output_md5": "7bd2cd0b4487dbf27714197f622d3267"}]}	C++	f	{"time_cost": 466, "memory_cost": 102641664}	douzefan	110.243.177.246
a56777b7e5ec0ddd98224605976a2d83	\N	21	2020-06-18 13:45:45.911459+00	3	// ====================================\n//   author: M_sea\n//   website: https://m-sea-blog.com/\n// ====================================\n#include <bits/stdc++.h>\n#define file(x)                    \\\n    freopen(#x ".in", "r", stdin); \\\n    freopen(#x ".out", "w", stdout)\nusing namespace std;\ntypedef long long ll;\n\nint read() {\n    int X = 0, w = 1;\n    char c = getchar();\n    while (c < '0' || c > '9') {\n        if (c == '-')\n            w = -1;\n        c = getchar();\n    }\n    while (c >= '0' && c <= '9') X = X * 10 + c - '0', c = getchar();\n    return X * w;\n}\n\nconst int N = 500 + 10;\nconst int mod = 1e9 + 7;\n\nint n, p, m, A[N][N], B[N][N], C[N][N];\n\nint main() {\n    n = read(), p = read(), m = read();\n    for (int i = 1; i <= n; ++i)\n        for (int j = 1; j <= p; ++j) A[i][j] = (read() + mod) % mod;\n    for (int i = 1; i <= p; ++i)\n        for (int j = 1; j <= m; ++j) B[i][j] = (read() + mod) % mod;\n    for (int i = 1; i <= n; ++i)\n        for (int j = 1; j <= m; ++j)\n            for (int k = 1; k <= p; ++k) C[i][j] = (C[i][j] + 1ll * A[i][k] * B[k][j]) % mod;\n    for (int i = 1; i <= n; ++i)\n        for (int j = 1; j <= m; ++j) printf("%d%c", C[i][j], " \\n"[j == m]);\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "8188be14bfa6bb89a99ec00db06a6d56"}, {"error": 0, "memory": 1507328, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "2", "output_md5": "2cd313982a67e1fcd9666bc9c5db5529"}, {"error": 0, "memory": 1531904, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "b4c2f1597f8183c55afd906399046e74"}, {"error": 0, "memory": 1871872, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 4, "test_case": "4", "output_md5": "02cf1fc06c350879b41068ff26d2213a"}, {"error": 0, "memory": 3485696, "output": null, "result": 0, "signal": 0, "cpu_time": 94, "exit_code": 0, "real_time": 100, "test_case": "5", "output_md5": "b16db3321c8bb01b2b3335a91222fa1b"}, {"error": 0, "memory": 4509696, "output": null, "result": 0, "signal": 0, "cpu_time": 607, "exit_code": 0, "real_time": 614, "test_case": "6", "output_md5": "a92d2426f2f22beb9b6b0ebbdb6ed544"}, {"error": 0, "memory": 3489792, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "7", "output_md5": "8792cc5da93d2c9ee1297c408e814371"}, {"error": 0, "memory": 2301952, "output": null, "result": 0, "signal": 0, "cpu_time": 31, "exit_code": 0, "real_time": 34, "test_case": "8", "output_md5": "74cb3a866118388d1abbfee9a1601134"}, {"error": 0, "memory": 4505600, "output": null, "result": 0, "signal": 0, "cpu_time": 588, "exit_code": 0, "real_time": 594, "test_case": "9", "output_md5": "d70da3288c1b403b95ac18a8f4636c1b"}, {"error": 0, "memory": 1449984, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "062698785b2c47550e96b5bde0fadd7b"}]}	C++	f	{"time_cost": 607, "memory_cost": 4509696}	douzefan	110.243.177.246
73658a8f089a17d473e8cfdb774835ae	\N	36	2020-06-19 06:14:43.186944+00	9	#include <cstdio>\n#include <algorithm>\n#include <cstring>\n#include <iostream>\n#include <cmath>\nusing namespace std;\ntypedef long long ll;\n\nint n;\nll ans = 0, num = 0;\nint prime[] = { 0, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31 };\n\nvoid dfs(int now, ll now_num, ll now_ans, int max_up) {\n    if (now_num > num) {\n        ans = now_ans;\n        num = now_num;\n    } else if (now_num == num && ans > now_ans) {\n        ans = now_ans;\n    }\n    for (int i = 1; i <= max_up; i++) {\n        now_ans *= prime[now];\n        if (now_ans > n)\n            break;\n        dfs(now + 1, now_num * (i + 1), now_ans, i);\n    }\n    return;\n}\n\nint main() {\n    scanf("%d", &n);\n    dfs(1, 1, 1, 31);\n    printf("%lld\\n", ans);\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "590fcadab00abacc5caaf30b51e91ad3"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "2", "output_md5": "2258d2991c26f9159cb37712732d2a1e"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "3", "output_md5": "76fcc6b5a9210c9cd97a2bd0d923a3df"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "4", "output_md5": "fe3942cf2fcd8d21fc2e8aa4204f088a"}, {"error": 0, "memory": 1466368, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "5", "output_md5": "338d2bbbe107778c9a09edb52567083f"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "6", "output_md5": "98df3958109a13af1768e2a3e1ba361b"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "7", "output_md5": "f6c3c2e182e37fe0d081850a8461f8e8"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "8", "output_md5": "a66449403a03c37fe06b15be37b6a7ef"}]}	C++	f	{"time_cost": 1, "memory_cost": 1466368}	alice	111.165.158.111
45f936d3020fd064a2292e2e7b909e12	\N	1	2020-06-16 17:50:55.007421+00	12	int add(int a, int b) {\n  // Please fill this blank\n  return ___a + b________;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/622319f5526546a19ad5788075c4b197/main.cpp: In function 'int add(int, int)':\\n/judger/run/622319f5526546a19ad5788075c4b197/main.cpp:3:10: error: '___a' was not declared in this scope\\n   return ___a + b________;\\n          ^\\n/judger/run/622319f5526546a19ad5788075c4b197/main.cpp:3:17: error: 'b________' was not declared in this scope\\n   return ___a + b________;\\n                 ^"}	tsj	222.140.140.224
1893c3c793190df448be7a9174861fc7	\N	22	2020-06-18 15:20:55.106095+00	1	#include <iostream>\n#include <cstdio>\nusing namespace std;\ntypedef long long ll;\nll n,a[1000]={1};\nint main()\n{\n\tscanf("%lld",&n);\n\tfor(ll i=1;i<=n;i++)a[i]=a[i-1]+a[i-4];\n\tprintf("%lld",a[n]);\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "aab3238922bcc25a6f606eb525ffdc56"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "14bfa6bb14875e45bba028a21ed38046"}, {"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "3", "output_md5": "fc221309746013ac554571fbd180e1c8"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "4", "output_md5": "7137debd45ae4d0ab9aa953017286b20"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "5", "output_md5": "cfcce0621b49c983991ead4c3d4d3b6b"}, {"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 3, "test_case": "6", "output_md5": "8557ce8d4d47173fb5788fa25b2aa3d9"}, {"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "7", "output_md5": "1ba70f224d5e3fd8a080b6cc72cde86d"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "8", "output_md5": "cbb75a3396bd5082c909684c57107e7d"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 2, "test_case": "9", "output_md5": "f28b4d0d43c67f1dca7a5e7682d9b6c6"}, {"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "10", "output_md5": "b0a34886815bf7924242bbcf33d3197c"}]}	C++	f	{"time_cost": 1, "memory_cost": 1458176}	root	121.28.131.82
1cecde539b718dd83a1900511f8c33d5	\N	35	2020-06-19 06:16:41.94563+00	9	#include <iostream>\n#include <cstdio>\nusing namespace std;\nint main() {\n    int n;\n    cin >> n;\n    for (register int i = 2;; ++i) {\n        if (n % i == 0) {\n            cout << n / i << endl;\n            return 0;\n        }\n    }\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "eccbc87e4b5ce2fe28308fd9f2a7baf3"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "70efdf2ec9b086079795c442636b55fb"}, {"error": 0, "memory": 1458176, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "3", "output_md5": "17e62166fc8586dfa4d1bc0e1742c08b"}, {"error": 0, "memory": 1462272, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "4", "output_md5": "37693cfc748049e45d87b8c7d8b9aacd"}, {"error": 0, "memory": 1454080, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "5", "output_md5": "3cf166c6b73f030b4f67eeaeba301103"}]}	C++	f	{"time_cost": 1, "memory_cost": 1462272}	alice	111.165.158.111
c2876fe3b3b2bbd4a1f9803318b7d693	\N	1	2020-06-16 13:18:31.334499+00	11	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	0	{"err": null, "data": [{"error": 0, "memory": 573440, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}]}	C	f	{"time_cost": 0, "memory_cost": 573440}	admin	1.87.179.33
1bf9a9ca1a1d64bbca343a4a7e8d14af	\N	1	2020-06-16 17:51:10.568126+00	12	int add(int a, int b) {\n  // Please fill this blank\n  return a + b;\n}	-2	{}	C++	f	{"score": 0, "err_info": "/usr/lib/gcc/x86_64-linux-gnu/5/../../../x86_64-linux-gnu/crt1.o: In function `_start':\\n(.text+0x20): undefined reference to `main'\\ncollect2: error: ld returned 1 exit status"}	tsj	222.140.140.224
af7837ac06928bec120dd0f43ffac274	\N	28	2020-06-19 06:48:22.142917+00	9	class Solution {\npublic:\n    vector<int> twoSum(vector<int>& numbers, int target) {\n        vector<int> a(2,0);\n        int low=0;int high=numbers.size()-1;int m;int mid;\n        while(low+1<high){\n            mid=(low+high)/2;\n            if(numbers[mid]<target){\n                low=mid;\n            }\n            else if(numbers[mid]>target){\n                high=mid;\n            }\n            else \n                high=mid;\n        }\n\n        if(target>0)\n            m=numbers[high]<=target?high:low;\n        else\n            m=numbers.size()-1;\n        \n        int start=0;int end=m;\n        while(start<end){\n            if(numbers[start]+numbers[end]==target){\n                a[0]=start+1;\n                a[1]=end+1;\n                return a;\n            }\n            else if(numbers[start]+numbers[end]<target){\n                start++;\n            }\n            else{\n                end--;\n            }\n\n        }\n        return a;\n        \n\n\n    }\n};	-2	{}	C++	f	{"score": 0, "err_info": "/judger/run/4b8bdbbacc3d4f0fb1db78dc3af17b03/main.cpp:3:5: error: 'vector' does not name a type\\n     vector<int> twoSum(vector<int>& numbers, int target) {\\n     ^"}	alice	111.165.158.111
3e845b36e6ea0024d6dfea04add01184	\N	17	2020-06-18 12:16:29.329444+00	3	#include <bits/stdc++.h>\nusing namespace std;\n\ntypedef long long ll;\ntypedef unsigned long long ull;\ntypedef long double ld;\n\nnamespace mlrb {\nconst int times = 10;\nconst int P[12] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37 };\n\ninline ll fm(ll a, ll b, const ll mod) {\n    ll c = (ld)a / mod * b;\n    ll res = (ull)a * b - (ull)c * mod;\n    return (res % mod + mod) % mod;\n}\n\ninline ll fp(ll a, ll b, const ll mod) {\n    ll tot = 1;\n    for (; b; a = fm(a, a, mod), b >>= 1)\n        if (b & 1)\n            tot = fm(tot, a, mod);\n    return tot;\n}\n\ninline bool isP(ll n) {\n    if (n == 1)\n        return false;\n    for (int i = 0; i < 12; ++i) {\n        if (n == P[i])\n            return true;\n        if (n % P[i] == 0)\n            return false;\n    }\n    ll r = 0, d = n - 1;\n    while ((d & 1) == 0) {\n        ++r;\n        d >>= 1;\n    }\n    srand(time(0));\n    for (int i = 1; i <= times; ++i) {\n        ll a = rand() % (n - 2) + 2, x = fp(a, d, n);\n        for (int j = 0; j < r; ++j) {\n            ll y = fm(x, x, n);\n            if (y == 1 && x != 1 && x != n - 1)\n                return false;\n            x = y;\n        }\n        if (x != 1)\n            return false;\n    }\n    return true;\n}\n}  // namespace mlrb\n\nll n;\n\nint main() {\n    while (scanf("%lld", &n) != EOF) {\n        if (mlrb::isP(n))\n            puts("Y");\n        else\n            puts("N");\n    }\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 419, "exit_code": 0, "real_time": 453, "test_case": "1", "output_md5": "fe935ff29e38b0e1eac461622bad3058"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 270, "exit_code": 0, "real_time": 283, "test_case": "2", "output_md5": "d7b8a7097f8cc06006589a56e7bafb3b"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 61, "exit_code": 0, "real_time": 63, "test_case": "3", "output_md5": "f7e21919108736c5a00a22449c7c40f0"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 63, "exit_code": 0, "real_time": 72, "test_case": "4", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 65, "exit_code": 0, "real_time": 71, "test_case": "5", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 71, "test_case": "6", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1441792, "output": null, "result": 0, "signal": 0, "cpu_time": 65, "exit_code": 0, "real_time": 72, "test_case": "7", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 73, "test_case": "8", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 64, "exit_code": 0, "real_time": 69, "test_case": "9", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 89, "test_case": "10", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 67, "exit_code": 0, "real_time": 69, "test_case": "11", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 69, "test_case": "12", "output_md5": "0bf807f1aef270bb0a8838af87aa1b23"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 28, "exit_code": 0, "real_time": 31, "test_case": "13", "output_md5": "fda28b5e24b97d7a3b3fc87485de88d1"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 37, "exit_code": 0, "real_time": 59, "test_case": "14", "output_md5": "0de70162686ace3a4102f5c7c3bd7352"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 22, "exit_code": 0, "real_time": 23, "test_case": "15", "output_md5": "c573c54476e2bcff384e556747a2a423"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 390, "exit_code": 0, "real_time": 393, "test_case": "16", "output_md5": "146c8128b4f2cbfe97c409744e86c9f6"}, {"error": 0, "memory": 1433600, "output": null, "result": 0, "signal": 0, "cpu_time": 16, "exit_code": 0, "real_time": 19, "test_case": "17", "output_md5": "07802fe93ae82e61b7000f72aabdcaee"}, {"error": 0, "memory": 1437696, "output": null, "result": 0, "signal": 0, "cpu_time": 127, "exit_code": 0, "real_time": 151, "test_case": "18", "output_md5": "f38bb7a6cf7a41cc9425761b4afc6f1e"}]}	C++	f	{"time_cost": 419, "memory_cost": 1441792}	douzefan	110.243.177.246
1d86d8db5f4bd95f3967b8e4686ffb75	\N	22	2020-06-18 15:21:41.438871+00	1	n=int(input())\nf=[0]*(n+9)\nf[0]=1\nfor i in range(1,n+1):\n  f[i]=f[i-1]+(f[i-4] if i>3 else 0)\nprint(f[n])	0	{"err": null, "data": [{"error": 0, "memory": 5902336, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "1", "output_md5": "aab3238922bcc25a6f606eb525ffdc56"}, {"error": 0, "memory": 5885952, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "2", "output_md5": "14bfa6bb14875e45bba028a21ed38046"}, {"error": 0, "memory": 5910528, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "3", "output_md5": "fc221309746013ac554571fbd180e1c8"}, {"error": 0, "memory": 5881856, "output": null, "result": 0, "signal": 0, "cpu_time": 12, "exit_code": 0, "real_time": 16, "test_case": "4", "output_md5": "7137debd45ae4d0ab9aa953017286b20"}, {"error": 0, "memory": 5910528, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "5", "output_md5": "cfcce0621b49c983991ead4c3d4d3b6b"}, {"error": 0, "memory": 5906432, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "6", "output_md5": "8557ce8d4d47173fb5788fa25b2aa3d9"}, {"error": 0, "memory": 5881856, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 18, "test_case": "7", "output_md5": "1ba70f224d5e3fd8a080b6cc72cde86d"}, {"error": 0, "memory": 5877760, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "8", "output_md5": "cbb75a3396bd5082c909684c57107e7d"}, {"error": 0, "memory": 5906432, "output": null, "result": 0, "signal": 0, "cpu_time": 13, "exit_code": 0, "real_time": 16, "test_case": "9", "output_md5": "f28b4d0d43c67f1dca7a5e7682d9b6c6"}, {"error": 0, "memory": 5885952, "output": null, "result": 0, "signal": 0, "cpu_time": 10, "exit_code": 0, "real_time": 16, "test_case": "10", "output_md5": "b0a34886815bf7924242bbcf33d3197c"}]}	Python3	f	{"time_cost": 13, "memory_cost": 5910528}	root	121.28.131.82
63a7ea41a6deee9c0d0f75d010fe3f2b	\N	34	2020-06-19 06:17:55.114545+00	9	#include <bits/stdc++.h>\nusing namespace std;\nint ans;\nint a[1000005], b[1000005];\nint sa[1000005];\nint cnt[1000005];\nint height[1000005];\nint _rank_[1000005];\nint dollar[1000005];\nstring str, str1;\nstruct sa_ {\n    void get_rank_() {\n        for (int i = 0; i < str.size(); i++) _rank_[sa[i]] = i;\n    }\n    void build(string str) {\n        int *x = a, *y = b, len = str.size(), m = 127;\n        memset(cnt, 0, sizeof(cnt));\n        for (int i = 0; i < len; i++) cnt[x[i] = (int)str[i]]++;\n        for (int i = 1; i <= m; i++) cnt[i] += cnt[i - 1];\n        for (int i = len - 1; i >= 0; i--) sa[--cnt[x[i]]] = i;\n        for (int p = 1; p <= len; p <<= 1) {\n            int w = 0;\n            for (int i = len - p; i < len; i++) y[w++] = i;\n            for (int i = 0; i < len; i++) {\n                if (sa[i] >= p)\n                    y[w++] = sa[i] - p;\n            }\n            memset(cnt, 0, sizeof(cnt));\n            for (int i = 0; i < len; i++) cnt[x[y[i]]]++;\n            for (int i = 1; i <= m; i++) cnt[i] += cnt[i - 1];\n            for (int i = len - 1; i >= 0; i--) sa[--cnt[x[y[i]]]] = y[i];\n            swap(x, y);\n            x[sa[0]] = 0;\n            w = 1;\n            for (int i = 1; i < len; i++)\n                x[sa[i]] = ((y[sa[i - 1]] == y[sa[i]] && y[sa[i - 1] + p] == y[sa[i] + p]) ? w - 1 : w++);\n            if (w >= len)\n                break;\n            m = w;\n        }\n        get_rank_();\n    }\n    void getheight() {\n        int k = 0;\n        for (int i = 0; i < str.size(); i++) {\n            if (_rank_[i] == 0)\n                continue;\n            k ? k-- : k;\n            int j = sa[_rank_[i] - 1];\n            while (str[i + k] == str[j + k]) k++;\n            height[_rank_[i]] = k;\n        }\n    }\n} SA;\nint main() {\n    int n, c = 0;\n    cin >> n;\n    cin >> str1;\n    str += str1;\n    dollar[++c] = str.size();\n    for (int i = 1; i < n; i++) {\n        cin >> str1;\n        str += ("#" + str1);\n        dollar[++c] = str.size();\n    }\n    SA.build(str);\n    SA.getheight();\n    for (int i = 1; i < str.size(); i++) {\n        bool con = 0;\n        for (int j = 1; j < c; j++) {\n            if ((sa[i] <= dollar[j] && sa[i] + height[i] >= dollar[j]) ||\n                (sa[i - 1] <= dollar[j] && sa[i - 1] + height[i] >= dollar[j])) {\n                con = 1;\n                break;\n            }\n        }\n        if (con)\n            continue;\n        ans = max(ans, height[i]);\n    }\n    cout << ans;\n}	-1	{"err": null, "data": [{"error": 0, "memory": 5529600, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 5, "test_case": "1", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}, {"error": 0, "memory": 5525504, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 3, "test_case": "2", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 5529600, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 5, "test_case": "3", "output_md5": "1679091c5a880faf6fb5e6087eb1b2dc"}, {"error": 0, "memory": 5537792, "output": null, "result": -1, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 4, "test_case": "4", "output_md5": "70efdf2ec9b086079795c442636b55fb"}, {"error": 0, "memory": 5541888, "output": null, "result": -1, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 4, "test_case": "5", "output_md5": "c74d97b01eae257e44aa9d5bade97baf"}, {"error": 0, "memory": 5550080, "output": null, "result": -1, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 6, "test_case": "6", "output_md5": "6512bd43d9caa6e02c990b0a82652dca"}, {"error": 0, "memory": 5718016, "output": null, "result": -1, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 8, "test_case": "7", "output_md5": "9bf31c7ff062936a96d3c8bd1f8f2ff3"}]}	C++	f	{"time_cost": 3, "memory_cost": 5718016}	alice	111.165.158.111
d03e683facc54613a9fa23c88c82b171	\N	29	2020-06-19 06:38:19.358272+00	9	#include <stdio.h>\nint reverse(int x){\n    int ret=0,max=0x7fffffff,min=0;\n    long rs=0;\n    for(;x;rs=rs*10+x%10,x/=10);\n    return ret=rs>max||rs<min?0:rs;\n}\nbool isPalindrome(int x){\n    return x==reverse(x);\n}\nint main(){\n   int a;\n  scanf("%d",&a);\n  if(isPalindrome(a)){\n    printf("true");\n  }\n  else{\n    printf("false");\n  }\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/5ab7a8c727444dccba4c22f0ac777b42/main.c:8:1: error: unknown type name 'bool'\\n bool isPalindrome(int x){\\n ^"}	alice	111.165.158.111
a9a5a5265e41f3fe2e0e5190ac14faea	\N	1	2020-06-19 07:00:50.084669+00	14	int add(int a, int b) {\n  // Please fill this blank\n  return a+b;\n}	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/21228f7976a14c6f8b97dd3a749142bc/solution.py\\", line 1\\n    int add(int a, int b) {\\n          ^\\nSyntaxError: invalid syntax"}	pku_zbt	183.214.21.105
3046a00f78448b761cc8754751c37112	\N	1	2020-06-16 12:54:34.729974+00	10	int add(int a, int b) {\n  // Please fill this blank\n  return a + b;\n}	-2	{}	Java	f	{"score": 0, "err_info": "/judger/run/d2c3231736894649a39a56306f6a33e8/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n^\\n/judger/run/d2c3231736894649a39a56306f6a33e8/Main.java:1: error: class, interface, or enum expected\\nint add(int a, int b) {\\n    ^\\n/judger/run/d2c3231736894649a39a56306f6a33e8/Main.java:4: error: class, interface, or enum expected\\n}\\n^\\n3 errors"}	dengluo	182.111.78.78
37763d6fa2d75d65d5831efd1567a49f	\N	1	2020-06-16 12:55:23.159862+00	10	int add(int a, int b) {\n  // Please fill this blank\n  return a + b;\n}	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/98316527c6014ed9a2c417274ebcc1ab/solution.py\\", line 1\\n    int add(int a, int b) {\\n          ^\\nSyntaxError: invalid syntax"}	dengluo	182.111.78.78
cc361f1b6a7d03eb41a3286cd489f122	\N	1	2020-06-16 12:55:42.787317+00	10	def add(int a, int b)\n\treturn a + b	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/ffafcba47def47d18ab6deef15e1df6f/solution.py\\", line 1\\n    def add(int a, int b)\\n                ^\\nSyntaxError: invalid syntax"}	dengluo	182.111.78.78
9d4c3a01a49d8de989d0ffaf1e786e96	\N	31	2020-06-19 06:20:45.482745+00	9	#include <bits/stdc++.h>\nusing namespace std;\nconst int N = 100005, E = 262144;\nconst double PI = 3.1415926535897932384626;\nint R[N * 4];\nint n, m, a[N], i, j;\nstruct com {\n    double x, y;\n} f[N * 4], g[N * 4];\ncom operator+(com a, com b) { return (com){ a.x + b.x, a.y + b.y }; }\ncom operator-(com a, com b) { return (com){ a.x - b.x, a.y - b.y }; }\ncom operator*(com a, com b) { return (com){ a.x * b.x - a.y * b.y, b.x * a.y + a.x * b.y }; }\nvoid FFT(com *f, int lim, int op) {\n    int i, j, k;\n    for (i = 1; i < lim; ++i) R[i] = (R[i >> 1] >> 1) | (i & 1 ? lim >> 1 : 0);\n    for (i = 0; i < lim; ++i)\n        if (R[i] < i)\n            swap(f[R[i]], f[i]);\n    for (i = 1; i < lim; i <<= 1)\n        for (j = 0; j < lim; j += (i << 1)) {\n            com wn = (com){ cos(PI / i), op * sin(PI / i) };\n            com s = (com){ 1, 0 };\n            for (k = j; k < j + i; ++k) {\n                com tmp = f[k + i] * s;\n                f[k + i] = f[k] - tmp;\n                f[k] = f[k] + tmp;\n                s = s * wn;\n            }\n        }\n    if (op == -1)\n        for (i = 0; i < lim; ++i) f[i].x /= lim, f[i].y /= lim;\n}\nint main() {\n    scanf("%d %d", &n, &m);\n    for (i = 0; i <= n; ++i) {\n        scanf("%d", &a[i]);\n        f[i].x = a[i];\n    }\n    for (i = 0; i <= m; ++i) {\n        scanf("%d", &a[i]);\n        g[i].x = a[i];\n    }\n    int lim = 1;\n    while (lim <= n + m) lim <<= 1;\n    FFT(f, lim, 1);\n    FFT(g, lim, 1);\n    for (i = 0; i < lim; ++i) f[i] = f[i] * g[i];\n    FFT(f, lim, -1);\n    for (i = 0; i <= n + m; ++i) printf("%d ", (int)(f[i].x + 0.5));\n}	0	{"err": null, "data": [{"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 58, "exit_code": 0, "real_time": 65, "test_case": "1", "output_md5": "bc077145667cda86074998e592fc1a67"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 63, "exit_code": 0, "real_time": 69, "test_case": "2", "output_md5": "b8068a72f6b29b45ddacbb41d445284a"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 61, "exit_code": 0, "real_time": 68, "test_case": "3", "output_md5": "b8068a72f6b29b45ddacbb41d445284a"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 60, "exit_code": 0, "real_time": 67, "test_case": "4", "output_md5": "48f408fa9e6ad293e4ae37c48e15a675"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 58, "exit_code": 0, "real_time": 168, "test_case": "5", "output_md5": "ba3af2db14047b8e8717059651eb11cc"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 59, "exit_code": 0, "real_time": 164, "test_case": "6", "output_md5": "ba3af2db14047b8e8717059651eb11cc"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 56, "exit_code": 0, "real_time": 64, "test_case": "7", "output_md5": "fff5d0682d9c1410fd9d6bffe8842dfa"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 63, "exit_code": 0, "real_time": 70, "test_case": "8", "output_md5": "f07fc2e0086a0229a0e75e0446aa6de7"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 66, "exit_code": 0, "real_time": 173, "test_case": "9", "output_md5": "f07fc2e0086a0229a0e75e0446aa6de7"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 57, "exit_code": 0, "real_time": 65, "test_case": "10", "output_md5": "401ea72cc28f72887ef6fd4cd5c3e5bc"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 58, "exit_code": 0, "real_time": 68, "test_case": "11", "output_md5": "cfd25c95aa21feb54872af45935b1f76"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 62, "exit_code": 0, "real_time": 68, "test_case": "12", "output_md5": "cfd25c95aa21feb54872af45935b1f76"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 59, "exit_code": 0, "real_time": 166, "test_case": "13", "output_md5": "62a55c7d2f731d15f2d25a6606038e8f"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 56, "exit_code": 0, "real_time": 66, "test_case": "14", "output_md5": "3e550b037f1224619333b011bce8fd2c"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 61, "exit_code": 0, "real_time": 67, "test_case": "15", "output_md5": "3e550b037f1224619333b011bce8fd2c"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 56, "exit_code": 0, "real_time": 65, "test_case": "16", "output_md5": "4f435449ab07a4b55fbc8fb35678ad59"}, {"error": 0, "memory": 11370496, "output": null, "result": 0, "signal": 0, "cpu_time": 59, "exit_code": 0, "real_time": 68, "test_case": "17", "output_md5": "87525689f680a5cab0b7f983f2e6dfec"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 60, "exit_code": 0, "real_time": 67, "test_case": "18", "output_md5": "87525689f680a5cab0b7f983f2e6dfec"}, {"error": 0, "memory": 11378688, "output": null, "result": 0, "signal": 0, "cpu_time": 61, "exit_code": 0, "real_time": 67, "test_case": "19", "output_md5": "763f53df06aa066a1128b6dfaa29ca26"}, {"error": 0, "memory": 11374592, "output": null, "result": 0, "signal": 0, "cpu_time": 59, "exit_code": 0, "real_time": 66, "test_case": "20", "output_md5": "35b266c371f45fb9201857005d10aa91"}]}	C++	f	{"time_cost": 66, "memory_cost": 11378688}	alice	111.165.158.111
46d7570c81bb2a167fd3d8eabaafc719	\N	30	2020-06-19 06:26:08.040259+00	9	#include <bits/stdc++.h>\n\n#define ui unsigned int\n#define ll long long\n#define ul unsigned ll\n#define ld long double\n\n#define pi pair<int, int>\n#define fi first\n#define se second\n#define mp make_pair\n\n#define ls (p << 1)\n#define rs (ls | 1)\n#define md ((t[p].l + t[p].r) >> 1)\n\n#define vi vector<int>\n#define pb push_back\n#define pq priority_queue\n\n#define dbg(x) cerr << #x " = " << x << endl\n#define debug(...) fprintf(stderr, __VA_ARGS__)\n\n#define fl(x) freopen(x ".in", "r", stdin), freopen(x ".out", "w", stdout)\n\nusing namespace std;\n\nnamespace io {\nconst int SI = 1 << 21 | 1;\nchar IB[SI], *IS, *IT, OB[SI], *OS = OB, *OT = OS + SI - 1, c, ch[100];\nint f, t;\n#define gc() (IS == IT ? (IT = (IS = IB) + fread(IB, 1, SI, stdin), IS == IT ? EOF : *IS++) : *IS++)\ninline void flush() { fwrite(OB, 1, OS - OB, stdout), OS = OB; }\ninline void pc(char x) {\n    *OS++ = x;\n    if (OS == OT)\n        flush();\n}\n\ntemplate <class I>\ninline void rd(I &x) {\n    for (f = 1, c = gc(); c < '0' || c > '9'; c = gc())\n        if (c == '-')\n            f = -1;\n    for (x = 0; c >= '0' && c <= '9'; x = (x << 3) + (x << 1) + (c & 15), c = gc())\n        ;\n    x *= f;\n}\ntemplate <class I>\ninline void rd(I &x, I &y) {\n    rd(x), rd(y);\n}\ntemplate <class I>\ninline void rd(I &x, I &y, I &z) {\n    rd(x), rd(y), rd(z);\n}\ntemplate <class I>\ninline void rda(I *a, int n) {\n    for (int i = 1; i <= n; i++) rd(a[i]);\n}\ninline void rdc(char &c) {\n    for (c = gc(); c < 33 || c > 126; c = gc())\n        ;\n}\ninline void rds(char *s, int &n) {\n    for (c = gc(); c < 33 || c > 126; c = gc())\n        ;\n    for (n = 0; c >= 33 && c <= 126; s[++n] = c, c = gc())\n        ;\n    s[n + 1] = '\\0';\n}\ninline void rds(string &s) {\n    for (c = gc(); c < 33 || c > 126; c = gc())\n        ;\n    for (s.clear(); c >= 33 && c <= 126; s.pb(c), c = gc())\n        ;\n}\n\ntemplate <class I>\ninline void print(I x, char k = '\\n') {\n    if (!x)\n        pc('0');\n    if (x < 0)\n        pc('-'), x = -x;\n    while (x) ch[++t] = x % 10 + '0', x /= 10;\n    while (t) pc(ch[t--]);\n    pc(k);\n}\ntemplate <class I>\ninline void print(I x, I y) {\n    print(x, ' '), print(y);\n}\ntemplate <class I>\ninline void print(I x, I y, I z) {\n    print(x, ' '), print(y, ' '), print(z);\n}\ntemplate <class I>\ninline void printa(I *a, int n) {\n    for (int i = 1; i <= n; i++) print(a[i], " \\n"[i == n]);\n}\ninline void printc(char c) { pc(c); }\ninline void prints(char *s, int n) {\n    for (int i = 1; i <= n; i++) pc(s[i]);\n    pc('\\n');\n}\ninline void prints(string s) {\n    int n = s.length();\n    while (t < n) pc(s[t++]);\n    pc('\\n'), t = 0;\n}\nstruct Flush {\n    ~Flush() { flush(); }\n} flusher;\n}  // namespace io\nusing io::print;\nusing io::printa;\nusing io::printc;\nusing io::prints;\nusing io::rd;\nusing io::rda;\nusing io::rdc;\nusing io::rds;\n\nconst int N = 1e6 + 7;\nint n, m, p[N], ans;\nchar a[N], b[N];\n\nint main() {\n    rds(a, n), rds(b, m);\n    for (int i = 2, j = 0; i <= m; i++) {\n        while (j && b[i] != b[j + 1]) j = p[j];\n        if (b[i] == b[j + 1])\n            ++j;\n        p[i] = j;\n    }\n    for (int i = 1, j = 0; i <= n; i++) {\n        while (j && a[i] != b[j + 1]) j = p[j];\n        if (a[i] == b[j + 1])\n            ++j;\n        ans += j == m;\n    }\n    print(ans);\n    return 0;\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/f66214e349824ae7a715e44840fb213c/main.c:1:25: fatal error: bits/stdc++.h: No such file or directory\\ncompilation terminated."}	alice	111.165.158.111
5bb8da9e55109adc2f2938c2054f8753	\N	30	2020-06-19 06:27:32.724265+00	9	#include <iostream>\n#include <cstdio>\n#include <cstring>\n#include <algorithm>\n\nusing namespace std;\ntypedef long long ll;\ninline int qr() {\n    int ret = 0, f = 0, c = getchar();\n    while (!isdigit(c)) f |= c == 45, c = getchar();\n    while (isdigit(c)) ret = ret * 10 + c - 48, c = getchar();\n    return f ? -ret : ret;\n}\nconst int maxn = 1e6 + 5;\nchar A[maxn], B[maxn];\nint nx[maxn];\n\nint main() {\n    cin >> (B + 1) >> (A + 1);\n    nx[0] = nx[1] = 0;\n    int n = strlen(A + 1);\n    for (int t = 2; t <= n; ++t) {\n        nx[t] = nx[t - 1];\n        while (nx[t] && A[t] != A[nx[t] + 1]) nx[t] = nx[nx[t]];\n        if (A[t] == A[nx[t] + 1])\n            ++nx[t];\n    }\n    int ans = 0;\n    for (int t = 1, p = 0, m = strlen(B + 1); t <= m; ++t) {\n        while (p && A[p + 1] != B[t]) p = nx[p];\n        if (A[p + 1] == B[t])\n            ++p;\n        if (p == n)\n            p = nx[p], ++ans;\n    }\n    cout << ans << endl;\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 2617344, "output": null, "result": 0, "signal": 0, "cpu_time": 38, "exit_code": 0, "real_time": 42, "test_case": "1", "output_md5": "6ea9ab1baa0efb9e19094440c317e21b"}, {"error": 0, "memory": 2658304, "output": null, "result": 0, "signal": 0, "cpu_time": 40, "exit_code": 0, "real_time": 44, "test_case": "2", "output_md5": "1ff1de774005f8da13f42943881c655f"}, {"error": 0, "memory": 2613248, "output": null, "result": 0, "signal": 0, "cpu_time": 38, "exit_code": 0, "real_time": 41, "test_case": "3", "output_md5": "34173cb38f07f89ddbebc2ac9128303f"}, {"error": 0, "memory": 2592768, "output": null, "result": 0, "signal": 0, "cpu_time": 38, "exit_code": 0, "real_time": 46, "test_case": "4", "output_md5": "1c383cd30b7c298ab50293adfecb7b18"}, {"error": 0, "memory": 2498560, "output": null, "result": 0, "signal": 0, "cpu_time": 37, "exit_code": 0, "real_time": 40, "test_case": "5", "output_md5": "6974ce5ac660610b44d9b9fed0ff9548"}, {"error": 0, "memory": 2478080, "output": null, "result": 0, "signal": 0, "cpu_time": 38, "exit_code": 0, "real_time": 41, "test_case": "6", "output_md5": "b3e3e393c77e35a4a3f3cbd1e429b5dc"}, {"error": 0, "memory": 2494464, "output": null, "result": 0, "signal": 0, "cpu_time": 39, "exit_code": 0, "real_time": 42, "test_case": "7", "output_md5": "8fa94712bf8b857038219b93d68e0391"}, {"error": 0, "memory": 2613248, "output": null, "result": 0, "signal": 0, "cpu_time": 40, "exit_code": 0, "real_time": 46, "test_case": "8", "output_md5": "086af0698d224b0572d5e18552c0145e"}, {"error": 0, "memory": 2514944, "output": null, "result": 0, "signal": 0, "cpu_time": 39, "exit_code": 0, "real_time": 42, "test_case": "9", "output_md5": "2dfbacaead65f9fc634c82ee7e3e2e35"}, {"error": 0, "memory": 2494464, "output": null, "result": 0, "signal": 0, "cpu_time": 40, "exit_code": 0, "real_time": 41, "test_case": "10", "output_md5": "c173fb8c47c4d811a2f5f2c1c12b5c33"}]}	C++	f	{"time_cost": 40, "memory_cost": 2658304}	alice	111.165.158.111
dc80022d9a7ac90d7b5b3e13a9983974	\N	27	2020-06-19 06:46:36.695394+00	9	#pragma GCC target("avx")\n#pragma GCC optimize(3)\n#pragma GCC optimize("Ofast")\n#pragma GCC optimize("unroll-loops")\n#include <bits/stdc++.h>\nusing namespace std;\nconst int maxn = 1000005;\nint n, sa[maxn], tax[maxn], rnk[maxn], tp[maxn], h[maxn];\nchar s[maxn];\ninline void SA() {\n    int m = 128, i, p, k, f = 0;\n#define rep(i, l, r) for (i = l; i <= r; i++)\n#define drep(i, l, r) for (i = l; i >= r; i--)\n    rep(i, 1, n) rnk[i] = s[i];\n    rep(i, 1, n) tax[rnk[i]]++;\n    rep(i, 1, m) tax[i] += tax[i - 1];\n    drep(i, n, 1) sa[tax[rnk[i]]--] = i;\n    for (p = 0, k = 1; k < n; m = p, k <<= 1) {\n        p = 0;\n        rep(i, n - k + 1, n) tp[++p] = i;\n        rep(i, 1, n) if (sa[i] > k) tp[++p] = sa[i] - k;\n        rep(i, 1, m) tax[i] = 0;\n        rep(i, 1, n) tax[rnk[i]]++;\n        rep(i, 1, m) tax[i] += tax[i - 1];\n        drep(i, n, 1) sa[tax[rnk[tp[i]]]--] = tp[i];\n        rep(i, 1, n) swap(rnk[i], tp[i]);\n        rnk[sa[1]] = p = 1;\n        rep(i, 2, n) rnk[sa[i]] =\n            (tp[sa[i - 1]] == tp[sa[i]] && tp[sa[i - 1] + k] == tp[sa[i] + k]) ? p : ++p;\n    }\n    rep(i, 1, n) rnk[sa[i]] = i;\n    rep(i, 1, n) {\n        p = sa[rnk[i] - 1];\n        if (f)\n            f--;\n        while (s[i + f] == s[p + f]) f++;\n        h[rnk[i]] = f;\n    }\n}\nint main() {\n    scanf("%s", s + 1);\n    n = strlen(s + 1), SA();\n    for (int i = 1; i <= n; i++) printf("%d ", sa[i]);\n    putchar('\\n');\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 9867264, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 4, "test_case": "1", "output_md5": "d01940034c0fd63160574a56178a47cd"}]}	C++	f	{"time_cost": 1, "memory_cost": 9867264}	alice	111.165.158.111
65d33ae9591112692c70f6d9160c4071	\N	37	2020-06-19 07:44:03.824578+00	10	#include <assert.h> //  assert\n#include <climits>  // INT_MAX\n#include <cstdio>   // freopen\n#include <cstdlib>  // rand()\n#include <fstream>  // ofstream, ifstream, fstream\n#include <iostream>\n#include <string> // string\n#include <vector> // vector\n\nusing namespace std;\n\nclass Solution\n{\npublic:\n    int search(vector<int> &nums, int target)\n    {\n        if (nums.empty())\n            return 0;\n        int n = nums.size();\n        int left = 0, right = n - 1, mid;\n        int x;\n        int y;\n        while (left < right)\n        {\n            mid = (left + right) / 2;\n            if (nums[mid] >= target)\n                right = mid;\n            else\n                left = mid + 1;\n        }\n        if (nums[left] != target)\n            return 0;\n        x = left;\n        right = n;\n        while (left < right)\n        {\n            mid = (left + right) / 2;\n            if (nums[mid] <= target)\n                left = mid + 1;\n            else\n                right = mid;\n        }\n        y = left;\n        return y - x;\n    }\n};\n\nclass CFunctor\n{\n};\n\nclass RandomVector : public CFunctor\n{\npublic:\n    double operator()()\n    {\n        int n = rand() % len_lim;\n        return n;\n    }\n\nprivate:\n    const int len_lim = 50000;\n};\n\nconst int length_lim = 50000;\nvoid gen_test_case(int cnt, Solution so)\n{\n    int len = rand() % length_lim;\n    string s(len, 'a');\n    for (int i = 0; i < len; i++)\n    {\n        int k = rand() % 26;\n        s[i] = 'a' + k;\n    }\n    ofstream out_file, in_file;\n    char in_name[10];\n    char out_name[10];\n    sprintf(in_name, "%d.in", cnt);\n    sprintf(out_name, "%d.out", cnt);\n    in_file.open(in_name, ios::out);\n    out_file.open(out_name, ios::out);\n\n    int n = rand() % length_lim;\n    vector<int> vec(n, 0);\n    int index = rand() % n;\n    in_file << n << endl;\n    int k = 0;\n    // int target = rand() % INT_MAX;\n\n    int start = rand() % 6;\n    int inc = rand() % 10;\n    int val = (start + inc) % INT_MAX;\n    while (k < n)\n    {\n        int rep = rand() % 10;\n        inc = rand() % 10;\n        val = (start + inc) % INT_MAX;\n        start = val;\n        if (k + rep >= n)\n        {\n            // cnt = n - 1 - rep;\n            rep = n - k;\n            for (int i = 0; i < rep; i++)\n            {\n                vec[k + i] = val;\n                in_file << vec[k + i] << " ";\n            }\n            break;\n        }\n        else\n        {\n            for (int i = 0; i < rep; i++)\n            {\n                vec[k + i] = val;\n                in_file << vec[k + i] << " ";\n            }\n        }\n        k += rep;\n    }\n    int target = vec[index];\n    in_file << endl;\n    in_file << target;\n    int res = so.search(vec, target);\n    out_file << res;\n    // cout << so.reverseLeftWords(s, n) << endl;\n    // out_file << so.reverseLeftWords(s, n);\n}\n\nvoid test_case(int cnt, Solution so)\n{\n    ifstream in_file;\n    ifstream out_file;\n    char in_name[10];\n    char out_name[10];\n    sprintf(in_name, "%d.in", cnt);\n    sprintf(out_name, "%d.out", cnt);\n    in_file.open(in_name, ios::in);\n    out_file.open(out_name, ios::out);\n\n    int n;\n    int ans;\n    in_file >> n;\n    vector<int> vec(n, 0);\n    for (int i = 0; i < n; i++)\n    {\n        in_file >> vec[i];\n    }\n    int target;\n    in_file >> target;\n    out_file >> ans;\n    int res = so.search(vec, target);\n    assert(ans == res);\n    // string res = so.reverseLeftWords(s, n);\n    // cout << res << endl;\n    // cout << ans << endl;\n    // cout << ans.compare(res) << endl;\n    // assert(ans == res);\n}\n\nvoid gen_out_file(int le, int ri)\n{\n    Solution so;\n    for (int i = le; i <= ri; i++)\n    {\n        gen_test_case(i, so);\n    }\n}\n\nvoid file_test_case(int le, int ri)\n{\n    Solution so;\n    for (int i = le; i <= ri; i++)\n    {\n        test_case(i, so);\n    }\n}\n\nvoid test_online()\n{\n    int n;\n    cin >> n;\n    vector<int> vec(n, 0);\n    for (int i = 0; i < n; i++)\n    {\n        cin >> vec[i];\n    }\n    int target;\n    cin >> target;\n    Solution so;\n    cout << so.search(vec, target) << endl;\n}\n\nint main()\n{\n    // gen_out_file(3, 10);\n    // file_test_case(1, 2);\n    test_online();\n    return 0;\n}	0	{"err": null, "data": [{"error": 0, "memory": 1470464, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "1", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}, {"error": 0, "memory": 1470464, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 1, "test_case": "2", "output_md5": "cfcd208495d565ef66e7dff9f98764da"}, {"error": 0, "memory": 1601536, "output": null, "result": 0, "signal": 0, "cpu_time": 12, "exit_code": 0, "real_time": 13, "test_case": "3", "output_md5": "8f14e45fceea167a5a36dedd4bea2543"}, {"error": 0, "memory": 1564672, "output": null, "result": 0, "signal": 0, "cpu_time": 7, "exit_code": 0, "real_time": 9, "test_case": "4", "output_md5": "9bf31c7ff062936a96d3c8bd1f8f2ff3"}, {"error": 0, "memory": 1576960, "output": null, "result": 0, "signal": 0, "cpu_time": 8, "exit_code": 0, "real_time": 10, "test_case": "5", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}, {"error": 0, "memory": 1548288, "output": null, "result": 0, "signal": 0, "cpu_time": 6, "exit_code": 0, "real_time": 7, "test_case": "6", "output_md5": "c74d97b01eae257e44aa9d5bade97baf"}, {"error": 0, "memory": 1589248, "output": null, "result": 0, "signal": 0, "cpu_time": 9, "exit_code": 0, "real_time": 12, "test_case": "7", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 1478656, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 2, "test_case": "8", "output_md5": "c81e728d9d4c2f636f067f89cc14862c"}, {"error": 0, "memory": 1556480, "output": null, "result": 0, "signal": 0, "cpu_time": 7, "exit_code": 0, "real_time": 8, "test_case": "9", "output_md5": "1679091c5a880faf6fb5e6087eb1b2dc"}, {"error": 0, "memory": 1527808, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 6, "test_case": "10", "output_md5": "aab3238922bcc25a6f606eb525ffdc56"}]}	C++	f	{"time_cost": 12, "memory_cost": 1601536}	dengluo	111.77.220.210
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public."user" (id, password, last_login, username, email, create_time, admin_type, reset_password_token, reset_password_token_expire_time, auth_token, two_factor_auth, tfa_token, open_api, open_api_appkey, is_disabled, problem_permission, session_keys) FROM stdin;
11	pbkdf2_sha256$120000$R5TBzVdjTLM1$gjeaXRNXecrI1cvtyN2elBcdnt9a4X9cTN/xIpjJ190=	2020-06-16 13:10:37.32853+00	admin	1678346082@qq.com	2020-06-16 13:10:18.912537+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["magcbszcg6qe2hg9xnj5n599s1cd9yfg"]
7	pbkdf2_sha256$120000$OKLaTzUmE3KG$Fnr/0oDTU/lFXlGTQ4PL2oDCemXEOCP/7kW9SI7mQAc=	2020-06-15 12:58:30.44022+00	姜焕煜	2498186017@qq.com	2020-06-15 12:54:07.751303+00	Regular User	\N	\N	\N	f	af43038bba9de556acff6d407f850859	f	\N	f	None	["4dceb8wykys4i2v5wo0afpfbmwv5b9ig"]
2	pbkdf2_sha256$120000$XgvzH1GaHnFx$PJQ365lidek6kxfRtlFeozDkBtqXxd0/dFz6QBaMQJ8=	2020-06-18 15:27:33.772525+00	seanxiao	vcfcxdr@163.com	2020-06-15 01:37:34.394614+00	Admin	ebbdf334e897ca80997f8531b3b061a5	2020-06-15 01:59:15.333656+00	\N	f	\N	f	\N	f	Own	["475yvh3nq8nz89z0lipslj55bpl7kbfh", "t78g4dr14qshry6fl4cshp6j553xeezu", "orcx6v7aeqraocfdyxfuk95siiuav9hh", "cnqv7gashckbcq9tntjr5cjc5wb6bl8m", "r6f0mdas0ddvgege0q579ilusqq074qc"]
12	pbkdf2_sha256$120000$JhW4eCrkNwsY$TLVOAzibMzNKPhi0IX5hyePiUMWYEcdU+dh1Wvvjbps=	2020-06-16 17:53:53.929223+00	tsj	jack_15271149@buaa.edu.cn	2020-06-16 17:49:34.237012+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["lzz285xmai7mscy8w4gyq756n56p8qso"]
8	pbkdf2_sha256$120000$jTlZHzzhlLpF$t3GfxKwUnDfX/+/xtqZUsjSZJyvi9SVCvAWm+NVD7ng=	2020-06-15 15:42:40.124526+00	zhangzhiyuan	1944503821@qq.com	2020-06-15 15:02:14.795783+00	Admin	\N	\N	\N	f	\N	f	\N	f	Own	["v5lwq71mbbmthehnrajfn3yh1f4q3nuj", "5mo4vwey5jol3annwzjxde9vorm21sxs"]
14	pbkdf2_sha256$120000$fREBW4qibONb$Roc6r9NwhkD9GVYd30IRUqiiHOFDOHutUGJdNZrk/Vg=	2020-06-19 06:55:18.055744+00	pku_zbt	bit_pku_zbt@163.com	2020-06-19 06:54:52.766836+00	Admin	\N	\N	\N	f	1bd0b5f34ecaec42cd18151c4c43413f	f	\N	f	Own	["ab5ikvpptc3uh0x2kyiuhzszwj55uvcf"]
5	pbkdf2_sha256$120000$nr6wIL32otNK$Oq0+b4ZzO3pVLesWIMkpUjibD9M4Hct9KSDfAc6Kq8s=	2020-06-15 02:15:31.213133+00	fightcg	2446148151@qq.com	2020-06-15 02:15:25.053966+00	Regular User	\N	\N	\N	f	8214222e41b58d4d169138a56308bd7f	f	\N	f	None	["2f0dkzdl2gzz8pce68vvcqjxmv8p2uk1"]
1	pbkdf2_sha256$120000$HgK739prkXJW$BX95otSLhZuhdUD1Jv2VPQDszXeKR6KIqB6GCUmQlvM=	2020-06-18 09:31:50.838822+00	root	499871835@qq.com	2020-06-14 17:10:39.805671+00	Super Admin	\N	\N	\N	f	\N	f	\N	f	All	["57wv99y8i5ecbxtwtp981zkt88z1j02x"]
4	pbkdf2_sha256$120000$xj4hI4N01Q9a$MF+bSGqd4fg0uapxngn2xpTZJ3tOQp/5cqK5SJr5uq4=	2020-06-15 02:03:17.446973+00	姚云峰	2381510397@qq.com	2020-06-15 02:02:55.417867+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["jx15oxzaidd9l5hyf423kxdque2ksmy8"]
3	pbkdf2_sha256$120000$gsqax1tTJKuj$ijz+kR6dRL6dYXNtI8xOHZkzsWqTEa7qqNFdKepZlv8=	2020-06-19 03:11:52.585734+00	douzefan	941131649@qq.com	2020-06-15 01:39:06.062537+00	Admin	\N	\N	\N	f	93de2df7563b7adaf3b98d3faad7cf2c	f	\N	f	Own	["zfvlcyze3nr82yoocgotianwmiioqo1a", "tetx9nnarmbtc1ic7bs22lyohss595y6", "4ny5u2dyfrvcoswgiymglobafhoim94h"]
6	pbkdf2_sha256$120000$VlizhlHoy8Kb$1dWZNCeo1iGvKGkFTeNiOUdGsXg8UP0JQD5IoF1jQyg=	2020-06-15 03:25:56.781466+00	zhangqx	zhangqx@ss.pku.edu.cn	2020-06-15 03:25:49.668262+00	Super Admin	\N	\N	\N	f	\N	f	\N	f	All	["p0f59gfy4me6ci4ivt66f95nakmgc8t8"]
9	pbkdf2_sha256$120000$jkEqoDqpiSiX$6lCoQ0/6ZKMhkf0O4EYXHs70zVLw5/CuMk/eZuEyf38=	2020-06-16 03:15:05.421537+00	alice	18722511715@163.com	2020-06-16 02:54:37.904055+00	Admin	\N	\N	\N	f	\N	f	\N	f	Own	["3asfz3p9yoggug7g3wq8dnsjrivwmxe3"]
13	pbkdf2_sha256$120000$cUxUw9DZhHo1$BbdIDwLPqoW8p6FzhJa9P2Vd3ng4LRgRdyKH3M8Hcpc=	2020-06-18 14:31:04.937878+00	lanweipeng	18459111547@163.com	2020-06-18 14:30:16.658476+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["u5ep62wc71g89cky6wrpnis2nni658xq"]
10	pbkdf2_sha256$120000$nzgEt2dUcfKh$nq0j8rZ2jYJhrsscKsIsFlR16fRYeW+OYOGZlg3fbgE=	2020-06-19 05:11:56.757746+00	dengluo	3391131052@qq.com	2020-06-16 11:42:32.646325+00	Admin	\N	\N	\N	f	\N	f	\N	f	Own	["ewvyunsse2opuyuudxqitzygv1ex3q5w"]
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.user_profile (id, acm_problems_status, avatar, blog, mood, accepted_number, submission_number, github, school, major, user_id, total_score, oi_problems_status, real_name, language) FROM stdin;
3	{"problems": {"1": {"_id": "0", "status": 0}, "2": {"_id": "1", "status": 0}, "14": {"_id": "10021", "status": 0}, "15": {"_id": "10022", "status": 0}, "16": {"_id": "10023", "status": 0}, "17": {"_id": "10024", "status": 0}, "18": {"_id": "10025", "status": 0}, "19": {"_id": "10026", "status": 0}, "20": {"_id": "10027", "status": 0}, "21": {"_id": "10028", "status": 0}}}	/public/avatar/default.png	\N	\N	12	19	\N	\N	\N	3	200	{"problems": {"3": {"_id": "11", "score": 100, "status": 0}, "4": {"_id": "122", "score": 100, "status": 0}}}	窦泽帆	en-US
13	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	13	0	{}	\N	\N
11	{"problems": {"1": {"_id": "0", "status": 0}}}	/public/avatar/default.png	\N	\N	1	1	\N	\N	\N	11	0	{}	\N	\N
9	{"problems": {"1": {"_id": "0", "status": 0}, "27": {"_id": "10042", "status": 0}, "28": {"_id": "10043", "status": -2}, "29": {"_id": "10044", "status": -2}, "30": {"_id": "10045", "status": 0}, "31": {"_id": "10046", "status": 0}, "33": {"_id": "10047", "status": 0}, "34": {"_id": "10048", "status": 0}, "35": {"_id": "10049", "status": 0}, "36": {"_id": "10050", "status": 0}}}	/public/avatar/default.png	\N	\N	8	16	\N	\N	\N	9	0	{"problems": {"26": {"_id": "10041", "score": 0, "status": -2}}}	\N	\N
8	{"problems": {"1": {"_id": "0", "status": 0}, "2": {"_id": "1", "status": -2}, "4": {"_id": "122", "status": 0}}}	/public/avatar/default.png	\N	\N	4	47	\N	\N	\N	8	200	{"problems": {"3": {"_id": "11", "score": 100, "status": 0}, "4": {"_id": "122", "score": 100, "status": 0}}}	\N	\N
4	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	4	0	{}	\N	\N
2	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	2	0	{}	\N	\N
1	{"problems": {"1": {"_id": "0", "status": 0}, "22": {"_id": "10051", "status": 0}, "23": {"_id": "10052", "status": 0}, "24": {"_id": "10053", "status": 0}}}	/public/avatar/default.png	\N	\N	4	8	\N	\N	\N	1	0	{}	pkussoj	zh-CN
10	{"problems": {"1": {"_id": "0", "status": 0}, "32": {"_id": "10031", "status": 0}, "37": {"_id": "10032", "status": 0}}}	/public/avatar/default.png	\N	\N	3	8	\N	\N	\N	10	0	{}	\N	\N
12	{"problems": {"1": {"_id": "0", "status": -2}}}	/public/avatar/default.png	\N	\N	0	5	\N	\N	\N	12	0	{}	\N	\N
5	{"problems": {"1": {"_id": "0", "status": 0}}}	/public/avatar/default.png	\N	\N	1	4	\N	\N	\N	5	0	{}	\N	zh-CN
14	{"problems": {"1": {"_id": "0", "status": 0}}}	/public/avatar/default.png	\N	\N	1	7	\N	\N	\N	14	0	{}	\N	\N
7	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	7	0	{}	\N	\N
6	{"problems": {"1": {"_id": "0", "status": 0}}}	/public/avatar/default.png	\N	\N	1	2	\N	\N	\N	6	0	{}	\N	\N
\.


--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.acm_contest_rank_id_seq', 1, false);


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.announcement_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: contest_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_announcement_id_seq', 1, false);


--
-- Name: contest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: judge_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.judge_server_id_seq', 2, true);


--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.oi_contest_rank_id_seq', 1, false);


--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.options_sysoptions_id_seq', 10, true);


--
-- Name: problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_id_seq', 38, true);


--
-- Name: problem_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tag_id_seq', 19, true);


--
-- Name: problem_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tags_id_seq', 78, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_id_seq', 14, true);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 14, true);


--
-- Name: acm_contest_rank acm_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: acm_contest_rank acm_contest_rank_user_id_contest_id_26151d10_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_contest_id_26151d10_uniq UNIQUE (user_id, contest_id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: contest_announcement contest_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_pkey PRIMARY KEY (id);


--
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_dramatiq_task django_dramatiq_task_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_dramatiq_task
    ADD CONSTRAINT django_dramatiq_task_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: judge_server judge_server_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server
    ADD CONSTRAINT judge_server_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_user_id_contest_id_fe51a302_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_contest_id_fe51a302_uniq UNIQUE (user_id, contest_id);


--
-- Name: options_sysoptions options_sysoptions_key_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_key_key UNIQUE (key);


--
-- Name: options_sysoptions options_sysoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_pkey PRIMARY KEY (id);


--
-- Name: problem problem__id_contest_id_346645fe_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem__id_contest_id_346645fe_uniq UNIQUE (_id, contest_id);


--
-- Name: problem problem_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_pkey PRIMARY KEY (id);


--
-- Name: problem_tag problem_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag
    ADD CONSTRAINT problem_tag_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_problem_id_problemtag_id_318459d1_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_problemtag_id_318459d1_uniq UNIQUE (problem_id, problemtag_id);


--
-- Name: submission submission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_key UNIQUE (user_id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: acm_contest_rank_contest_id_21030ccd; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_contest_id_21030ccd ON public.acm_contest_rank USING btree (contest_id);


--
-- Name: acm_contest_rank_user_id_40391ab2; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_user_id_40391ab2 ON public.acm_contest_rank USING btree (user_id);


--
-- Name: announcement_created_by_id_359ccf50; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX announcement_created_by_id_359ccf50 ON public.announcement USING btree (created_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: contest_announcement_contest_id_a8cb419f; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_contest_id_a8cb419f ON public.contest_announcement USING btree (contest_id);


--
-- Name: contest_announcement_created_by_id_469a14ce; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_created_by_id_469a14ce ON public.contest_announcement USING btree (created_by_id);


--
-- Name: contest_created_by_id_a763ca7e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_created_by_id_a763ca7e ON public.contest USING btree (created_by_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oi_contest_rank_contest_id_171fcdaf; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_contest_id_171fcdaf ON public.oi_contest_rank USING btree (contest_id);


--
-- Name: oi_contest_rank_user_id_0ba36852; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_user_id_0ba36852 ON public.oi_contest_rank USING btree (user_id);


--
-- Name: problem__id_919b1d80; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem__id_919b1d80 ON public.problem USING btree (_id);


--
-- Name: problem_contest_id_328e013a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_contest_id_328e013a ON public.problem USING btree (contest_id);


--
-- Name: problem_created_by_id_cb362143; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_created_by_id_cb362143 ON public.problem USING btree (created_by_id);


--
-- Name: problem_tags_problem_id_866ecb8d; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problem_id_866ecb8d ON public.problem_tags USING btree (problem_id);


--
-- Name: problem_tags_problemtag_id_72d20571; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problemtag_id_72d20571 ON public.problem_tags USING btree (problemtag_id);


--
-- Name: submission_contest_id_775716d5; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_contest_id_775716d5 ON public.submission USING btree (contest_id);


--
-- Name: submission_problem_id_76847b55; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_problem_id_76847b55 ON public.submission USING btree (problem_id);


--
-- Name: submission_result_37e2f67a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_result_37e2f67a ON public.submission USING btree (result);


--
-- Name: submission_user_id_3779a8c1; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_user_id_3779a8c1 ON public.submission USING btree (user_id);


--
-- Name: acm_contest_rank acm_contest_rank_contest_id_21030ccd_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_contest_id_21030ccd_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acm_contest_rank acm_contest_rank_user_id_40391ab2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_40391ab2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: announcement announcement_created_by_id_359ccf50_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_created_by_id_359ccf50_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_contest_id_a8cb419f_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_contest_id_a8cb419f_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_created_by_id_469a14ce_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_created_by_id_469a14ce_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest contest_created_by_id_a763ca7e_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_created_by_id_a763ca7e_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_contest_id_171fcdaf_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_contest_id_171fcdaf_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_user_id_0ba36852_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_0ba36852_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_contest_id_328e013a_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_contest_id_328e013a_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_created_by_id_cb362143_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_created_by_id_cb362143_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problem_id_866ecb8d_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_866ecb8d_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problemtag_id_72d20571_fk_problem_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problemtag_id_72d20571_fk_problem_tag_id FOREIGN KEY (problemtag_id) REFERENCES public.problem_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_contest_id_775716d5_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_contest_id_775716d5_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_problem_id_76847b55_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_problem_id_76847b55_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 10.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

